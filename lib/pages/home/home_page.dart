import 'package:flutter/material.dart';
import 'package:get_x/pages/cart/cart_page.dart';
import 'package:get_x/pages/home/main_food_page.dart';
import 'package:get_x/utils/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersistentTabController _controller;

  List pages = [
    const MainFoodPage(),
    const Center(child: Text(" page 2")),
    const CartPage(),
    const Center(child: Text("page 4")),
  ];

  List<Widget> _buildScreens() {
    return [
      const MainFoodPage(),
      const Center(child: Text(" page 2")),
      const Center(child: Text(" page 3")),
      const Center(child: Text("page 4")),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: Colors.amberAccent,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.archive),
        title: ("History"),
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: Colors.amberAccent,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: Colors.amberAccent,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.face),
        title: ("Profile"),
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: Colors.amberAccent,
      ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  // int _activeIndex = 0;

  // void onBottomItemClicked(int index) {
  //   setState(() {
  //     _activeIndex = index;
  //   });
  // }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {
          onBottomItemClicked(value);
        },
        currentIndex: _activeIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: "Profile",
          ),
        ],
      ),
    );
  }*/
}
