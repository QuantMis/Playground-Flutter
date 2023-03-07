import 'package:flutter/material.dart';

class PgImage extends StatelessWidget {
  final String path;
  const PgImage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.fill,
    );
  }
}
