import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sns_connect/src/widgets/splash.dart';
import 'package:sns_connect/src/screens/profile/create/create_profile.dart';
import 'package:sns_connect/src/screens/home/home.dart';
import 'package:sns_connect/src/db/DBProvider.dart';
import 'package:sns_connect/src/db/models/profile.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  @override
  void initState() {
    super.initState();

    var duration = new Duration(seconds: 2);

    new Timer(duration, () {
      checkExistsProfile();
    });
  }

  checkExistsProfile() {
    DBProvider.db.getProfile(1).then((profile) {
      print(profile);
      if (profile == null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CreateProfile())
        );
      }
      else {
        Profile p = profile;
        print(p.toMap());
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home())
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}