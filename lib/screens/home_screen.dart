import 'package:another_carousel_pro/another_carousel_pro.dart';
//import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/datasource.dart';
import '../widgets/home_menu.dart';
import 'main_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        //backgroundColor: Color(oxFFC6600),
        title: Text(
          'Future Choice Hospitality',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 220,
                child: AnotherCarousel(
                  dotSize: 5.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.grey,
                  indicatorBgPadding: 10,
                  dotBgColor: Colors.transparent,
                  dotVerticalPadding: 5.0,
                  images: [
                    Image.asset(
                      'images/slider_one.jpeg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset('images/slider_two.jpg', fit: BoxFit.cover),
                    Image.asset('images/slider_thre.jpg', fit: BoxFit.cover),
                    Image.asset('images/slider_four.jpg', fit: BoxFit.cover),
                    Image.asset('images/slider_five.jpg', fit: BoxFit.cover),
                    Image.asset('images/slider_six.jpg', fit: BoxFit.cover),
                  ],
                ),
              ),
              HomeMenu()
            ],
          ),
        ),
      ),
    );
  }
}
