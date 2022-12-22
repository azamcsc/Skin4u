import 'package:customers_app/providers/products_provider.dart';
import 'package:customers_app/screens/buttom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'consts/contss.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  List<String> images = Constss.authImagesPaths;

  @override
  void initState() {
    images.shuffle();
    Future.delayed(const Duration(microseconds: 15), () async {
      final productsProvider =
          Provider.of<ProductsProvider>(context, listen: true);


      final User? user = FirebaseAuth.instance.currentUser;
      print("ttttt");
      print(user);
      if (user == null) {
        await productsProvider.fetchProducts();
      } else {
        await productsProvider.fetchProducts();
      }

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => const BottomBarScreen(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            images[0],
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          const Center(
            child: SpinKitFadingFour(
              color: Color.fromARGB(255, 252, 204, 187),
            ),
          )
        ],
      ),
    );
  }
}
