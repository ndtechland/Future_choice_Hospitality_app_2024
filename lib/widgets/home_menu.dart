import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/available_resorts.dart';
import '../screens/book_holiday_screen.dart';

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BookHoliday()));
            },
            child: Container(
              height: 160,
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Card(
                        elevation: 3,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.all(10),
                                  width: 80,
                                  height: 80,
                                  child: Image.asset('images/book_now.png')),
                              Text(
                                'Book a holiday',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AvailableResorts()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 3,
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(10),
                                    width: 80,
                                    height: 80,
                                    child: Image.asset(
                                        'images/resorts_dashboard.png')),
                                Text(
                                  'Associated Resorts',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 160,
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        checkUserID().then((userId) => {
                          userId
                             , Navigator.pushNamed(context, '/vacations')
                          // Navigator.popAndPushNamed(
                          //             context, '/login_screen')
                        });

                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 3,
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(10),
                                    width: 80,
                                    height: 80,
                                    child: Image.asset(
                                        'images/vacation_dashboard.jpg')),
                                Text(
                                  'My Vacation',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/gallery_screen');
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          elevation: 3,
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(10),
                                    width: 80,
                                    height: 80,
                                    child: Image.asset('images/gallery.png')),
                                Text(
                                  'Gallery',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 160,
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/events');
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Card(
                        elevation: 3,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.all(10),
                                  width: 80,
                                  height: 80,
                                  child: Image.asset('images/events.png')),
                              Text(
                                'Events',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await Future.delayed(Duration(seconds: 0));

                      await Navigator.pushNamed(context, '/payment');
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Card(
                        elevation: 3,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.all(10),
                                  width: 80,
                                  height: 80,
                                  child: Image.asset('images/payment.jpg')),
                              Text(
                                'Payment',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
Future<int> checkUserID() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  int userId = sharedPreferences.getInt("Id") ?? 0;
  return userId;
}