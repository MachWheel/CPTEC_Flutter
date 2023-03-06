import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../cptec/service/api.dart';
import 'forecast_form_bloc.dart';
import 'forecast_results.dart';
import 'loading_dialog.dart';

class ForecastForm extends StatefulWidget {
  const ForecastForm({Key? key}) : super(key: key);

  @override
  State<ForecastForm> createState() => _ForecastFormState();
}

class _ForecastFormState extends State<ForecastForm> {
  final Future<String> _brazilCities = loadCities();

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: _futureBuilder(),
    );
  }

  FutureBuilder<String> _futureBuilder() {
    return FutureBuilder<String>(
      future: _brazilCities,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        Widget rendered;
        if (snapshot.hasData) {
          rendered = BlocProvider(
            create: (context) => ForecastFormBloc(),
            child: Builder(builder: (context) {
              final formBloc = context.read<ForecastFormBloc>();
              return _scaffoldSearchForm(formBloc);
            }),
          );
        } else if (snapshot.hasError) {
          rendered = _scaffoldErrorOcurred(snapshot);
        } else {
          rendered = _scaffoldLoadingCities();
        }
        return rendered;
      },
    );
  }

  Scaffold _scaffoldErrorOcurred(AsyncSnapshot<String> snapshot) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Erro: ${snapshot.error}'),
          ),
        ],
      ),
    );
  }

  Scaffold _scaffoldLoadingCities() {
    return Scaffold(
      body: Column(
        children: const <Widget>[
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text('Carregando municípios...'),
          ),
        ],
      ),
    );
  }

  Scaffold _scaffoldSearchForm(ForecastFormBloc formBloc) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('⚒️  Previsões CPTEC MVP'),
      ),
      body: FormBlocListener<ForecastFormBloc, String, String>(
        onSubmitting: (context, state) {
          LoadingDialog.show(context);
        },
        onSubmissionFailed: (context, state) {
          LoadingDialog.hide(context);
        },
        onSuccess: (context, state) {
          LoadingDialog.hide(context);
          final cityName = formBloc.cityName.value;
          getCityForecasts(cityName).then((value) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => ForecastResults(value)));
          });
        },
        onFailure: (context, state) {
          LoadingDialog.hide(context);

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.failureResponse!)));
        },
        child: _searchFormScrollView(formBloc),
      ),
    );
  }

  SingleChildScrollView _searchFormScrollView(ForecastFormBloc formBloc) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          _searchFormInput(formBloc),
          _searchFormSubmitButton(formBloc),
        ],
      ),
    );
  }

  ElevatedButton _searchFormSubmitButton(ForecastFormBloc formBloc) {
    return ElevatedButton(
      onPressed: formBloc.submit,
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          '☁️ Obter previsões',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Padding _searchFormInput(ForecastFormBloc formBloc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFieldBlocBuilder(
        textFieldBloc: formBloc.cityName,
        suffixButton: SuffixButton.asyncValidating,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: 'Nome do Município',
          prefixIcon: Icon(Icons.location_city),
        ),
      ),
    );
  }
}
