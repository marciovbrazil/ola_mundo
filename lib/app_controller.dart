import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {

    static AppController instance = AppController();

    bool isDarkThemme = false;

    changeTheme() {
      isDarkThemme = !isDarkThemme;
      notifyListeners();
    }

  }