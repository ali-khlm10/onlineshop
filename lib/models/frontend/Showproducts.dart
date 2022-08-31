import 'package:flutter/material.dart';

class showproducts extends StatefulWidget {
  const showproducts({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<showproducts> createState() => _showproductsState();
}

class _showproductsState extends State<showproducts> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blueGrey[100],
        ),
        margin: const EdgeInsets.all(5),
        height: widget.size.height * .8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < 10; i++) ...[
                Container(
                  // color: Colors.yellow,
                  height: 200,
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/camera_1.jpg',
                      ),
                      const Center(
                        child: Text('اطلاعات بیشتر'),
                      ),
                    ],
                  ),
                ),
              ]

              // Container(
              //   color: Colors.yellow,
              //   height: 200,
              //   margin: EdgeInsets.all(5),
              // ),
              // Container(
              //   color: Colors.yellow,
              //   height: 200,
              //   margin: EdgeInsets.all(5),
              // ),
              // Container(
              //   color: Colors.yellow,
              //   height: 200,
              //   margin: EdgeInsets.all(5),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
