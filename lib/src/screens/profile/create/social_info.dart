import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:bussiness_card/src/widgets/small_button.dart';

class SocialInfo extends StatefulWidget {
  @override
  _SocialInfoState createState() => _SocialInfoState();
}

class _SocialInfoState extends State<SocialInfo> {
  @override
  void initState() {
    super.initState();
  }

  findFB() async{
    FacebookLogin facebookLogin = FacebookLogin();
    var result = await facebookLogin.logInWithReadPermissions(['email']);
    print(result);
//    switch (result.status) {
//      case FacebookLoginStatus.loggedIn:
//        _sendTokenToServer(result.accessToken.token);
//        _showLoggedInUI();
//        break;
//      case FacebookLoginStatus.cancelledByUser:
//        _showCancelledMessage();
//        break;
//      case FacebookLoginStatus.error:
//        _showErrorOnUI(result.errorMessage);
//        break;
//    }
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
                padding: const EdgeInsets.only(right: 30, left: 30, bottom: 30),
                child: Container(
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
                          child: Icon(Icons.category, size: 40, color: Color(0xFF1877F2),),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Facebook URL",
                                hintStyle: TextStyle(color: Color(0xFFBFBFBF), fontSize: 14)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: SmallButton(
                            text: "Find",
                            color: Color(0xFF1877F2),
                            onTap: findFB(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
