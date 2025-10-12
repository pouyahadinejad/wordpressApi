import 'package:flutter/material.dart';
import 'package:plantapp/constans/constans.dart';

class BuildCustomAppBar extends StatelessWidget {
  final String appBarTitle;
  const BuildCustomAppBar({
    required this.appBarTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50.0,
      left: 20.0,
      right: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            // NABEGHEHA.COM
            color: Constans.primaryColor,
            Icons.notifications,
            size: 30.0,
          ),
          Text(
            appBarTitle,
            style: TextStyle(
              color: Constans.primaryColor,
              fontFamily: 'Lalezar',
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
