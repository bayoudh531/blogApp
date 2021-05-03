import 'dart:collection';

import 'package:CWCFlutter/model/food.dart';
import 'package:flutter/cupertino.dart';

class GalorieNotifier with ChangeNotifier {
  List<Galorie> _foodList = [];
  Galorie _currentFood;

  UnmodifiableListView<Galorie> get galorieList => UnmodifiableListView(_foodList);

  Galorie get currentGalorie => _currentFood;

  set galorieList(List<Galorie> foodList) {
    _foodList = foodList;
    notifyListeners();
  }

  set currentGalorie(Galorie food) {
    _currentFood = food;
    notifyListeners();
  }

  addGalorie(Galorie food) {
    _foodList.insert(0, food);
    notifyListeners();
  }

  deleteGalorie(Galorie food) {
    _foodList.removeWhere((_food) => _food.id == food.id);
    notifyListeners();
  }
}
