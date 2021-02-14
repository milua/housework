import 'package:flutter/material.dart';
import 'package:housework/settings/settings-page.dart';
import 'package:housework/tasks/services/dummy-tasks-service.dart';
import 'package:housework/tasks/tasks-page.dart';
import 'package:housework/rewards/reward-page.dart';
import 'package:housework/accounts/account-page.dart';

import 'rewards/reward-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
//
      ),
      home: MyHomePage(title: 'Housework'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static List<Widget> _myPages = <Widget>[AccountPage(), TasksPage(DummyTasksService()), RewardPage(), SettingsPage()];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.redeem_outlined),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[500],
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}