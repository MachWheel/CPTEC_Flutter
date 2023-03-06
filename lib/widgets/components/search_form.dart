import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../cptec/service/api.dart';
import '../forecast_form_bloc.dart';
import '../forecast_results.dart';

import './loading_forecasts.dart';

Scaffold scaffoldSearchForm(ForecastFormBloc formBloc) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      title: const Text('⚒️  Previsões CPTEC MVP'),
    ),
    body: FormBlocListener<ForecastFormBloc, String, String>(
      onSubmitting: (context, state) {
        LoadingForecasts.show(context);
      },
      onSubmissionFailed: (context, state) {
        LoadingForecasts.hide(context);
      },
      onSuccess: (context, state) {
        final cityName = formBloc.cityName.value;
        getCityForecasts(cityName).then((value) {
          LoadingForecasts.hide(context);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => ForecastResults(value),
            ),
          );
        });
      },
      onFailure: (context, state) {
        LoadingForecasts.hide(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.failureResponse!)),
        );
      },
      child: _searchFormScrollView(formBloc),
    ),
  );
}

Padding _searchFormScrollView(ForecastFormBloc formBloc) {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Column(
      children: <Widget>[
        _searchFormInput(formBloc),
        _searchFormSubmitButton(formBloc),
      ],
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
