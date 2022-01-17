import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
 ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                    flex: 3,
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              // search wala container
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 0),
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(24)),
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
                                          border: InputBorder.none,
                                          hintText: "Lets search something"),
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
                          ),
                        ],
                      ),
                    )),
                Expanded(
                  flex: 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.asset('lib/assests/banner.jpg'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      text('idols'),
                      text('utensils'),
                      text('cloth'),
                      text('jwellery'),
                    ],
                  ),
                ),
                Expanded(flex: 2, child: FlashSaleCloseTime()),
                Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: FlashSaleCard(
                              "lib/assests/ganesh.jpeg", "Idols", 500, 50),
                        ),
                        Flexible(
                          child: FlashSaleCard(
                              "lib/assests/utansils.jpeg", "Idols", 500, 50),
                        ),
                        Flexible(
                          child: FlashSaleCard(
                              "lib/assests/jwellay.jpeg", "Idols", 500, 50),
                        ),
                      ],
                    )),
                Expanded(
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
                                "lib/assests/samagri.png")),
                        Flexible(
                            child: RecentlyViewedCard(
                                "lib/assests/fruits.png"))
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
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
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

class text extends StatelessWidget {
  late String textPath;
  text(this.textPath);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                              // border: Border.all(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                         
                          child: Container(
                            color: Colors.amber[50],
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 3, 8, 3),
                              child: Text(textPath),
                            ),
                          ) 
    );
  }
}
