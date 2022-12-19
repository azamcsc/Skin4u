import 'package:customers_app/model/products_model.dart';
import 'package:customers_app/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/utils.dart';
import '../inner_screens/product_details.dart';

class FeedsItems extends StatefulWidget {
  const FeedsItems({Key? key}) : super(key: key);

  @override
  State<FeedsItems> createState() => _FeedsItemsState();
}

class _FeedsItemsState extends State<FeedsItems> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    final productModel = Provider.of<ProductModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).dividerColor,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProductDetails.routeName,
                arguments: productModel.id);

          },
          borderRadius: BorderRadius.circular(12),
          child: Column(children: [
            FancyShimmerImage(
              imageUrl: productModel.imageUrl,
              height: size.width * 0.3,
              width: size.width * 0.3,
              boxFit: BoxFit.fill,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: TextWidget(
                      text: productModel.title,
                      color: color,
                      maxLines: 1,
                      textSize: 18,
                      isTitle: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: FittedBox(
                        child: Row(
                      children: [
                        Text(
                          '{(productModel.price).toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
