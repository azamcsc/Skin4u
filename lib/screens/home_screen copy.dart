import 'package:card_swiper/card_swiper.dart';
import 'package:customers_app/screens/alarm/alarm.dart';
import 'package:customers_app/screens/appointment/booking_screen.dart';
import 'package:customers_app/screens/question/question1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../consts/contss.dart';
import '../widgets/category_card.dart';
import '../widgets/feed_items.dart';
import '../model/products_model.dart';
import '../providers/products_provider.dart';
import '../services/utils.dart';
import '../widgets/text_widget.dart';
import 'appointment/doctor_details_page.dart';
import 'information/info_display.dart';

class HomeScreenC extends StatefulWidget {
  const HomeScreenC({Key? key}) : super(key: key);

  @override
  State<HomeScreenC> createState() => _HomeScreenCState();
}

class _HomeScreenCState extends State<HomeScreenC> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final Color color = Utils(context).color;
    Size size = utils.getScreenSize;
    final productProviders = Provider.of<ProductsProvider>(context);
    List<ProductModel> allProducts = productProviders.getProducts;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    Constss.offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: Constss.offerImages.length,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //Padding(
            //  padding: const EdgeInsets.all(8.0),
            //  child: Row(
            //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //    children: [
            //      TextWidget(
            //        text: 'Our products',
            //        color: color,
            //        textSize: 22,
            //        isTitle: true,
            //      ),
            //      // const Spacer(),
            //      TextButton(
            //       onPressed: () {},
            //       child: TextWidget(
            //         text: 'Browse all',
            //         maxLines: 1,
            //        color: Colors.brown,
            //        textSize: 20,
            //      ),
            //    ),
            //  ],
            //),
            //),
            GridView.count(
              shrinkWrap: true,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              primary: false,
              crossAxisCount: 2,
              children: <Widget>[
                CategoryCard(
                  title: "Diagnosis",
                  image: "assets/splash/skincare.png",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Question1();
                    }));
                  },
                ),
                CategoryCard(
                  title: "Appointment",
                  image: "assets/splash/meetings.jpg",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return BookingScreen(); //UBAHHHH!!!!!
                      }),
                    );
                  },
                ),
                CategoryCard(
                  title: "Reminder",
                  image: "assets/splash/alarm-clock.png",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Alarm(); //UBAHHHH!!!!!
                      }),
                    );
                  },
                ),
                CategoryCard(
                  title: "Information",
                  image: "assets/splash/cosmetics.png",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return InfoPage(); //UBAHHHHHH!!!!!
                      }),
                    );
                  },
                ),
                CategoryCard(
                  title: "Setting",
                  image: "assets/splash/settings.jpg",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Question1();
                    })); //UBAHHHHH!!!!
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
