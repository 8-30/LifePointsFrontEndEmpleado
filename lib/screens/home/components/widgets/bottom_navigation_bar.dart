import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:life_point/screens/chat/list_inbox/list_inbox_ui.dart';
import 'package:life_point/screens/profile/profile_ui.dart';

class BottomNavigationBarTravel extends StatefulWidget {
  @override
  _BottomNavigationBarTravelState createState() =>
      _BottomNavigationBarTravelState();
}

class _BottomNavigationBarTravelState extends State<BottomNavigationBarTravel> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _navigationPange(index);
    });
  }

  void _navigationPange(int index) {
    switch (index) {
      case 1:
        print("go mesage");
        Get.to(() => ListInboxUI(), transition: Transition.fadeIn);
        _selectedIndex = 0;
        break;
      case 2:
        print("go profile");
        Get.to(() => ProfileUI(), transition: Transition.fadeIn);
        _selectedIndex = 0;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86.4,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0, 5))
      ]),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0 ? Icon(Icons.home) : Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1 ? Icon(Icons.mail) : Icon(Icons.mail),
            label: "Mail",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Icon(Icons.circle)
                : Icon(Icons.account_box_outlined),
            label: "Perfil",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
    );
  }
}
