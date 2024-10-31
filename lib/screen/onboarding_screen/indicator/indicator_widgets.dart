import 'package:flutter/material.dart';

List<Widget> buildIndicator(int activePage, int totalPages) {
  final indicators = <Widget>[];
  for (var i = 0; i < totalPages; i++) {
    if (activePage == i) {
      indicators.add(indicatorActive(activePage));
    } else {
      indicators.add(indicatorInactive());
    }
  }
  return indicators;
}

Widget indicatorActive(int activePage) {
  final String color;
  if (activePage == 0) {
    color = '#ffe24e';
  } else if (activePage == 1) {
    color = '#a3e4f1';
  } else {
    color = '#31b77a';
  }
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 6,
    width: 42,
    margin: const EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: hexToColor(color),
    ),
  );
}

Widget indicatorInactive() {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 8,
    width: 8,
    margin: const EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.grey.shade400,
    ),
  );
}

Color hexToColor(String hexCode) {
  final hex = hexCode.replaceAll('#', '');
  return Color(int.parse('FF$hex', radix: 16));
}
