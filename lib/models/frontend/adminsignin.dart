import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/admin_funcs.dart';
import 'package:onlineshop/models/frontend/adminPanel.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

class adminSignin extends StatefulWidget {
  final Size size;
  const adminSignin({Key? key, required this.size}) : super(key: key);

  @override
  State<adminSignin> createState() => _adminSigninState();
}

class _adminSigninState extends State<adminSignin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errortext = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<listofcategorysubjectProvider>(
          create: (_) => listofcategorysubjectProvider(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<listofcategorysubjectProvider>(
                builder: (context, value, child) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(
                    left: widget.size.width * .15,
                    right: widget.size.width * .15,
                    top: widget.size.height * .18,
                    bottom: widget.size.height * .09,
                  ),
                  // width: 350,
                  // height: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal[300],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: widget.size.height * 0.05,
                      ),
                      const Text(
                        'پنل مدیریت سایت',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: widget.size.height * 0.08,
                      ),
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
                          'رمز عبور',
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(
                        height: widget.size.height * 0.01,
                      ),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: widget.size.height * 0.04,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (await authenticateAdmin(usernameController.text,
                              passwordController.text)) {
                            usernameController.clear();
                            passwordController.clear();
                            errortext = '';

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    panelmanagement(size: widget.size),
                              ),
                            );
                          } else {
                            usernameController.clear();
                            passwordController.clear();

                            errortext = '!! نام کاربری یا رمز عبور اشتباه است';
                          }
                          setState(() {});
                        },
                        child: const Center(
                          child: Text('ورود'),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
              Text(
                errortext,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
