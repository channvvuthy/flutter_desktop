// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

boxShadow(double x, double y) {
  return BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 1,
    blurRadius: 1,
    offset: Offset(x, y),
  );
}
