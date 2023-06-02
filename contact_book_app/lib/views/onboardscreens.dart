// ignore_for_file: must_be_immutable

import 'package:contact_book_app/views/homepage.dart';
import 'package:flutter/material.dart';

class OnBoardScreens extends StatelessWidget {
  OnBoardScreens({super.key});
  PageController controller = new PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(controller: controller, children: [
      OnBoard1(
        controller: controller,
      ),
      OnBoard2(
        controller: controller,
      ),
    ]);
  }
}

class OnBoard2 extends StatelessWidget {
  OnBoard2({super.key, required this.controller});

  PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            const Center(child: Text("PageTwo")),
            Spacer(),
            SafeArea(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
                child: Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                      child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoard1 extends StatelessWidget {
  OnBoard1({super.key, required this.controller});

  PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            const Center(child: Text("PageOne")),
            Spacer(),
            SafeArea(
              child: GestureDetector(
                onTap: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                },
                child: Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                      child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
