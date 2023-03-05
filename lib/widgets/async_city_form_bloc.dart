import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../helpers/brazil_cities.dart';

class AsyncCityFormBloc extends FormBloc<String, String> {
  final brazilCities = BrazilCities.init();

  final cityName = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      _min3Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 1000),
    suggestions: BrazilCities.getSuggestions,
  );

  AsyncCityFormBloc() {
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
    final result = await brazilCities
        .then((instance) => instance.validCityInput(cityName));
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
