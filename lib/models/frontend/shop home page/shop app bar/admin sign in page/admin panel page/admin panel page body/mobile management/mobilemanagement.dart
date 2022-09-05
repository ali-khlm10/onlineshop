import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

class mobilemanagement extends StatefulWidget {
  const mobilemanagement({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<mobilemanagement> createState() => _mobilemanagementState();
}

class _mobilemanagementState extends State<mobilemanagement> {
  @override
  Widget build(BuildContext context) {
    return Consumer<listofcategorysubjectProvider>(
      builder: (context, value, child) => Container(
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
              onPressed: () {
                value.changebrandsmanagementbody(widget.size);
              },
              child: Text('مدیریت برندهای موبایل'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                value.changeproductmanagementbody(widget.size);
              },
              child: Text('مدیریت محصول برای یک برند موبایل'),
            ),
          ],
        ),
      ),
    );
  }
}
