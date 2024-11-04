import 'package:ecommerce_shop/models/product_response.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var product = Product().obs;

  @override
  void onInit() {
    final json = Get.arguments;
    product(Product.fromJson(json));
    super.onInit();
  }
}
