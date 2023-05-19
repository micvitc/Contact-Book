import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_example/model/user.dart';
import 'package:user_profile_example/utils/user_preferences.dart';
import 'package:user_profile_example/widget/appbar_widget.dart';
import 'package:user_profile_example/widget/button_widget.dart';
import 'package:user_profile_example/widget/numbers_widget.dart';
import 'package:user_profile_example/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildProfile(user),
          const SizedBox(height: 24),
          ActionsWidget(),
          const SizedBox(height: 50),
          Center(child: buildUserDetailsCard(user)),
          const SizedBox(height: 24),
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  Widget buildProfile(User user) =>
      Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUserDetailsCard(User user) =>
      ButtonWidget(
          phoneNo: 'Phone number - ' + user.simProvider + "\n" + user.phoneNo,
          address: user.address,
          email: user.email
      );
}