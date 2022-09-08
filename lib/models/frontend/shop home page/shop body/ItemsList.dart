import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20body/body%20under%20of%20search%20widget/Showproducts.dart';
import 'package:provider/provider.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class Itemslist extends StatefulWidget {
  const Itemslist({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<Itemslist> createState() => _ItemslistState();
}

class _ItemslistState extends State<Itemslist> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.symmetric(horizontal: 13),
      height: widget.size.height * .08,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listofCategories.length,
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Material(
              color: Colors.teal[300],
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              child: Consumer<listofcategorysubjectProvider>(
                builder: (context, value, child) => InkWell(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  onTap: () {
                    if (index == 0) {
                      value.listofmainpagesubjects();
                      value.updateshowListformainpage();
                    } else if (index == 1) {
                      value.listofmobilesubjects();
                      value.updateshowListformainpage();
                    } else if (index == 2) {
                      value.listofcamerasubjects();
                      value.updateshowListformainpage();
                    } else if (index == 3) {
                      value.listofhomeappliancessubjects();
                      value.updateshowListformainpage();
                    } else if (index == 4) {
                      value.listofcomputersubjects();
                      value.updateshowListformainpage();
                    }
                  },
                  child: SizedBox(
                    width: widget.size.width * .3,
                    child: Center(
                      child: Text(
                        listofCategories[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        reverse: true,
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}

// class ItemsList extends StatefulWidget {
//   const ItemsList({Key? key, required this.size}) : super(key: key);
//   final Size size;

//   @override
//   State<ItemsList> createState() => _ItemsListState();
// }

// class _ItemsListState extends State<ItemsList> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.size.height * .17,
//       color: Colors.red,
//       child: Row(
//         children: [
//           Expanded(
//             flex: ,
//             child: Container(

//             ),
//           ),
//                 Expanded(
//             child: Container(),
//           ),
//         ],
//       ),
//     );
//   }
// }
