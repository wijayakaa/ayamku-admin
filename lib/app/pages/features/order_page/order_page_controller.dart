import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderPageController extends GetxController {
  late PageController pageController;
  RxInt pageIndex = 0.obs;
  RxInt currentIndex = 0.obs;


  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void changePage(int index) {
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }
  
  void validateForm() {

  }
}