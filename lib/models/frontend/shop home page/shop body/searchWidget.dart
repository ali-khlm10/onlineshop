import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/mobile_func.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20body/body%20under%20of%20search%20widget/Showproducts.dart';
import 'package:provider/provider.dart';

class search extends StatefulWidget {
  const search({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<listofcategorysubjectProvider>(
      builder: (context, value, child) => Container(
        height: widget.size.height * .15,
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: const Text(
                  ': جستجوی کالای مورد نظر',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () async {
                        showProductsforMobile =
                            await getBrandMobile(textcontroller.text);
                        if (showProductsforMobile.isNotEmpty) {
                          value.updateshowListformobile();
                          value.listofmobilesubjects();
                          value.changeProductMenu(showproducts());
                        } else {
                          value.listofmainpagesubjects();
                          value.updateshowListformobile();
                          value.changeProductMenu(showproducts());
                        }

                        textcontroller.clear();
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 5,
                  // ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: textcontroller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
