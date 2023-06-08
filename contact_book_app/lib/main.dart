import 'package:contact_book_app/views/homepage.dart';
import 'package:contact_book_app/views/onboardscreens.dart';
import 'package:flutter/material.dart';
import 'package:contact_book_app/controllers/main_page_controller.dart';

void main() {
  runApp(ContactBookApp());
}

class ContactBookApp extends StatelessWidget {
  final ContactController _contactController = ContactController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIT Contact Book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnBoardScreens(),
    );
  }
}
