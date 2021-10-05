import 'package:chothuexemay_mobile/models/customer_model.dart';
import 'package:chothuexemay_mobile/services/authservice.dart';
import 'package:chothuexemay_mobile/view_model/customer_view_model.dart';
import 'package:chothuexemay_mobile/views/Login/Step2/login_view_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginBody extends StatefulWidget {
  Size size;

  LoginBody({required this.size});

  @override
  State<StatefulWidget> createState() => _LoginBody();
}

class _LoginBody extends State<LoginBody> {
  final phoneController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = "";
  String smsCode = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            right: widget.size.width * 0.15,
            left: widget.size.width * 0.15,
            top: widget.size.height * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Số điện thoại",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 45,
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(64, 152, 62, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 25)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    verifyPhone(phoneController.text);
                    // return LoginView2(
                    //   verificationId: verificationId,
                    //   phone: phoneController.text,
                    // );
                  },
                  child: Text(
                    "Tiếp theo",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  color: Color.fromRGBO(110, 215, 152, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> verifyPhone(String phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      // To do
      AuthService().signIn(authResult);
    };
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      SnackBar(
        content:
            Text("Failed to Verify Phone Number: ${authException.message}"),
      );
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int? forceResend]) {
      this.verificationId = verId;
      SnackBar(
        content: Text('VerificationId: ' + verId),
      );
      setState(() {
        LoginView2(verificationId: verificationId, phone: phoneNo);
      });
    } as PhoneCodeSent;

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNo,
          verificationCompleted: verified,
          verificationFailed: verificationFailed,
          codeSent: smsSent,
          codeAutoRetrievalTimeout: autoTimeout,
          timeout: const Duration(seconds: 5));
    } catch (e) {
      SnackBar(
        content: Text("Failed to Verify Phone Number: ${e}"),
      );
    }
  }
}
