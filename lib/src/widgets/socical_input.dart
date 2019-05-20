import 'package:flutter/material.dart';

import 'package:sns_connect/src/widgets/small_button.dart';

class SocialInput extends StatefulWidget {
  final Function onFind;
  final String hintText;
  final Color color;
  final Icon icon;
  final ValueChanged<String> onChanged;

  SocialInput({Key key, this.hintText, this.color, this.onFind, this.icon, this.onChanged}) : super(key: key) ;

  @override
  _SocialInputState createState() => _SocialInputState();
}

class _SocialInputState extends State<SocialInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFBFBFBF), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: widget.icon,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(color: Color(0xFFBFBFBF), fontSize: 14)
                ),
                onChanged: widget.onChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SmallButton(
                text: "Active",
                color: widget.color,
                onTap: widget.onFind(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
