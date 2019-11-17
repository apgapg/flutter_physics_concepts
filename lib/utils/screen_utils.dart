import 'package:flutter/material.dart';

bool isSmallScreen(BuildContext context) {
  return MediaQuery.of(context).size.width < 600;
}

bool isLargeScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > 600;
}

bool isMediumScreen(BuildContext context) {
  return MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width <= 1200;
}
