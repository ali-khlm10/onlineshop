import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * .15,
      margin: const EdgeInsets.all(20),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   border: Border.all(
      //     color: Colors.grey,
      //     width: 1,
      //   ),
      //   // color: Colors.teal[100],
      // ),
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
                    onPressed: () {},
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
    );
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
    // );
  }
}
