import 'package:ecommerce_shop/controllers/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(child: Obx(
          () {
            final product = controller.product.value;
            return CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: product.id.toString(),
                          child: Image.network(product.image.toString(),
                              height: MediaQuery.of(context).size.height * 0.4,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(
                                    child: Icon(
                                      Icons.error_outline,
                                      size: 300,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                              loadingBuilder:
                                  (context, child, loadingProgress) =>
                                      loadingProgress != null
                                          ? const Center(
                                              child: SpinKitWave(
                                              color: Colors.orangeAccent,
                                              size: 50.0,
                                            ))
                                          : child),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  product.title.toString(),
                                  maxLines: 3,
                                  style: theme.textTheme.titleLarge,
                                ),
                              ),
                              Text(
                                "\$${product.price}",
                                style: theme.textTheme.titleLarge,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RatingBarIndicator(
                                rating: product.rating?.rate ?? 1,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 24.0,
                                direction: Axis.horizontal,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                    '${product.rating?.rate} (${product.rating?.count})'),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'CATEGORY : ',
                                  style: theme.textTheme.titleMedium,
                                ),
                                Text(
                                  product.category.toString().toUpperCase(),
                                  style: theme.textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.description.toString(),
                              textAlign: TextAlign.justify,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]))
              ],
            );
          },
        )),
      ),
    );
  }
}
