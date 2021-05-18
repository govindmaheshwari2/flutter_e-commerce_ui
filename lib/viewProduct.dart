import 'package:flutter/material.dart';
import 'package:shopping/customClipper.dart';
import 'package:shopping/custombottomNavig.dart';
import 'package:shopping/dataset.dart';

class ViewProduct extends StatefulWidget {
  final Item product;
  ViewProduct(this.product);
  @override
  _ViewProductState createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(60))),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 80, left: 30, right: 30, bottom: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Icon(Icons.arrow_back)),
                              GestureDetector(
                                  onTap: () => print("cart"),
                                  child: Icon(Icons.shopping_cart))
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width / 1.5,
                          padding: EdgeInsets.all(20),
                          child: Image(image: AssetImage(widget.product.image)),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(widget.product.name,
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text("From \$" + widget.product.price.toString(),
                      style: TextStyle(
                          color: Colors.black54.withOpacity(0.5),
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    widget.product.detail,
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                Positioned(
                  bottom: 60,
                  child: GestureDetector(
                    onTap: () {
                      print("Add to cart");
                    },
                    child: ClipPath(
                      clipper: OvalTopBorderClipper(),
                      child: Container(
                        color: Colors.red,
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.only(bottom: 50),
                              child: Text(
                                "ADD TO CART",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
                CustomBottomNavig(0)
              ],
            ),
          )
        ],
      ),
    );
  }
}
