import 'package:firstflutter/helpers/cptec/parsers.dart';
import 'package:xml/xml.dart';
import '../parsers.dart';
import 'endpoints.dart';

Future<Map<String, dynamic>> getCityForecasts(String cityName) async {
  return _cityCode(cityName).then((value) => _cityForecasts(value));
}

Future<int> _cityCode(String cityName) async {
  final String city = clearPtBrString(cityName);
  final url = cityCodeUrl(city);
  final XmlDocument document = await requestXmlDocument(url);
  final XmlElement cityNode = document.findAllElements('cidade').first;
  final int cityCode = int.parse(cityNode.findElements('id').first.text);
  return cityCode;
}

Future<Map<String, dynamic>> _cityForecasts(int cityCode) async {
  final url = cityForecastsUrl(cityCode);
  final XmlDocument document = await requestXmlDocument(url);
  final XmlElement cityNode = document.findAllElements('cidade').first;
  final String cityName = cityNode.findElements('nome').first.text;
  final String district = cityNode.findElements('uf').first.text;
  final String updated = cityNode.findElements('atualizacao').first.text;
  final Iterable<XmlElement> fcastNodes = document.findAllElements('previsao');
  final Map<String, dynamic> forecasts = forecastResults(fcastNodes);
  return {
    "cityCode": cityCode,
    "cityName": cityName,
    "district": district,
    "updated": DateTime.parse(updated),
    "forecasts": forecasts
  };
}
