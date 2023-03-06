import 'package:flutter/material.dart';

class LoadingForecasts extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => LoadingForecasts(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingForecasts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Card(
            child: _layout(),
          ),
        ));
  }

  Column _layout() {
    return Column(
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
          "Carregando previsões...",
          style: TextStyle(fontSize: 36),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
