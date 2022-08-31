import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/constants.dart';

class listofcategorysubjectProvider extends ChangeNotifier {
  List<String> _listofcategorysubject = [];
  String _menuName = '';

  List<String> get getlistofcategorysubject {
    return _listofcategorysubject;
  }

  String get getmenuname {
    return _menuName;
  }

  void listofmobilesubjects() {
    _listofcategorysubject = listofmobilecategory;
    _menuName = listofCategories[0];
    notifyListeners();
  }

  void listofcamerasubjects() {
    _listofcategorysubject = listofcameracategory;
    _menuName = listofCategories[1];
    notifyListeners();
  }

  void listofhomeappliancessubjects() {
    _listofcategorysubject = listofhomeappliancescategory;
    _menuName = listofCategories[2];
    notifyListeners();
  }

  void listofcomputersubjects() {
    _listofcategorysubject = listofcomputercategory;
    _menuName = listofCategories[3];
    notifyListeners();
  }
}
