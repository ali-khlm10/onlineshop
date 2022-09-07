import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/adminsignin.dart';
import 'package:provider/provider.dart';
//

PreferredSizeWidget Appbar(BuildContext context, Size size) {
  return AppBar(
    leading: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(Icons.shopping_cart),
        const SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => adminSignin(size: size),
                ));
          },
          child: const Center(
            child: Text(
              'ورود مدیران',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
    leadingWidth: size.width * .33,
    actions: [
      // SizedBox(
      //   width: 150,
      //   child: Center(
      //     child: TextField(
      //       decoration: InputDecoration(
      //         contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      //         border: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      //         isDense: true,
      //       ),
      //       maxLines: 2,
      //     ),
      //   ),
      // ),
      const SizedBox(width: 20),
      Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 10),
        child: const Text(
          'فروشگاه اینترنتی',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    ],
    elevation: 0,
    toolbarHeight: 100,
  );
}

class ShopAppBar extends StatefulWidget {
  const ShopAppBar({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<ShopAppBar> createState() => _ShopAppBarState();
}

class _ShopAppBarState extends State<ShopAppBar> {
  Widget _Expanded({int? flex, Widget? child, Color? color}) {
    return Expanded(
      flex: flex!,
      child: Container(
        color: color,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<listofcategorysubjectProvider>(
      builder: (context, value, child) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: widget.size.height * .13,
        color: Colors.teal[800],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        print('fhcgv');
                      },
                      icon: const Icon(Icons.shopping_cart),
                      color: Colors.white,
                    ),
                  ),
                  _Expanded(
                    flex: 3,
                    child: TextButton(
                      onPressed: () {
                        value.listofmainpagesubjects();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  adminSignin(size: widget.size),
                            ));
                      },
                      child: Text(
                        'ورود مدیران',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.blue[300],
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _Expanded(
              flex: 7,
              child: Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  'فروشگاه اینترنتی',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
