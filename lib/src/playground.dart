import 'package:flutter/material.dart';
import 'package:playground/src/features/features.dart';

class Playground extends StatelessWidget {
  const Playground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Playground',
      home: Features(),
    );
  }
}
