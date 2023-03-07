import 'package:flutter/material.dart';

class TabletView extends StatelessWidget {
  const TabletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(flex: 1, child: Container(color: Colors.red)),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.blue)),
                Expanded(child: Container(color: Colors.yellow)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
