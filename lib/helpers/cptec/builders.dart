import 'package:flutter/material.dart';

import 'labels.dart';

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
      top: 5,
      left: 5,
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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${tableHeaders['cmax']} ${fcast['cmax']} °C",
              style: const TextStyle(color: Colors.redAccent),
            ),
            Text(
              "${tableHeaders['cmin']} ${fcast['cmin']} °C",
              style: const TextStyle(color: Colors.blueAccent),
            ),
          ],
        ),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(tableHeaders['uvi']!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                fcast['uvi'],
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
