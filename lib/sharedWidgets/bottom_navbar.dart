import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/screens/trashPickup/views/scheduled_pickups.dart';
import 'package:waste_management_app/screens/home/views/home_screen.dart';
import 'package:waste_management_app/screens/profile/views/profile_screen.dart';
import 'package:waste_management_app/screens/shop/views/shop_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.initailIndex}) : super(key: key);
  final int initailIndex;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  //controller to manage different tabs of the navbar
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 4, vsync: this, initialIndex: widget.initailIndex);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //custom made tabview used as bottom navbar
        bottomNavigationBar: CustomNavBarWidget(tabController: _tabController),
        body: TabBarView(
          controller: _tabController,
          //tab pages in correspondence to the navbar
          children: [
            HomeScreen(),
            ScheduledPickupScreen(
              backButtonVisible: false,
            ),
            ShopScreen(),
            ProfileScreen(),
          ],
        ));
  }
}

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    //outer container to hold the navbar
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(0.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TabBar(
            //indicator package for the dot indication
            indicator: DotIndicator(
              color: kPrimaryColor,
              distanceFromCenter: 20,
              radius: 3,
              paintingStyle: PaintingStyle.fill,
            ),
            // BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
            //inner padding for the icons of the navbar
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  UIcons.regularRounded.home,
                  color: _tabController.index == 0
                      ? kPrimaryColor
                      : kUnselectedItemColor,
                ),
              ),
              Tab(
                icon: Icon(
                  UIcons.regularRounded.calendar,
                  color: _tabController.index == 1
                      ? kPrimaryColor
                      : kUnselectedItemColor,
                ),
              ),
              Tab(
                icon: Icon(
                  UIcons.regularRounded.shopping_bag,
                  color: _tabController.index == 2
                      ? kPrimaryColor
                      : kUnselectedItemColor,
                ),
              ),
              Tab(
                icon: Icon(
                  UIcons.regularRounded.user,
                  color: _tabController.index == 3
                      ? kPrimaryColor
                      : kUnselectedItemColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
