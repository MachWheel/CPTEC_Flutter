import 'package:flutter/material.dart';

import '../labels.dart';

Column uviColumn(Map<String, dynamic> fcast) {
  return Column(
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
  );
}

Column temperatureColumn(Map<String, dynamic> fcast) {
  return Column(
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
  );
}
