import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/common/utils/constants/styles/app_colors.dart';

class BottomNavigationWrapper extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigationWrapper({
    super.key,
    required this.navigationShell,
  });

  @override
  State<BottomNavigationWrapper> createState() =>
      _BottomNavigationWrapperState();
}

class _BottomNavigationWrapperState extends State<BottomNavigationWrapper> {
  int selectedIndex = 0;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        backgroundColor: AppColors.blackCherry,
        elevation: 0,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          _goBranch(selectedIndex);
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                  CupertinoIcons.house_alt,
                  color: AppColors.purpleExcellency),
              activeIcon: Icon(
                  CupertinoIcons.house_alt_fill,
                  color: Colors.white),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  CupertinoIcons.star,
                  color: AppColors.purpleExcellency),
              activeIcon: Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.white),
              label: ''
          ),
        ],
      ),
    );
  }
}
