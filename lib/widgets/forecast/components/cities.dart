import '../../../helpers/parsers.dart';

late List<String> rawCities;
late List<String> clearCities;

Future<String> loadCities() async {
  rawCities = await parsedJsonList("assets/data/br_cities.json");
  clearCities = [for (var x in rawCities) clearPtBrString(x)];
  return "loaded";
}

Future<List<String>> getSuggestions(String? target) async {
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

bool validCityInput(String? target) {
  if (target == null || target.isEmpty) {
    return false;
  }
  target = clearPtBrString(target);
  return clearCities.contains(target);
}
