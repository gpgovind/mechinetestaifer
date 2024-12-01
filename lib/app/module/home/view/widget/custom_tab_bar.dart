import 'package:aifertest/app/util/app_color.dart';
import 'package:flutter/material.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      radius: 30,
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        labelColor: Colors.black,
        isScrollable: true,
        unselectedLabelColor: Colors.white,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Appcolor.appwhite,
        ),
        tabs: const [
          Tab(
            text: 'Activity',
          ),
          Tab(
            text: 'Community',
          ),
          Tab(
            text: 'Shop',
          ),
        ],
      ),
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;
  const PrimaryContainer({
    super.key,
    this.radius,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 30),
      ),
      child: child,
    );
  }
}
