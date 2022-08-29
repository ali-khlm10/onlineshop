import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/Appbar.dart';
import 'package:onlineshop/models/frontend/adminPanel.dart';
import 'package:onlineshop/models/frontend/adminsignin.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late Size size = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('فروشگاه اینترنتی'),
        centerTitle: true,
        leading: Container(
          // color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.shopping_cart),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => adminSignin(size: size),
                      ));
                },
                child: const Center(
                  child: Text(
                    'ورود مدیران',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        leadingWidth: 200,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.list_sharp),
          ),
        ],
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Container(
            height: 20,
            color: Colors.yellow,
          ),
        ),
      ),
      endDrawer: Drawer(),
    );
  }
}
