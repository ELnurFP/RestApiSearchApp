import 'package:api_search_app/screens/page1.dart';
import 'package:api_search_app/screens/page2.dart';

import 'package:api_search_app/widget/language_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> _pages = [Page1(), Page2()];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        //    title: Text(AppLocalizations.of(context)!.hello('user')),
      ),
      drawer: Drawer(
        child: Column(children: [
          Container(
            color: Colors.grey,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.helloWorld + ':',
                  style: const TextStyle(fontSize: 20),
                ),
                const LanguagePicker()
              ],
            ),
          )
        ]),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0xff3580FF),
        unselectedItemColor: const Color(0xff848A94),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Folder'),
        ],
      ),
    );
  }
}
