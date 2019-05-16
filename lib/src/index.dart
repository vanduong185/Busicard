import 'dart:async';

import 'package:flutter/material.dart';

import 'package:bussiness_card/src/widgets/splash.dart';
import 'package:bussiness_card/src/screens/profile/create/create_profile.dart';
import 'package:bussiness_card/src/db/DBProvider.dart';
import 'package:bussiness_card/src/db/models/profile.dart';

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

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}