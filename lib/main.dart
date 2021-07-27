import 'package:flutter/material.dart';

import 'package:hibrido/src/pages/authorization/login_page.dart';
import 'package:hibrido/src/pages/authorization/signin_page.dart';
import 'package:hibrido/src/pages/authorization/signup_page.dart';

import 'package:hibrido/src/pages/club_page.dart';
import 'package:hibrido/src/pages/currencies_page.dart';
import 'package:hibrido/src/pages/dashboard_page.dart';
import 'package:hibrido/src/pages/front_page.dart';
import 'package:hibrido/src/pages/home_page.dart';
import 'package:hibrido/src/pages/shop_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'sign_up',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'home': (BuildContext context) => FrontPage(),
        'dashboard': (BuildContext context) => DashboardPage(),
        'club': (BuildContext context) => ClubPage(),
        'shop': (BuildContext context) => ShopPage(),
        'currencies': (BuildContext context) => CurrenciesPage(),
        'login': (BuildContext context) => LoginPage(),
        'sign_in': (BuildContext context) => SignInPage(),
        'sign_up': (BuildContext context) => SignUpPage(),
      },
    );
  }
}
