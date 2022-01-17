import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                    flex: 8,
                    child: Container(
                      child: Column(
                        children: [
                          Spacer(
                            flex: 1,
                          ),
                          Expanded(
                              flex: 3, child: Container(child: SearchBar())),
                          Expanded(flex: 7, child: Banner(50)),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                TabButton('idols'),
                                TabButton('utensils'),
                                TabButton('cloth'),
                                TabButton('jwellery'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(flex: 1, child: FlashSaleCloseTime()),
                Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: FlashSaleCard(
                              "lib/assets/image/ganesh.png", "Idols", 500, 50),
                        ),
                        Flexible(
                          child: FlashSaleCard(
                              "lib/assets/image/cup.png", "Idols", 500, 50),
                        ),
                        Flexible(
                          child: FlashSaleCard(
                              "lib/assets/image/crown.png", "Idols", 500, 50),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                          flex: 20,
                          child: Container(
                            child: Text(
                              "Recently Viewed",
                              style: TextStyle(fontSize: 18),
                            ),
                          )),
                    ],
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Flexible(
                            child: RecentlyViewedCard(
                                "lib/assets/image/samgari.png")),
                        Flexible(
                            child: RecentlyViewedCard(
                                "lib/assets/image/fruits.png"))
                      ],
                    )),
                Expanded(flex: 1, child: Container()),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class Banner extends StatelessWidget {
  Banner(this.offer);

  int offer;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(flex: 2),
          Expanded(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Hot Sale"     ,style: TextStyle(fontSize: 22, color: Colors.white),),
          
                Text("${offer}% Off",style: TextStyle(fontSize: 22, color: Colors.white),),
          
              ],
              ),
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 0.9,
                    widthFactor: 0.9,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.amber.shade300, shape: BoxShape.circle),
                    ),
                  ),
                ),
                Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 0.8,
                    widthFactor: 0.8,
                    child: Image.asset('lib/assets/image/banner.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        // search wala container
        padding: EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.symmetric(horizontal: 3, vertical: 18),
        decoration: BoxDecoration(
            color: Colors.grey[400], borderRadius: BorderRadius.circular(24)),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Icon(
                  Icons.search,
                  color: Colors.blueAccent,
                ),
                margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
              ),
            ),
            Expanded(
              child: TextField(
                // controller: searchcontroller,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "search"),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey[600],
                ),
                margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlashSaleCard extends StatelessWidget {
  String imagePath;
  String itemName;
  int offer;
  int price;
  FlashSaleCard(this.imagePath, this.itemName, this.price, this.offer);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
      aspectRatio: 0.75,
      child: Container(
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.amber.shade50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      child: Container(
                          child: Center(
                              child: Text(
                            "${offer}% off",
                            style: TextStyle(color: Colors.amber.shade200),
                          )),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.amber.shade200),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Stack(
                      children: [
                        Center(
                          child: FractionallySizedBox(
                            widthFactor: 0.7,
                            child: Container(
                                decoration: BoxDecoration(
                              color: Colors.amber.shade100,
                              shape: BoxShape.circle,
                            )),
                          ),
                        ),
                        Center(
                          child: FractionallySizedBox(
                              heightFactor: 0.8,
                              widthFactor: 0.8,
                              child: Image(image: AssetImage(imagePath))),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        flex: 5,
                        child: Text(
                          itemName,
                          style: TextStyle(fontSize: 13),
                        )),
                  ],
                ),
                Row(children: [
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 5,
                      child: Text("\$${price.toString()}",
                          style: TextStyle(fontSize: 10))),
                ]),
              ],
            )),
      ),
    );
  }
}

class FlashSaleCloseTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 1,
        ),
        Expanded(
            flex: 10,
            child: Container(
              child: Text(
                "Flash Sale",
                style: TextStyle(fontSize: 20),
              ),
            )),
        Expanded(
            flex: 5,
            child: Container(
              child: Text(
                "Closing In",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            )),
        Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                color: Colors.grey,
              ),
            )),
        Spacer(
          flex: 1,
        ),
        Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                color: Colors.grey,
              ),
            )),
        Spacer(
          flex: 1,
        ),
        Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                color: Colors.grey,
              ),
            )),
        Expanded(flex: 2, child: Container()),
      ],
    );
  }
}

class RecentlyViewedCard extends StatelessWidget {
  final imagePath;
  RecentlyViewedCard(this.imagePath);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.green.shade100,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(
                    flex: 7,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      shape: BoxShape.circle,
                    )),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: Center(
                  child: Image(
                      image: AssetImage(imagePath), fit: BoxFit.fitWidth)),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ));
  }
}

class TabButton extends StatelessWidget {
  late String textPath;
  TabButton(this.textPath);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 30),
        decoration: BoxDecoration(
            // border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Container(
          color: Colors.amber[50],
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 3, 8, 3),
            child: Text(textPath),
          ),
        ));
  }
}
