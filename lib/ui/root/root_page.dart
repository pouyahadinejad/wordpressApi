import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:plantapp/constans/constans.dart';
import 'package:plantapp/ui/cart/cart_page.dart';
import 'package:plantapp/ui/catalog/catalog_page.dart';
import 'package:plantapp/ui/home/home_page.dart';
import 'package:plantapp/ui/profile/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomIndex = 0;

  List<Widget> page() {
    return [
      const HomePage(),
      const CatalogPage(),
      const CartPage(),
      const ProfilePage(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.people,
  ];

  List<String> appBarTitle = [
    'خانه',
    'علاقه‌مندی‌ها',
    'سبد‌خرید',
    'پروفایل',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                color: Constans.blackColor,
                Icons.notifications,
              ),
              Text(
                appBarTitle[bottomIndex],
                style: TextStyle(
                  color: Constans.blackColor,
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: bottomIndex,
        children: page(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const ScanPage(),
              //   ),
              // );
            },
          );
        },
        backgroundColor: Constans.primaryColor,
        child: Image.asset(
          'assets/images/add-cart.png',
          height: 30.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: bottomIndex,
        splashColor: Constans.primaryColor,
        activeColor: Constans.primaryColor,
        inactiveColor: Colors.black.withOpacity(0.5),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(
            () {
              bottomIndex = index;
              // final List<Plant> favoitedplants = Plant.getFavoritedPlants();
              // final List<Plant> addedToCatPlants = Plant.addedToCartPlants();

              // favorited = favoitedplants.toSet().toList();
              // myCart = addedToCatPlants.toSet().toList();
            },
          );
        },
      ),
    );
  }
}
