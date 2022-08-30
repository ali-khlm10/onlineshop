import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class Itemslist extends StatefulWidget {
  const Itemslist({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<Itemslist> createState() => _ItemslistState();
}

class _ItemslistState extends State<Itemslist> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          controller: controller,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Material(
                color: Colors.teal,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  onTap: () {},
                  child: SizedBox(
                    width: widget.size.width * .2,
                    child: const Center(
                      child: Text(
                        'item',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          reverse: true,
          padding: const EdgeInsets.only(top: 20),
        ),
      ),
    );
  }
}
