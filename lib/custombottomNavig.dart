import 'package:flutter/material.dart';
import 'package:shopping/customClipper.dart';

class CustomBottomNavig extends StatefulWidget {
  final int active;
  CustomBottomNavig(this.active);
  @override
  _CustomBottomNavigState createState() => _CustomBottomNavigState();
}

class _CustomBottomNavigState extends State<CustomBottomNavig> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: OvalTopBorderClipper(),
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              height: 120,
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.home_filled,
                              color: Colors.white,
                            ),
                            onPressed: () => print("home")),
                        Container(
                          color: widget.active == 0 ? Colors.red : Colors.black,
                          height: 10,
                          width: 50,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            onPressed: () => print("search")),
                        Container(
                          color: widget.active == 1 ? Colors.red : Colors.black,
                          height: 10,
                          width: 50,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.person_outline,
                              color: Colors.white,
                            ),
                            onPressed: () => print("profile")),
                        Container(
                          color: widget.active == 2 ? Colors.red : Colors.black,
                          height: 10,
                          width: 50,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
