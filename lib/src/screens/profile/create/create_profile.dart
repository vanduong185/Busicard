import 'package:flutter/material.dart';

import 'package:sns_connect/src/screens/profile/create/personal_info_form.dart';

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
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
                    "Your Profile",
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
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(65)),
                    border: Border.all(color: Color(0xFF1980BA), width: 1),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                            child: Image.asset("lib/assets/images/avatar.png", width: 120, height: 120, fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(65)),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 9,
                        top: 9,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: Colors.white, width: 1),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [const Color(0xFF1980BA), const Color(0xFF4AB7E0)],
                              tileMode: TileMode.repeated
                            )
                          ),
                          child: Center(
                            child: Icon(Icons.camera_alt, color: Colors.white, size: 12,),
                          ),
                        )
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: PersonalInfoForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
