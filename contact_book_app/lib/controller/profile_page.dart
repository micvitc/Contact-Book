import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contact_book_app/model/user.dart';
import 'package:contact_book_app/utils/user_preferences.dart';
import 'package:contact_book_app/widgets/appbar_widget.dart';
import 'package:contact_book_app/widgets/button_widget.dart';
import 'package:contact_book_app/widgets/numbers_widget.dart';
import 'package:contact_book_app/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String designation;
  final String number;
  final String email;
  final String cabin;

  ProfilePage({
    required this.name,
    required this.designation,
    required this.number,
    required this.email,
    required this.cabin,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: buildProfile(user),
            ),
            const SizedBox(height: 24),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ActionsWidget(),
                      const SizedBox(height: 24),
                      buildUserDetailsCard(user),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfile(User user) => Column(
    children: [
      Text(
        widget.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        widget.email,
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );

  Widget buildUserDetailsCard(User user) => ButtonWidget(
    phoneNo: 'Phone number - ' + user.simProvider + "\n" + user.phoneNo,
    address: user.address,
    email: widget.email,
  );
}
