import 'package:contact_book/services/contact_service.dart';
import 'package:contact_book/widget/contact_list.dart';
import 'package:flutter/material.dart';

import 'models/contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ContactService _contactService = ContactService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contact>>(
      future: _contactService.getContacts(),
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text('Failed to load contacts'),
              ),
            ),
          );
        } else {
          final contacts = snapshot.data!;
          return MaterialApp(
            home: ContactList(contacts: contacts),
            debugShowCheckedModeBanner: false,
          );
        }
      },
    );
  }
}
