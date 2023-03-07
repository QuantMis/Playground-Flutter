import 'package:flutter/material.dart';

class PgText extends StatelessWidget {
  final String value;
  final double size;
  final FontWeight weight;
  final Color color;
  const PgText(
      {Key? key,
      required this.value,
      required this.size,
      required this.weight,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    );
  }
}
