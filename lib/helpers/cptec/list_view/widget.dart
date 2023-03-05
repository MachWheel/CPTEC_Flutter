import 'package:flutter/material.dart';

import 'components.dart';

ListView forecastListView(Map<String, dynamic> forecasts) {
  List<Card> children = [];
  forecasts.forEach((weekday, fcast) {
    children.add(
      _forecastCard(weekday, fcast),
    );
  });
  return ListView(
    shrinkWrap: true,
    children: children,
  );
}

Card _forecastCard(String weekday, Map<String, dynamic> fcast) {
  return Card(
    margin: const EdgeInsets.only(
      left: 5,
      top: 5,
      right: 5,
      bottom: 10,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Text(
          fcast['weather'],
          style: const TextStyle(fontSize: 48),
        ),
        title: Text(
          weekday,
          style: const TextStyle(fontSize: 18),
        ),
        subtitle: temperatureColumn(fcast),
        trailing: uviColumn(fcast),
      ),
    ),
  );
}
