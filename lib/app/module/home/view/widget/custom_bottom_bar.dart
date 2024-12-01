import 'package:aifertest/app/module/home/view/home_view.dart';
import 'package:aifertest/app/module/notification/view/notification_view.dart';
import 'package:aifertest/app/module/search/view/search_view.dart';
import 'package:aifertest/app/module/settings/view/settings_view.dart';
import 'package:aifertest/app/util/app_color.dart';
import 'package:aifertest/app/util/app_constants.dart';
import 'package:flutter/material.dart';

class BottomFloatingBar extends StatefulWidget {
  const BottomFloatingBar({super.key});

  @override
  State<BottomFloatingBar> createState() => _BottomFloatingBarState();
}

class _BottomFloatingBarState extends State<BottomFloatingBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const SearchView(),
    const NotificationView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundcolor,
      body: Stack(
        children: [
          _screens[_selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildFloatingNavBar(),
          )
        ],
      ),
    );
  }

  Widget _buildFloatingNavBar() {
    return Container(
      height: 70,
      margin: const EdgeInsets.all(33),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarItem(Icons.home, 0, true, AppConstants.newtworkImagelogo),
          _buildNavBarItem(Icons.search, 1),
          _buildNavBarItem(Icons.notifications, 2),
          _buildNavBarItem(
              Icons.settings, 3, true, AppConstants.newtworkImageProfile),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, int index,
      [bool isImage = false, String? image]) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          isImage
              ? CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(image ?? ""),
                )
              : Icon(
                  icon,
                  color: _selectedIndex == index ? Colors.purple : Colors.grey,
                  size: 26,
                ),
          const SizedBox(height: 4),
          // Text(
          //   label,
          //   style: TextStyle(
          //     color: _selectedIndex == index ? Colors.purple : Colors.grey,
          //     fontSize: 12,
          //     fontWeight:
          //         _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
          //   ),
          // ),
        ],
      ),
    );
  }
}
