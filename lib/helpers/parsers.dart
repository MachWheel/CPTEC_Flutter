import 'dart:convert';
import 'package:flutter/services.dart';

String clearPtBrString(String input) {
  return input
      .toLowerCase()
      .replaceAll(RegExp(r"[`´']"), '')
      .replaceAll(RegExp(r'["]'), '')
      .replaceAll(RegExp(r'[áàâãä]'), 'a')
      .replaceAll(RegExp(r'[éèêë]'), 'e')
      .replaceAll(RegExp(r'[íìîï]'), 'i')
      .replaceAll(RegExp(r'[óòôõö]'), 'o')
      .replaceAll(RegExp(r'[úùûü]'), 'u')
      .replaceAll(RegExp(r'[ç]'), 'c');
}

Future<List<String>> parsedJsonList(String filePath) async {
  final jsonString = await rootBundle.loadString(filePath);
  final List<dynamic> jsonList = json.decode(jsonString);
  final List<String> stringList =
      jsonList.map((item) => item.toString()).toList();
  return stringList.toSet().toList();
}
