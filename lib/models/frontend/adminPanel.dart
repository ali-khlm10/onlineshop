import 'package:flutter/material.dart';

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
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: widget.size.width * 0.15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    height: 100,
                  ),
                  Expanded(child: Center(child: Text('تغییر رمز'))),
                  Expanded(child: Center(child: Text('بخش فروش'))),
                  Expanded(child: Center(child: Text('دوربین'))),
                  Expanded(child: Center(child: Text('موبایل'))),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: widget.size.height * .4,
                      // color: Colors.yellow,
                      child: const Center(
                        child: Text('تغییر'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 1),

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: widget.size.height * .4,
                      // color: Colors.red,
                      child: const Center(
                        child: Text('مدیریت فروش'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 1),

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: widget.size.height * .4,
                      // color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: Text(
                              'اضافه کردن محصول',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'اضافه کردن موضوع',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 1),

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: widget.size.height * .4,
                      // color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: Text(
                              'اضافه کردن محصول',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'اضافه کردن موضوع',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
