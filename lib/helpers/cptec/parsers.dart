import 'dart:convert';

import 'package:requests/requests.dart';
import 'package:xml/xml.dart';
import 'labels.dart';

Future<XmlDocument> requestXmlDocument(String url) async {
  final req = await Requests.get(url);
  req.raiseForStatus();
  final String result = (latin1.decode(req.bodyBytes));
  return XmlDocument.parse(result);
}

Map<String, dynamic> forecastResults(Iterable<XmlElement> fcastNodes) {
  Map<String, dynamic> parsed = {};
  for (final fcast in fcastNodes) {
    final dateString = fcast.findElements('dia').first.text;
    final weatherCode = fcast.findElements('tempo').first.text;
    final uvi = double.parse(fcast.findElements('iuv').first.text);
    final uviEmoji = weatherUviEmoji(uvi);
    final weekday = brWeekday(dateString);

    parsed[weekday] = {
      "weather": weatherEmojis[weatherCode],
      "cmax": int.parse(fcast.findElements('maxima').first.text),
      "cmin": int.parse(fcast.findElements('minima').first.text),
      "uvi": uviEmoji,
    };
  }
  return parsed;
}

String brWeekday(String dateString) {
  final int weekday = DateTime.parse(dateString).weekday;
  const Map<int, String> weekdays = {
    1: "Segunda-feira",
    2: "Terça-feira",
    3: "Quarta-feira",
    4: "Quinta-feira",
    5: "Sexta-feira",
    6: "Sábado",
    7: "Domingo"
  };
  return weekdays[weekday]!;
}
