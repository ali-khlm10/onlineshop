import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/cameramanagement.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/changepassword.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/mobile%20management/mobile%20brand/addmobilebrand.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/mobile%20management/mobile%20brand/mobilebrandsmanagement.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/mobile%20management/mobile%20brand/updatemobilebrand.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/mobile%20management/mobile%20product/addmobileproduct.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/mobile%20management/mobile%20product/mobilepruductsmanagement.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/mobile%20management/mobile%20product/updatemobileproduct.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/mobile%20management/mobilemanagement.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/sellmanagement.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20body/body%20under%20of%20search%20widget/Showproducts.dart';

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
    _listofcategorysubject = List.generate(
        list_mobile_cats.length, (index) => list_mobile_cats[index]['catName']);
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

  void afterchangepasswordbody(Size size, bool result) {
    _panelItemsBody = Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .2),
      padding: EdgeInsets.symmetric(horizontal: size.width * .2),
      child: Center(
        child: Text(
          (result)
              ? '. تغییر رمز با موفقیت انجام شد'
              : '. عملیات با خطا مواجه شد',
          style: TextStyle(
            color: (result == true) ? Colors.green : Colors.red,
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
  //////////////////////////////////////////////////////

  void changebrandsmanagementbody(Size size) {
    _panelItemsBody = brandsmanagement(size: size);
    notifyListeners();
  }

  void changeaddmobilebrandsmanagementbody(Size size) {
    _panelItemsBody = addmobilebrand(size: size);
    notifyListeners();
  }

  void changeupatemobilebrandsmanagementbody(Size size, String str, int index) {
    _panelItemsBody = updatemobilebrand(
      size: size,
      inputforupdate: str,
      Index: index,
    );
    notifyListeners();
  }
//////////////////////////////////////////////////////////

  void changeproductmanagementbody(Size size) {
    _panelItemsBody = productsmanagement(size: size);
    notifyListeners();
  }

  void changeaddmobileproductmanagementbody(Size size) {
    _panelItemsBody = addmobileproduct(size: size);
    notifyListeners();
  }

  void changeupatemobileproductmanagementbody(Size size, int index) {
    _panelItemsBody = updatemobileproduct(
      size: size,
      Index: index,
    );
    notifyListeners();
  }

  //////////////////////////////////////////////////////

  List _showList = showProductsforMobile;

  List get getshowList {
    return _showList;
  }

  void updateshowListformobile() {
    _showList = showProductsforMobile;
    notifyListeners();
  }

  void updateshowListformainpage() {
    _showList = showProductsforMainPage;
    notifyListeners();
  }

  /////////////////////////////////////////////////
  Widget _productMenu = showproducts();

  Widget get getProductMenu {
    return _productMenu;
  }

  void changeProductMenu(Widget menu) {
    _productMenu = menu;
    notifyListeners();
  }
}

///////////////////////////////////////////////////////////////////////////
class CartProvider extends ChangeNotifier {
  List _cartList = [];

  List get getCartsList {
    return _cartList;
  }

  void Carts() {
    _cartList = CartList;
    notifyListeners();
  }
}
