import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/changepassword.dart';
import 'package:onlineshop/models/frontend/constants.dart';

class listofcategorysubjectProvider extends ChangeNotifier {
  List<String> _listofcategorysubject = listofmainpagecategory;
  String _menuName = listofCategories[0];
  Widget _panelItemsBody = Container(
    child: Center(child: Text('hello')),
  );

  // Size? _mainsize;

  // void setSize(Size size) {
  //   _mainsize = size;
  // }
  ////////////////////////////////////////////////

  List<String> get getlistofcategorysubject {
    return _listofcategorysubject;
  }

  String get getmenuname {
    return _menuName;
  }

  void listofmainpagesubjects() {
    _listofcategorysubject = listofmainpagecategory;
    _menuName = listofCategories[0];
    notifyListeners();
  }

  void listofmobilesubjects() {
    _listofcategorysubject = listofmobilecategory;
    _menuName = listofCategories[1];
    notifyListeners();
  }

  void listofcamerasubjects() {
    _listofcategorysubject = listofcameracategory;
    _menuName = listofCategories[2];
    notifyListeners();
  }

  void listofhomeappliancessubjects() {
    _listofcategorysubject = listofhomeappliancescategory;
    _menuName = listofCategories[3];
    notifyListeners();
  }

  void listofcomputersubjects() {
    _listofcategorysubject = listofcomputercategory;
    _menuName = listofCategories[4];
    notifyListeners();
  }
  //////////////////////////////////////////////////

  Widget get getpanelItemsBody {
    return _panelItemsBody;
  }

  void changepasswordbody(Size size) {
    _panelItemsBody = changepass(size: size);
    notifyListeners();
  }

  void afterchangepasswordbody(Size size) {
    _panelItemsBody = Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .2),
      padding: EdgeInsets.symmetric(horizontal: size.width * .2),
      child: const Center(
        child: Text(
          '. تغییر رمز با موفقیت انجام شد',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
      ),
    );
    notifyListeners();
  }

  void initialadminpanelbody(Size size, String username) {
    _panelItemsBody = Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .2),
      padding: EdgeInsets.symmetric(horizontal: size.width * .2),
      child: Center(
        child: Text(
          'سلام $username محترم \nبه بخش مدیریت فروشگاه خوش آمده اید \n . جهت ادامه کار یکی از دکمه های بالا را کلیک کنید',
          style: const TextStyle(
            color: Colors.green,
          ),
        ),
      ),
    );
    notifyListeners();
  }
}
