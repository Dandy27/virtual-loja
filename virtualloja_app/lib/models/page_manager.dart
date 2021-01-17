import 'package:flutter/material.dart';

class PageManager {
  PageManager(this.__pageController);

  PageController __pageController;

  int page = 0;

  void setPage(int value) {
    if(value == page) return;
    page = value;

    __pageController.jumpToPage(value);
  }
}
