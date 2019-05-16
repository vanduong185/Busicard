import "package:flutter/material.dart";

class SmallButton extends StatefulWidget {
  final String text;
  final Function onTap;
  final Color color;

  SmallButton({Key key, this.text, this.color, this.onTap}) : super(key: key) ;

  @override
  _SmallButtonState createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          height: 35,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: widget.color
          ),
          child: Center(
            child: Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 12),),
          )
      ),
    );
  }
}