import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playground/src/features/features.dart';

class Playground extends StatelessWidget {
  const Playground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Playground',
      home: Features(),
    );
  }
}
