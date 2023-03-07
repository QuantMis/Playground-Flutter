import 'package:flutter/material.dart';
import 'package:playground/core/theme/pallete.dart';
import 'package:playground/core/widgets/pg_image.dart';
import 'package:playground/core/widgets/pg_text.dart';
import 'package:playground/src/features/add_to_cart_animation/models/product_model.dart';
import 'package:add_to_cart_animation/add_to_cart_animation.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  // Product data
  List<ProductModel> productList = [];

  // Add to cart data/controller
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  int _cartQuantityItems = 0;

  @override
  initState() {
    super.initState();
    productList = ProductModel.productList();
  }

  /*
   * Add to cart method 
   */
  void listClick(GlobalKey widgetKey) async {
    await runAddToCartAnimation(widgetKey);
    await cartKey.currentState!
        .runCartAnimation((++_cartQuantityItems).toString());
  }

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      cartKey: cartKey,
      height: 20,
      width: 20,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        duration: Duration(milliseconds: 500),
        rotation: true,
      ),
      jumpAnimation: const JumpAnimationOptions(
        duration: Duration(milliseconds: 100),
      ),
      createAddToCartAnimation: (runAddToCartAnimation) {
        // You can run the animation by addToCartAnimationMethod, just pass trough the the global key of  the image as parameter
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.background,
          elevation: 0,
          title: const Text(
            "Add 2 Cart Animation",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          centerTitle: true,
          actions: [
            //  Adding 'clear-cart-button'
            IconButton(
              icon: const Icon(Icons.cleaning_services),
              onPressed: () {
                _cartQuantityItems = 0;
                cartKey.currentState!.runClearCartAnimation();
              },
            ),
            AddToCartIcon(
              key: cartKey,
              icon: const Icon(Icons.shopping_cart),
              badgeOptions: const BadgeOptions(
                active: true,
                backgroundColor: Colors.red,
              ),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 20),
          color: Palette.background,
          child: ListView.separated(
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              return itemList(
                productList: productList,
                index: index,
                onClick: listClick,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
          ),
        ),
      ),
    );
  }
}

class itemList extends StatelessWidget {
  itemList(
      {Key? key,
      required this.productList,
      required this.index,
      required this.onClick})
      : super(key: key);

  final List<ProductModel> productList;
  final index;
  final GlobalKey widgetKey = GlobalKey();
  final void Function(GlobalKey) onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Palette.containerBackground,
          ),
          height: 80,
          child: Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        key: widgetKey,
                        color: Colors.red,
                        child: const PgImage(path: 'assets/img/product1.jpg'),
                      )),
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PgText(
                            size: 18,
                            value: productList[index].title,
                            weight: FontWeight.w700,
                            color: Palette.whiteText,
                          ),
                          PgText(
                            size: 14,
                            value: productList[index].price,
                            weight: FontWeight.w700,
                            color: Palette.whiteText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => onClick(widgetKey),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(5),
                        color: Palette.background,
                        child: const PgImage(path: 'assets/img/add.png'),
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
