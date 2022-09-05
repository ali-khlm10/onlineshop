import 'package:flutter/material.dart';

class cameramanagement extends StatefulWidget {
  const cameramanagement({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<cameramanagement> createState() => _cameramanagementState();
}

class _cameramanagementState extends State<cameramanagement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      // color: Colors.red,
      margin: EdgeInsets.symmetric(
          horizontal: widget.size.width * 0.02,
          vertical: widget.size.height * .08),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('اضافه کردن برند برای دوربین'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('اضافه کردن محصول برای یک برند دوربین'),
          ),
        ],
      ),
    );
  }
}
