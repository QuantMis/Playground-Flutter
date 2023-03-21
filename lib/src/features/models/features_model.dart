class FeaturesModel {
  String title;
  String imagePath;
  FeaturesModel(this.title, this.imagePath);

  static List<FeaturesModel> featuresList() {
    List<FeaturesModel> featuresList = [];
    featuresList.add(FeaturesModel('Cart Animation', 'assets/img/cart.png'));
    featuresList.add(FeaturesModel('Responsive', 'assets/img/devices.png'));
    featuresList.add(FeaturesModel('Gyroscope', 'assets/img/gyroscope.png'));
    return featuresList;
  }
}
