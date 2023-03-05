import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../helpers/parsers.dart';

late List<String> rawCities;
late List<String> clearCities;

Future<String> loadCities() async {
  rawCities = await parsedJsonList("assets/data/br_cities.json");
  clearCities = [for (var x in rawCities) clearPtBrString(x)];
  return "loaded";
}

Future<List<String>> _getSuggestions(String? target) async {
  if (target == null || target == '') {
    return [];
  }
  List<String> suggs = [];
  for (String city in rawCities) {
    if (clearPtBrString(city).contains(clearPtBrString(target))) {
      suggs.add(city);
    }
  }
  return suggs;
}

bool _validCityInput(String? target) {
  if (target == null || target.isEmpty) {
    return false;
  }
  target = clearPtBrString(target);
  return clearCities.contains(target);
}

class AsyncCityFormBloc extends FormBloc<String, String> {
  final cityName = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      _min3Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 1000),
    suggestions: _getSuggestions,
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
    final result = _validCityInput(cityName);
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
