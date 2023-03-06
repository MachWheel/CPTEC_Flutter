import 'package:flutter/material.dart';

import 'forecast_form.dart';

class SuccessScreen extends StatelessWidget {
  final Map<String, dynamic> results;

  const SuccessScreen(this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.coffee_rounded, size: 100),
            const SizedBox(height: 10),
            Text(
              '${results["cityName"]} - ${results["district"]} = ${results["cityCode"]}',
              style: const TextStyle(fontSize: 24, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const ForecastForm())),
              icon: const Icon(Icons.replay),
              label: const Text('De novo'),
            ),
          ],
        ),
      ),
    );
  }
}
