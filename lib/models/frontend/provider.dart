import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/cameramanagement.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/changepassword.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/mobile%20management/mobilemanagement.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/sellmanagement.dart';

class listofcategorysubjectProvider extends ChangeNotifier {
  List<String> _listofcategorysubject = listofmainpagecategory;
  String _menuName = listofCategories[0];
  Widget _panelItemsBody = Container(
    // alignment: Alignment.centerLeft,
    margin: const EdgeInsets.symmetric(vertical: 100),
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: const Text(
      'با سلام\n.به بخش مدیریت فروشگاه خوش آمده اید \n .جهت ادامه کار یکی از دکمه های بالا را انتخاب کنید',
      style: TextStyle(
        color: Colors.blue,
      ),
      textAlign: TextAlign.right,
    ),
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

  void changemobilemanagementbody(Size size) {
    _panelItemsBody = mobilemanagement(size: size);
    notifyListeners();
  }

  void changecameramanagementbody(Size size) {
    _panelItemsBody = cameramanagement(size: size);
    notifyListeners();
  }

  void changesellmanagementbody(Size size) {
    _panelItemsBody = sellmanagement(size: size);
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
