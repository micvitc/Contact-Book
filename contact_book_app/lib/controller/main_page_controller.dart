import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:contact_book_app/model/main_page_model.dart';

class ContactController {
  static const String _apiUrl = 'https://api.jsonbin.io/v3/qs/6468707d8e4aa6225ea0686e';

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
