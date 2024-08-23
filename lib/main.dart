import 'dart:io';

import 'package:fch_club_new24/screens/PaymentScreen.dart';
import 'package:fch_club_new24/screens/about_us_screen.dart';
import 'package:fch_club_new24/screens/amc_screen.dart';
import 'package:fch_club_new24/screens/available_resorts.dart';
import 'package:fch_club_new24/screens/birthday_screen.dart';
import 'package:fch_club_new24/screens/book_holiday_screen.dart';
import 'package:fch_club_new24/screens/change_password.dart';
import 'package:fch_club_new24/screens/contact_us_screen.dart';
import 'package:fch_club_new24/screens/destination_wedding_screen.dart';
import 'package:fch_club_new24/screens/emi_details.dart';
import 'package:fch_club_new24/screens/events_screen.dart';
import 'package:fch_club_new24/screens/feedback_screen.dart';
import 'package:fch_club_new24/screens/forgot_password.dart';
import 'package:fch_club_new24/screens/gallery_screen.dart';
import 'package:fch_club_new24/screens/generatevoucher_screen.dart';
import 'package:fch_club_new24/screens/home_screen.dart';
import 'package:fch_club_new24/screens/login_screen.dart';
import 'package:fch_club_new24/screens/member_screen.dart';
import 'package:fch_club_new24/screens/payment_history.dart';
import 'package:fch_club_new24/screens/pre_wedding_screen.dart';
import 'package:fch_club_new24/screens/profile_screen.dart';
import 'package:fch_club_new24/screens/splash_screen.dart';
import 'package:fch_club_new24/screens/vacations_screen.dart';
import 'package:fch_club_new24/screens/voucher_screen.dart';
import 'package:fch_club_new24/screens/voucherregister_screen.dart';
import 'package:fch_club_new24/utils/datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Override for handling self-signed certificates
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

///todo: edited by kumar prince till 1 july 2023...

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //bool isLoggedIn = await checkLoginStatus();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Circular', primaryColor: primaryColor),
    routes: {
      //'/': (ctx) => isLoggedIn ? HomePage() : LoginPage(),
      '/': (ctx) => SplashScreen(),
      '/memberlogin_screen': (ctx) => MemberLoginPage(),
      '/voucherlogin_screen': (ctx) => VoucherLoginPage(),
      '/voucherregister_screen': (ctx) => VoucherRegisterPage(),
      '/generatevoucher_screen': (ctx) => GenerateVoucherPage(),

      '/login_screen': (ctx) => LoginPage(),
      '/home_screen': (ctx) => HomePage(),
      '/resorts_screen': (ctx) => AvailableResorts(),
      '/book_holiday': (ctx) => BookHoliday(),
      '/forgot_password': (ctx) => ForgotPassword(),
      '/change_password': (ctx) => ChangePassword(),
      '/amc_screen': (ctx) => AmcScreen(),
      '/gallery_screen': (ctx) => GalleryScreen(),
      '/about_us': (ctx) => AboutUs(),
      '/contact_us': (ctx) => ContactUs(),
      '/events': (ctx) => EventsScreen(),
      '/preWedding': (ctx) => PreWeddingScreen(),
      '/birthday_screen': (ctx) => BirthdayScreen(),
      '/destinationWedding': (ctx) => DestinationWedding(),
      '/feedback_screen': (ctx) => FeedBackScreen(),
      '/vacations': (ctx) => VacationsScreen(),
      '/payment': (ctx) => PaymentScreen(),
      '/profile': (ctx) => ProfileScreen(),
      '/paymentHistory': (ctx) => PaymentHistory(),
      '/emi_details': (ctx) => EmiDetails()
    },
  ));
}

// kumar prince........1 may  2024 after dropdown changed..latest
/// 2024..this is original code for development...fch
///todo: kumar prince.......again .23 august 2024  created new  it's working ios as well as android also.
///latest new
