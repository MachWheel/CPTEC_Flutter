import 'package:flutter/material.dart';

Scaffold scaffoldErrorOcurred(AsyncSnapshot<String> snapshot) {
  return Scaffold(
    body: Center(
      child: Column(
        children: <Widget>[
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Erro: ${snapshot.error}'),
          ),
        ],
      ),
    ),
  );
}
