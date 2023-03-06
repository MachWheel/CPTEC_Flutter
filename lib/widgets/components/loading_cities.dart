import 'package:flutter/material.dart';

Scaffold scaffoldLoadingCities() {
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "☁️",
          style: TextStyle(fontSize: 36),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(12.0),
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
        const Text(
          "Carregando municípios...",
          style: TextStyle(fontSize: 36),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
