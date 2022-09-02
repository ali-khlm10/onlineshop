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
                  height: 300,
                  width: 600,
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[200],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          'assets/images/camera_1.jpg',
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'دوربین مداربسته',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'اطلاعات بیشتر',
                              style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
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
