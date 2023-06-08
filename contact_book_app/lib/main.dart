import 'package:flutter/material.dart';
import 'package:contact_book_app/controller/main_page_controller.dart';
import 'package:contact_book_app/controller/profile_page.dart';

void main() {
  runApp(ContactBookApp());
}

class ContactBookApp extends StatelessWidget {
  final ContactController _contactController=ContactController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIT Contact Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Book'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ContactList(),
          ),
        ],
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ContactCard(
          name: 'D. Rekha D',
          designation: 'HoD CSE with AI&Robotics',
          number: '+91 xxx xxx xxxx',
          email: 'rekha.d@vit.ac.in',
          cabin: 'AB1 7th floor annexure',
        ),
        ContactCard(
          name: 'Dr. R. Ganesan',
          designation: 'Dean SCOPE',
          number: '+91 xxx xxx xxxx',
          email: 'ganesan.r@vit.ac.in',
          cabin: 'AB1',
        ),
        // Add more contacts here...
      ],
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String designation;
  final String number;
  final String email;
  final String cabin;

  const ContactCard({
    required this.name,
    required this.designation,
    required this.number,
    required this.email,
    required this.cabin,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              name.substring(0, 1).toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(designation),
              Text(number),
              Text(email),
              Text(cabin),
            ],
          ),
          trailing: Icon(Icons.call),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(name: name,
                  designation: designation,
                  number: number,
                  email: email,
                  cabin: cabin,),
              ),
            );
          },
        )
    );
  }
}