import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas10/Tugas11/home_page.dart';
import 'package:tugas10/Tugas11/products_page.dart';
import 'package:tugas10/Tugas11/profile_page.dart';

class BottomNavController extends GetxController {
  final _selectedNav = 0.obs;
  int get selectedNav => _selectedNav.value;
  set selectedNav(int value) {
    _selectedNav.value = value;
  }

  final _selectedCategory = ''.obs;
  String get selectedCategory => _selectedCategory.value;
  set selectedCategory(String value) => _selectedCategory.value = value;
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int get _selectedIndex => Get.find<BottomNavController>().selectedNav;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ProductsPage(),
    CartProfile(),
  ];

  void _onItemTapped(int index) {
    final ctrl = Get.find<BottomNavController>();
    ctrl.selectedCategory = '';
    ctrl.selectedNav = index;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());
    return Obx(
      () => Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
