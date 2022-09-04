import 'package:flutter/material.dart';

class mobilemanagement extends StatefulWidget {
  const mobilemanagement({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<mobilemanagement> createState() => _mobilemanagementState();
}

class _mobilemanagementState extends State<mobilemanagement> {
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
            child: Text('اضافه کردن برند برای موبایل'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('اضافه کردن محصول برای یک برند موبایل'),
          ),
        ],
      ),
    );
  }
}
