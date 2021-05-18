import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping/custombottomNavig.dart';
import 'package:shopping/dataset.dart';
import 'package:shopping/viewProduct.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                          onTap: () => print("cart"),
                          child: Icon(Icons.shopping_cart))
                    ],
                  ),
                ),
                Container(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: newArrivalList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RectWidth(product: newArrivalList[index]);
                    },
                  ),
                ),
                NewCategoryRect(name: "Suggest Items", list: suggestList),
                NewCategoryCircle(name: "Category", list: categoryList),
                NewCategoryRect(name: "Watchlist", list: suggestList),
                SizedBox(
                  height: 120,
                )
              ],
            ),
          ),
          CustomBottomNavig(0)
        ],
      ),
    );
  }
}

class NewCategoryRect extends StatelessWidget {
  final String name;
  final List<Item> list;
  NewCategoryRect({this.name, this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "SEE ALL",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.red,
                    size: 16,
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return RectHeight(product: list[index]);
            },
          ),
        )
      ],
    );
  }
}

class NewCategoryCircle extends StatelessWidget {
  final String name;
  final List<Item> list;
  final double height;
  NewCategoryCircle({this.name, this.list, this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "SEE ALL",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.red,
                    size: 16,
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          height: height != null ? height : 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Circle(
                product: list[index],
              );
            },
          ),
        )
      ],
    );
  }
}

class RectWidth extends StatelessWidget {
  final Item product;
  RectWidth({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      width: MediaQuery.of(context).size.width - 150,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width - 170,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54.withOpacity(0.14), blurRadius: 1)
                  ],
                  color: Colors.white),
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewProduct(product)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 8, bottom: 8),
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Shop Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 120,
              child: Transform.rotate(
                  angle: -pi / 8,
                  child: Image(image: AssetImage(product.image)))),
        ],
      ),
    );
  }
}

class RectHeight extends StatelessWidget {
  final Item product;
  RectHeight({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 10,
        left: 10,
        bottom: 10,
      ),
      padding: EdgeInsets.only(top: 15),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 180,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54.withOpacity(0.14), blurRadius: 1)
                  ],
                  color: Colors.white),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewProduct(product)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 12, bottom: 12),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Shop Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              top: 0,
              right: 0,
              height: 100,
              child: Transform.rotate(
                  angle: pi / 16,
                  child: Image(
                    image: AssetImage(product.image),
                  ))),
        ],
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final Item product;
  Circle({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 10,
        left: 10,
        bottom: 10,
      ),
      padding: EdgeInsets.only(top: 15),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black54.withOpacity(0.14), blurRadius: 1)
              ], shape: BoxShape.circle, color: Colors.white),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 130,
                          child: Text(
                            product.name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              top: 0,
              right: 0,
              height: 110,
              child: Transform.rotate(
                  angle: 0,
                  child: Image(
                    image: AssetImage(product.image),
                  ))),
        ],
      ),
    );
  }
}
