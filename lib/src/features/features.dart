import 'package:flutter/material.dart';
import 'package:playground/core/theme/pallete.dart';
import 'package:playground/core/widgets/pg_image.dart';
import 'package:playground/core/widgets/pg_text.dart';
import 'package:playground/src/features/add_to_cart_animation/views/product_list_view.dart';
import 'package:playground/src/features/gyroscope/views/gyroscope_view.dart';
import 'package:playground/src/features/models/features_model.dart';
import 'package:playground/src/features/responsive/views/responsive_view.dart';

class Features extends StatefulWidget {
  const Features({Key? key}) : super(key: key);

  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  List<FeaturesModel> featuresList = [];

  @override
  initState() {
    super.initState();
    featuresList = FeaturesModel.featuresList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        title: const Text(
          "Playground",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        color: Palette.background,
        child: ListView.separated(
          itemCount: featuresList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () => goToFeatures(index),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Palette.containerBackground,
                    ),
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            child: PgImage(path: featuresList[index].imagePath),
                          ),
                        ),
                        Expanded(
                            flex: 8,
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                child: PgText(
                                  size: 14,
                                  value: featuresList[index].title,
                                  weight: FontWeight.w700,
                                  color: Palette.whiteText,
                                )))
                      ],
                    )),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            height: 30,
            decoration: BoxDecoration(color: Palette.containerBackground),
            child: Center(
                child: PgText(
              value: "Made by QuantMis \u{1F920}",
              size: 12,
              weight: FontWeight.normal,
              color: Palette.whiteText,
            ))),
      ),
    );
  }

  /*
   * FUNCTIONS
   */

  goToFeatures(int index) {
    var feature;
    switch (index) {
      case 0:
        feature = const ProductListView();
        break;
      case 1:
        feature = const ResponsiveView();
        break;
      case 2:
        feature = const GyroscopeView();
        break;
      default:
        feature = const Features();
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => feature,
      ),
    );
  }
}
