
import 'package:flutter/material.dart';

import 'forecast_form.dart';
import '../cptec/list_view/widget.dart';

class ForecastResults extends StatelessWidget {
  final Map<String, dynamic> results;

  const ForecastResults(this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "${results['cityName']} - ${results['district']}",
          ),
        ),
      ),
      body: Column(
        children: [
          forecastListView(results['forecasts']),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const ForecastForm())),
            icon: const Icon(Icons.replay),
            label: const Text('Previsões para outro município'),
          ),
        ],
      ),
    );
  }
}
