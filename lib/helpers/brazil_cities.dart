import 'parsers.dart';

class BrazilCities {
  List<String>? rawList;
  List<String>? clearList;

  static Future<BrazilCities> init() async {
    var brazilCities = BrazilCities();
    brazilCities.rawList = await _getRawList();
    brazilCities.clearList = [
      for (var x in brazilCities.rawList!) clearPtBrString(x)
    ];
    return brazilCities;
  }

  static Future<List<String>> getSuggestions(String? target) async {
    if (target == null || target == '') {
      return [];
    }
    final rawList = await _getRawList();
    List<String> suggs = [];
    for (String city in rawList) {
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
    return clearList!.contains(target);
  }

  static Future<List<String>> _getRawList() async {
    final rawList = await parsedJsonList("assets/data/br_cities.json");
    return rawList;
  }
}
