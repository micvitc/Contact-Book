import 'package:flutter/material.dart';

class ActionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, 'call','call'),
          buildButton(context,'message','message'),
          buildButton(context,'block','block'),
        ],
      );
  Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            if(value == 'call')
              Icon(IconData(0xe4a2, fontFamily: 'MaterialIcons'))
            else if(value == 'message')
              Icon(IconData(0xe3e0, fontFamily: 'MaterialIcons'))
            else if(value == 'block')
              Icon(IconData(0xe0e1, fontFamily: 'MaterialIcons')),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
