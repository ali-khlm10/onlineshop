import 'package:flutter/material.dart';

class appbar extends StatefulWidget {
  const appbar({Key? key}) : super(key: key);

  @override
  State<appbar> createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  PreferredSizeWidget Appbar() {
    return AppBar(
      title: const Text('فروشگاه اینترنتی'),
      centerTitle: true,
      leading: const Icon(Icons.shopping_cart),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Appbar();
  }
}
