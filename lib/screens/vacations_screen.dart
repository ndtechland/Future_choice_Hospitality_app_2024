import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/datasource.dart';
import '../widgets/vacations_list.dart';

class VacationsScreen extends StatefulWidget {
  @override
  _VacationsScreenState createState() => _VacationsScreenState();
}

class _VacationsScreenState extends State<VacationsScreen> {
  late Map vacationsData;
  late int userId;

  void getTenureDetails() async {
    var endPointUrl = "https://fcclub.co.in/api/BookHoliday/GetAllTaner";
    print(userId.toString());
    Map<String, String> queryParamete = {
      'userId': userId.toString(),
    };
    String queryString = Uri(queryParameters: queryParamete).query;
    var requestUrl = endPointUrl + '?' + queryString;
    http.Response response = await http.get(Uri.parse(requestUrl));
    if (response.statusCode == 200) {
      Map responseData = json.decode(response.body);
      if (responseData['Status'] == 1) {
        setState(() {
          vacationsData = responseData;
        });
      } else {
        Fluttertoast.showToast(
            msg: "NO data found",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'My Vacations',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: vacationsData == null
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              ),
            )
          : Container(
              child: ListView.builder(
                  itemCount: int.parse(vacationsData['Tenure']),
                  itemBuilder: (context, index) {
                    return VacationListItem(
                        index,
                        getDate(vacationsData['DOjoining']),
                        int.parse(vacationsData['Tenure']),
                        vacationsData['Days'],
                        vacationsData['Nights']);
                  }),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  String getDate(String date) {
    String finalMonth = "";
    List<String> dateList = []; // Initialize dateList as an empty list

    if (date.contains('/')) {
      dateList = date.split('/');
    } else if (date.contains('-')) {
      dateList = date.split('-'); // Fix this line to split by '-'
    }

    // Now you can safely use dateList
    switch (dateList[1]) {
      case "1":
      case "01":
        finalMonth = "Jan";
        break;
      case "2":
      case "02":
        finalMonth = "Feb";
        break;
      case "3":
      case "03":
        finalMonth = "Mar";
        break;
      case "4":
      case "04":
        finalMonth = "Apr";
        break;
      case "5":
      case "05":
        finalMonth = "May";
        break;
      case "6":
      case "06":
        finalMonth = "Jun";
        break;
      case "7":
      case "07":
        finalMonth = "Jul";
        break;
      case "8":
      case "08":
        finalMonth = "Aug";
        break;
      case "9":
      case "09":
        finalMonth = "Sep";
        break;
      case "10":
        finalMonth = "Oct";
        break;
      case "11":
        finalMonth = "Nov";
        break;
      case "12":
        finalMonth = "Dec";
        break;
    }

    return dateList[0] + " " + finalMonth + " " + dateList[2];
  }

  void getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userId = sharedPreferences.getInt("userId")!;
    });
    getTenureDetails();
  }
}
