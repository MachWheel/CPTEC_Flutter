import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

import 'widgets/forecast/form.dart';

void main() => runApp(start());

MaterialApp start() {
  return const MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      Locale('pt', 'BR'),
    ],
    home: App(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForecastForm(),
    );
  }
}
