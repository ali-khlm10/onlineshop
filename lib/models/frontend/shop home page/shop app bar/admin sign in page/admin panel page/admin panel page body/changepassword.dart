import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/admin_funcs.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

class changepass extends StatefulWidget {
  const changepass({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  State<changepass> createState() => _changepassState();
}

class _changepassState extends State<changepass> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController currentpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();

  //

  @override
  Widget build(BuildContext context) {
    return Consumer<listofcategorysubjectProvider>(
      builder: (context, value, child) => Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red[100],
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: const Text(
                'نام کاربری',
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.01,
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.01,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: const Text(
                'رمز عبور فعلی',
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.01,
            ),
            TextField(
              controller: currentpasswordController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.01,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: const Text(
                'رمز عبور جدید',
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.01,
            ),
            TextField(
              controller: newpasswordController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.04,
            ),
            ElevatedButton(
              onPressed: () {
                updateAdminPassword(
                  usernameController.text,
                  currentpasswordController.text,
                  newpasswordController.text,
                );
                usernameController.clear();
                currentpasswordController.clear();
                newpasswordController.clear();
                value.afterchangepasswordbody(widget.size);
              },
              child: const Center(
                child: Text('تغییر'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
