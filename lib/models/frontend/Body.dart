import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/ItemsList.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Itemslist(size: widget.size),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  // color: Colors.red,
                  height: widget.size.height * .8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.yellow,
                          height: 200,
                          margin: EdgeInsets.all(5),
                        ),
                        Container(
                          color: Colors.yellow,
                          height: 200,
                          margin: EdgeInsets.all(5),
                        ),
                        Container(
                          color: Colors.yellow,
                          height: 200,
                          margin: EdgeInsets.all(5),
                        ),
                        Container(
                          color: Colors.yellow,
                          height: 200,
                          margin: EdgeInsets.all(5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                  height: widget.size.height * .8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                        Text('item1'),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
