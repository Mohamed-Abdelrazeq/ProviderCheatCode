import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  bool theme = true;

  void changeTheme(){
    if (theme){
      theme = false;
    }
    else{
      theme = true;
    }
    notifyListeners();
  }

}