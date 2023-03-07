import 'package:flutter/material.dart';
import 'package:playground/core/theme/pallete.dart';
import 'package:playground/src/features/responsive/utils/responsive.dart';
import 'package:playground/src/features/responsive/views/desktop_view.dart';
import 'package:playground/src/features/responsive/views/mobile_view.dart';
import 'package:playground/src/features/responsive/views/tablet_view.dart';

class ResponsiveView extends StatelessWidget {
  const ResponsiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        title: const Text(
          "Responsive",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: const Responsive(
          mobile: MobileView(), tablet: TabletView(), desktop: DesktopView()),
    );
  }
}
