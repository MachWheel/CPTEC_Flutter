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

List<Map<String, dynamic>> forecastResults(Iterable<XmlElement> fcastNodes) {
  List<Map<String, dynamic>> parsed = [];
  for (final fcast in fcastNodes) {
    final dateString = fcast.findElements('dia').first.text;
    final weatherCode = fcast.findElements('tempo').first.text;
    final uvi = double.parse(fcast.findElements('iuv').first.text);
    final uviEmoji = weatherUviEmoji(uvi);
    parsed.add({
      "date": brWeekday(dateString),
      "weather": weatherEmojis[weatherCode],
      "cmax": int.parse(fcast.findElements('maxima').first.text),
      "cmin": int.parse(fcast.findElements('minima').first.text),
      "uvi": uviEmoji,
    });
  }
  return parsed;
}

String brWeekday(String dateString) {
  final int weekday = DateTime.parse(dateString).weekday;
  const Map<int, String> weekdays = {
    1: "Seg",
    2: "Ter",
    3: "Qua",
    4: "Qui",
    5: "Sex",
    6: "Sab",
    7: "Dom"
  };
  return weekdays[weekday]!;
}
