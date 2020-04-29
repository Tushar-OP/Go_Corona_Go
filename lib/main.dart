import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'screens/stats.dart';
import 'screens/landing.dart';
import 'screens/about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    LandingPage(),
    StatsPage(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: _children[_selectedIndex],
      bottomNavigationBar: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Color.fromRGBO(71, 63, 149, 1),
                tabs: [
                  GButton(
                    icon: Icons.home,
                    iconColor: Color.fromRGBO(153, 159, 191, 1),
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.equalizer,
                    iconColor: Color.fromRGBO(153, 159, 191, 1),
                    text: 'Stats',
                  ),
                  GButton(
                    icon: Icons.person_pin,
                    iconColor: Color.fromRGBO(153, 159, 191, 1),
                    text: 'About',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
