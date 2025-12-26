import 'package:flutter/material.dart';
import 'package:mini_chat_app/src/src.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: viewOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  static const List<Widget> viewOptions = <Widget>[
    HomeView(),
    Center(
      child: Text(
        'Offers',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Settings',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  ];
}
