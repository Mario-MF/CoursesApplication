import 'package:coursesapplication/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneScreen extends StatefulWidget {
  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  var phoneCont = TextEditingController();
  var codeCont = TextEditingController();
  bool isCode = false;
  String verCode = '';

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Auth'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                if (!isCode)
                  Container(
                    width: double.infinity,
                    height: 80,
                    child: defaultFormField(
                        maxlenth: 10,
                        type: TextInputType.number,
                        controller: phoneCont,
                        context: context,
                        title: 'Phone',
                        icon: Icon(Icons.phone),
                        hintText: 'Enter Your Phone Number'),
                  ),
                if (isCode)
                  Container(
                    width: double.infinity,
                    height: 80,
                    child: defaultFormField(
                        maxlenth: 6,
                        type: TextInputType.number,
                        controller: codeCont,
                        context: context,
                        title: 'Code',
                        icon: Icon(Icons.phone),
                        hintText: 'Enter The Verification code'),
                  ),
                SizedBox(
                  height: 20,
                ),
                defaulttButton(
                    context: context,
                    text: isCode ? 'start' : 'continue',
                    press: () {

                      if (isCode) {
                        phoneAuth(codeCont.text);

                      } else {
                        String phone = phoneCont.text;
                        if (phone.isEmpty) {
                          showToast(text: 'enter a valid number', error: true);
                          return;
                        } else if (phone.length > 10) {
                          showToast(
                              text: 'Enter the valid number', error: false);
                        } else if (phone.length == 10) {
                          showToast(
                              text: 'The code send To 0$phone', error: false);
                        }
                        sendCode(phone);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendCode(String num) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+20$num",
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int resendToken) {
          isCode = true;
          verCode = verificationId;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }
  void phoneAuth(String code)async{
    PhoneAuthCredential phoneAuthCredential=PhoneAuthProvider.credential(verificationId: this.verCode, smsCode: code);
    await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential).then((value) {
      print(value.user.uid);
      
    }).catchError((e){print(e.toString());});


  }
}
