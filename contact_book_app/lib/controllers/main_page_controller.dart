import 'dart:convert';
import 'package:contact_book_app/models/main_page_model.dart';
import 'package:http/http.dart' as http;

class ContactController {
  static const String _apiUrl = 'http://127.0.0.1:5000/contacts';

  Future<List<Contact>> fetchContacts() async {
    final response = await http.get(Uri.parse(_apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> contactsJson = jsonDecode(response.body);
      final List<Contact> contacts = [];
      for (final dynamic json in contactsJson) {
        final Contact contact = Contact.fromJson(json);
        contacts.add(contact);
      }
      return contacts;
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}

