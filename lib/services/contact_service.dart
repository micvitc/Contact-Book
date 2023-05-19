import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/contact.dart';

class ContactService {
  final String _url = 'https://navi2329.github.io/contacts.json';
  Future<List<Contact>> getContacts() async {
    try {
      final response = await http.get(Uri.parse(_url));
      if (response.statusCode == HttpStatus.ok) {
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        final contacts = jsonData
            .map((data) => Contact(
                name: data['name'],
                location: data['location'],
                cabin: data['cabin'],
                phone: data['phone'],
                email: data['email'],
                type: data['department']))
            .toList();
        contacts.sort((a, b) => a.name.compareTo(b.name));
        return contacts;
      } else {
        throw Exception('Failed to load contacts');
      }
    } catch (e) {
      throw Exception('Failed to load contacts1');
    }
  }
}
