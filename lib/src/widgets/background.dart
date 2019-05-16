import "package:flutter/material.dart";

class Background extends StatefulWidget {
  final Widget child;

  Background({Key key, this.child}) : super(key: key) ;

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF1980BA), const Color(0xFF4AB7E0)],
                tileMode: TileMode.repeated
            )
        ),
        child: widget.child
    );
  }
}