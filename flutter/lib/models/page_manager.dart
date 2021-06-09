import 'package:flutter/cupertino.dart';

class PageManager{

  PageManager(this._pageController);

  final PageController _pageController;

  int pagina = 0;

  void setPage(int value){
    if (value == pagina) return;
    pagina = value;
    _pageController.jumpToPage(value);
  }

}
