import 'package:flutter/material.dart';

class sellmanagement extends StatefulWidget {
  const sellmanagement({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<sellmanagement> createState() => _sellmanagementState();
}

class _sellmanagementState extends State<sellmanagement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widget.size.width * 0.02,
          vertical: widget.size.height * .08),
      child: Column(
        children: [
          Text('کالاهای ثبت شده مشتریان'),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
