import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import './components/loading_cities.dart';
import './components/error_ocurred.dart';
import './components/cities.dart';
import './components/search_form.dart';
import './form_bloc.dart';

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
              return scaffoldSearchForm(formBloc);
            }),
          );
        } else if (snapshot.hasError) {
          rendered = scaffoldErrorOcurred(snapshot);
        } else {
          rendered = scaffoldLoadingCities();
        }
        return rendered;
      },
    );
  }
}
