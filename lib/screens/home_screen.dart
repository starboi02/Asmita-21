import 'package:asmita_flutter/screens/events.dart';
import 'package:asmita_flutter/screens/sponsers.dart';
import 'package:asmita_flutter/screens/team.dart';
import 'package:asmita_flutter/screens/updates.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  FirebaseMessaging firebaseMessaging ;

  void fcmSubscribe() {
    firebaseMessaging.subscribeToTopic('asmita-21');
  }

  void fcmUnSubscribe() {
    firebaseMessaging.unsubscribeFromTopic('asmita-21');
  }
  List<Widget> _widgetOptions = <Widget>[
    EventsScreen(),
    UpdatesScreen(),
    SponserScreen(),
    TeamScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    firebaseMessaging = new FirebaseMessaging();
    fcmSubscribe();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text('Events'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Updates'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              title: Text('Sponsers'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('Team'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

