import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

class panelmanagement extends StatefulWidget {
  const panelmanagement({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<panelmanagement> createState() => _panelmanagementState();
}

class _panelmanagementState extends State<panelmanagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بخش مدیریت فروشگاه'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<listofcategorysubjectProvider>(
          create: (_) => listofcategorysubjectProvider(),
          child: Consumer<listofcategorysubjectProvider>(
            builder: (context, value, child) => Container(
              // color: Colors.red,
              // height: widget.size.height * .08,
              // width: 30,
              margin: EdgeInsets.symmetric(
                horizontal: widget.size.width * 0.1,
                vertical: widget.size.height * 0.1,
              ),
              child: Column(
                children: [
                  SizedBox(
                    // color: Colors.red,
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: adminpanelcategory.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Material(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () {
                                if (index == 0) {
                                  value.changemobilemanagementbody(widget.size);
                                } else if (index == 1) {
                                  value.changecameramanagementbody(widget.size);
                                } else if (index == 2) {
                                  value.changesellmanagementbody(widget.size);
                                } else if (index == 3) {
                                  value.changepasswordbody(widget.size);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 3),
                                child: Center(
                                  child: Text(
                                    adminpanelcategory[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      reverse: true,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  // changepass(size: widget.size),
                  value.getpanelItemsBody,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
