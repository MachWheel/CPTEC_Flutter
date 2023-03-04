import 'package:flutter/material.dart';
import '../helpers/cptec/builders.dart';
import 'async_city_form.dart';

class ForecastResults extends StatelessWidget {
  final Map<String, dynamic> results;

  const ForecastResults(this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(results['cityName']))),
      body: Column(
        children: [
          DataTable(
            columns: forecastDataColumns(),
            rows: forecastDataRows(results['forecasts']),
          ),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const AsyncCityForm())),
            icon: const Icon(Icons.replay),
            label: const Text('De novo'),
          ),
        ],
      ),
    );
  }
}
