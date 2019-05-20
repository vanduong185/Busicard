import 'package:flutter/material.dart';

import 'package:sns_connect/src/screens/profile/create/social_info.dart';
import 'package:sns_connect/src/widgets/large_button.dart';

import 'package:sns_connect/src/db/models/profile.dart';
import 'package:sns_connect/src/db/DBProvider.dart';

class PersonalInfoForm extends StatefulWidget {
  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  Profile profile;

  @override
  void initState() {
    super.initState();
    profile = new Profile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xFFBFBFBF)),
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Column(
              children: <Widget>[
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xFFBFBFBF), width: 1))
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(color: Color(0xFFBFBFBF), width: 1))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "First Name",
                                    hintStyle: TextStyle(color: Color(0xFFBFBFBF), fontSize: 14)
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    profile.firstname = text;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Last Name",
                                    hintStyle: TextStyle(color: Color(0xFFBFBFBF), fontSize: 14)
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    profile.lastname = text;
                                  });
                                }
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                ),

                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color(0xFFBFBFBF), width: 1))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Position",
                          hintStyle: TextStyle(color: Color(0xFFBFBFBF), fontSize: 14)
                      ),
                      onChanged: (text) {
                        setState(() {
                          profile.position = text;
                        });
                      }
                    ),
                  ),
                ),

                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color(0xFFBFBFBF), width: 1))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(color: Color(0xFFBFBFBF), fontSize: 14)
                      ),
                      onChanged: (text) {
                        setState(() {
                          profile.email = text;
                        });
                      },
                    ),
                  ),
                ),

                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color(0xFFBFBFBF), width: 1))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Tel",
                          hintStyle: TextStyle(color: Color(0xFFBFBFBF), fontSize: 14)
                      ),
                      onChanged: (text) {
                        setState(() {
                          profile.tel = text;
                        });
                      },
                    ),
                  ),
                ),

                Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Company",
                          hintStyle: TextStyle(color: Color(0xFFBFBFBF), fontSize: 14)
                      ),
                      onChanged: (text) {
                        setState(() {
                          profile.company = text;
                        });
                      },
                    ),
                  ),
                )
              ],
            )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: LargeButton(
            text: 'Next',
            onTap: () {

//              if(profile.firstname != null && profile.lastname != null) {
//                if (profile.firstname.length > 0 && profile.lastname.length > 0) {
//                  print(profile.toMap());
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => SocialInfo(profile))
//                  );
//                }
//              }
              DBProvider.db.newProfile(profile).then((result) {
                print(result);
                if (result == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SocialInfo(profile))
                  );
                }
              });
            },
          ),
        )
      ],
    );
  }
}
