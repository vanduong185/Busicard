import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sns_connect/src/widgets/large_button.dart';
import 'package:sns_connect/src/widgets/socical_input.dart';

import 'package:sns_connect/src/db/DBProvider.dart';
import 'package:sns_connect/src/db/models/profile.dart';
import 'package:sns_connect/src/db/models/social_network.dart';

class SocialInfo extends StatefulWidget {
  Profile profile;
  SocialInfo(this.profile);

  @override
  _SocialInfoState createState() => _SocialInfoState();
}

class _SocialInfoState extends State<SocialInfo> {
  List<SocialNetwork> listSocialNetwork;

  @override
  void initState() {
    super.initState();
    listSocialNetwork = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Center(
                  child: Text(
                    "Social Information",
                    style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1980BA)),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40, bottom: 30),
                child: Text("Let's fill up your profile to share with everyone in easiest way",
                  style: TextStyle(color: Color(0xFF333333)),
                  textAlign: TextAlign.center,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, bottom: 15),
                child: SocialInput(
                  hintText: "Facebook Url",
                  color: Color(0xFF1877F2),
                  icon: Icon(FontAwesomeIcons.facebookSquare, size: 40, color: Color(0xFF1877F2)),
                  onFind: () {},
                  onChanged: (text) {
                    setState(() {
//                      socialNetwork.url = text;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, bottom: 15),
                child: SocialInput(
                  hintText: "Twitter Url",
                  color: Color(0xFF1DA1F2),
                  icon: Icon(FontAwesomeIcons.twitterSquare, size: 40, color: Color(0xFF1DA1F2)),
                  onFind: () {},
                  onChanged: (text) {
                    setState(() {
//                      widget.profile.twitterUrl = text;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, bottom: 15),
                child: SocialInput(
                  hintText: "LinkedIn Url",
                  color: Color(0xFF0077B5),
                  icon: Icon(FontAwesomeIcons.linkedin, size: 40, color: Color(0xFF0077B5)),
                  onFind: () {},
                  onChanged: (text) {
                    setState(() {
//                      widget.profile.linkedInUrl = text;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
                child: LargeButton(
                  text: "Next",
                  onTap: () {
                    //print(widget.profile.toMap());
//                    DBProvider.db.newProfile(widget.profile).then((raw) {
//                      print(raw);
//                    }) ;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Center(
                  child: GestureDetector(
                    child: Text("Back", style: TextStyle(color: Color(0xFF333333)),),
                    onTap: () {
                      Navigator.pop(
                        context
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
