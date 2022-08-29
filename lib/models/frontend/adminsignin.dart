import 'package:flutter/material.dart';

class adminSignin extends StatefulWidget {
  final Size size;
  const adminSignin({Key? key, required this.size}) : super(key: key);

  @override
  State<adminSignin> createState() => _adminSigninState();
}

class _adminSigninState extends State<adminSignin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.symmetric(
            horizontal: widget.size.width * .2,
            vertical: widget.size.height * .18,
          ),
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.teal,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: widget.size.height * 0.05,
              ),
              const Text('پنل مدیریت سایت'),
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
                onPressed: () {},
                child: const Center(
                  child: Text('ورود'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
