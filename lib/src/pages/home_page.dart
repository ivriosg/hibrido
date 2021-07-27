import 'package:flutter/material.dart';

import 'package:hibrido/src/pages/club_page.dart';
import 'package:hibrido/src/pages/currencies_page.dart';
import 'package:hibrido/src/pages/dashboard_page.dart';
import 'package:hibrido/src/pages/front_page.dart';
import 'package:hibrido/src/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pageBottomBar = [
    DashboardPage(),
    ClubPage(),
    FrontPage(),
    ShopPage(),
    CurrenciesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/icons/menu.png',
            width: 30.0,
          ),
        ),
        title: Text(
          'Híbrido',
          style: TextStyle(
            fontFamily: 'Cocogoose',
            fontSize: 30.0,
            letterSpacing: 2.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
            icon: Image.asset(
              'assets/icons/home.png',
              width: 30.0,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Color(0xFF000000),
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pageBottomBar,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF183060),
        onTap: _onItemTapped,
        items: [
          _bottomItem('assets/icons/dashboard.png', 'Dashboard'),
          _bottomItem('assets/icons/club.png', 'Club'),
          _bottomItem('assets/icons/home.png', 'Home'),
          _bottomItem('assets/icons/shop.png', 'Shop'),
          _bottomItem('assets/icons/currencies.png', 'Currencies'),
        ],
      ),
    );
  }

  _bottomItem(String image, String title) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        image,
        width: 30.0,
      ),
      label: title,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
