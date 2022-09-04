import 'package:flutter/material.dart';

class brandsmanagement extends StatefulWidget {
  const brandsmanagement({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  State<brandsmanagement> createState() => _brandsmanagementState();
}

class _brandsmanagementState extends State<brandsmanagement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widget.size.width * .05,
        vertical: widget.size.height * .1,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('تغییر'),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('حذف'),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('اضافه'),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
