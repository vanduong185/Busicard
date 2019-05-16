import 'package:flutter/material.dart';

import 'package:bussiness_card/src/screens/profile/create/social_info.dart';
import 'package:bussiness_card/src/widgets/large_button.dart';

class PersonalInfoForm extends StatefulWidget {
  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SocialInfo())
              );
            },
          ),
        )
      ],
    );
  }
}
