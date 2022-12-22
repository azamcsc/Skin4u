import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../consts/contss.dart';
import '../widgets/feed_items.dart';
import '../model/products_model.dart';
import '../providers/products_provider.dart';
import '../services/utils.dart';
import '../widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Model{
  String title,price,imageUrl,description;
  Model(this.title,this.price,this.imageUrl,this.description);
}

class _HomeScreenState extends State<HomeScreen> {
var finish="0";
  List<Model> list=[];
  void fetchData()async{
    var data=await FirebaseFirestore.instance.collection("products").get();
    for(int i=0;i<data.docs.length;i++){
      Model model=Model(data.docs[i].data()['title'], data.docs[i].data()['price'],data.docs[i].data()['imageUrl'],data.docs[i].data()['description']);
      list.add(model);
    }
    print("kokokoko");
    print(list.length);
    setState(() {
      finish="1";
    });
  }

  void initState() {
    super.initState();
    setState(() {
      fetchData();
    });

  }

  Widget MyUI(String title,String url,String price,String desc){
    return Container(
      child: Card(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(url,height: 56,width: 56,),
                    Padding(

                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child:Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width/1.5,
                          child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title, style: TextStyle(fontSize: 18)),
                                Text(desc,),
                                Text('RM$price'),



                              ]
                          ),
                        ),
                      ),
                    ),
                    Spacer(),

                  ]
              )
          )
      )/*Column(
        children: [
          SizedBox(height: 12,),
          Text(title),
          Image.network(url),
          Text(price),
          Text(desc)
        ],
      ),*/
    );
  }


  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final Color color = Utils(context).color;
    Size size = utils.getScreenSize;
    final productProviders = Provider.of<ProductsProvider>(context);
    List<ProductModel> allProducts = productProviders.getProducts;
    print("xxxxxxxxxxxx");
    print( allProducts.length);
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Our products',
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  // const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: TextWidget(
                      text: 'Browse alls',
                      maxLines: 1,
                      color: Colors.blue,
                      textSize: 20,
                    ),
                  ),
                ],
              ),
            ),
        Container(
          height: 600,
          child: finish=="0"? Center(child: Text("No Product")):ListView.builder(itemCount: list.length,
            itemBuilder:(_,index){
              return MyUI(list[index].title, list[index].imageUrl, list[index].price, list[index].description);
            },
          ),)
            /*GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              childAspectRatio: size.width / (size.height * 0.73),
              children: List.generate(
                  allProducts.length < 4
                      ? allProducts.length // length 3
                      : 4, (index) {
                return ChangeNotifierProvider.value(
                  value: allProducts[index],
                  child: const FeedsItems(),
                );
              }),
            )*/
          ],
        ),
      ),
    );
  }
}
