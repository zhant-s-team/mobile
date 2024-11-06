import 'package:flutter/material.dart';

class AppStyles {
  static const Color backgroundColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color headerBackgroundColor = Color.fromRGBO(255, 249, 191, 1);

  static PreferredSizeWidget buildHeader({required String title}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(122), 
      child: Container(
        width: 360, 
        color: headerBackgroundColor,
        child: Center( 
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold,
              color: Colors.black, 
            ),
          ),
        ),
      ),
    );
  }
}
