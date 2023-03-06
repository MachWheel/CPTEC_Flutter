
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import './components/cities.dart';

class ForecastFormBloc extends FormBloc<String, String> {
  final cityName = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      _min3Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 1000),
    suggestions: getSuggestions,
  );

  ForecastFormBloc() {
    addFieldBlocs(fieldBlocs: [cityName]);

    cityName.addAsyncValidators(
      [_checkCityName],
    );
  }

  static String? _min3Char(String? cityName) {
    if (cityName!.length < 3) {
      return 'Nome muito curto';
    }
    return null;
  }

  Future<String?> _checkCityName(String? cityName) async {
    final result = validCityInput(cityName);
    if (result == false) {
      return 'Essa cidade não existe';
    }
    return null;
  }

  @override
  void onSubmitting() async {
    try {
      emitSuccess();
    } catch (e) {
      emitFailure();
    }
  }
}
