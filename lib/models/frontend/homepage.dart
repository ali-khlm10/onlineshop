import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/Body.dart';
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
      appBar: AppBar(
        leading: Row(
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
        leadingWidth: 150,
        actions: [
          SizedBox(
            width: 150,
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  isDense: true,
                ),
                maxLines: 2,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10),
            child: const Text(
              'فروشگاه اینترنتی',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Body(size: size),
    );
  }
}
