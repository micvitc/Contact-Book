import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String phoneNo;
  final String address;
  final String email;

  const ButtonWidget({
    Key? key,
    required this.phoneNo,
    required this.address,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
      //["note1", "note2", "note3"]

    //   height: 60,
    // width : 300,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,

      children: <Widget>[
        Container(height: 80, width: 400,
        child: Card(

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(phoneNo),
            )
        )),
        Container(height: 200, width: 400,
            child: Card(

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Ads"),
                )
            )),
        Container(height: 50, width: 400,
            child: Card(

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(address),
                )
            )),
        Container(height: 50, width: 400,
            child: Card(

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(email),
                )
            )),
  ]);
}
