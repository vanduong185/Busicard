import "package:flutter/material.dart";

class LargeButton extends StatefulWidget {
  final String text;
  final GestureTapCallback onTap;

  LargeButton({Key key, this.text, this.onTap}) : super(key: key) ;

  @override
  _LargeButtonState createState() => _LargeButtonState();
}

class _LargeButtonState extends State<LargeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [const Color(0xFF1980BA), const Color(0xFF4AB7E0)],
                  tileMode: TileMode.repeated
              )
          ),
          child: Center(
            child: Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 16),),
          )
      ),
    );
  }
}