
import 'package:coursesapplication/modules/login/login_screen.dart';
import 'package:coursesapplication/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff7f7f7),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 50, top: 50),
                    child: Container(
                      child: Text(
                        'Welcome To App!',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'AndikaNewBasic',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              child: Center(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 230,
                        child: Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Learning Now',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'AndikaNewBasic',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: defultButton(
                              text: 'Sign In',
                              color: Theme.of(context).primaryColor,
                              r: 10,
                              height: 50.0,
                              fz: 20,
                              toUpper: false,
                              function: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: defultButton(
                              text: 'Sign Up',
                              color: Colors.white,
                              r: 5,
                              height: 50.0,
                              fz: 20,
                              function: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));


                              },
                              toUpper: false,
                              textColor: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Sign in with',
                    style:
                        TextStyle(fontFamily: 'AndikaNewBasic', fontSize: 17),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          handleSignIn();

                        },
                        child: Image(
                          image: AssetImage('assets/images/gmailicon.png'),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: (){
                          // handleSignIn();
                        },

                        child: Image(
                          image: AssetImage('assets/images/faceicon.png'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> handleSignIn() async {
    await  googleSignIn.signIn().then((value) async{
      print(value.email);
      print(value.displayName);
      print(value.photoUrl);
      print(value.id);
      GoogleSignInAuthentication googleSignInAuthentication=await value.authentication;
      AuthCredential credential =GoogleAuthProvider.credential(
        accessToken:  googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken

      );
      await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        print(value.user.uid);

      }).catchError((e){print(e.toString());});
    }).catchError((e){
      print(e.toString());
    });
  }
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

}
