import 'package:contact_book_app/models/main_page_model.dart';
import 'package:flutter/material.dart';
import 'package:contact_book_app/controllers/main_page_controller.dart';

class HomePage extends StatelessWidget {
  final ContactController contactController = ContactController();

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
            child: ContactList(contactController: contactController),
          ),
        ],
      ),
    );
  }
}

/*class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
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
}*/


class ContactList extends StatelessWidget {
  final ContactController contactController;

  const ContactList({required this.contactController});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contact>>(
      future: contactController.fetchContacts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final contacts = snapshot.data ?? [];
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return ContactCard(
                name: contact.name,
                designation: contact.designation,
                number: contact.mobileNumber,
                email: contact.email,
                cabin: contact.cabin,
              );
            },
          );
        }
      },
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
          // Handle contact tap
        },
      ),
    );
  }
}
