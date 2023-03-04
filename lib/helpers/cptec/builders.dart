import 'package:flutter/material.dart';

import 'labels.dart';

List<DataColumn> forecastDataColumns() {
  List<DataColumn> dataCols = [];
  for (String header in tableHeaders.values) {
    dataCols.add(
      DataColumn(
        label: Expanded(
          child: Text(
            header,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
  return dataCols;
}

List<DataRow> forecastDataRows(List<Map<String, dynamic>> forecasts) {
  List<DataRow> dataRows = [];
  for (Map<String, dynamic> fcast in forecasts) {
    List<DataCell> cells =
        fcast.values.map((x) => DataCell(Text(x.toString()))).toList();
    dataRows.add(
      DataRow(
        cells: cells,
      ),
    );
  }
  return dataRows;
}
