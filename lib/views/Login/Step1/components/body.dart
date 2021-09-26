import 'package:chothuexemay_mobile/models/customer_model.dart';
import 'package:chothuexemay_mobile/view_model/customer_view_model.dart';
import 'package:chothuexemay_mobile/views/Login/Step2/login_view_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  Size size;
  String phone = "";

  LoginBody({required this.size});

  @override
  State<StatefulWidget> createState() =>_LoginBody();
}

class _LoginBody extends State<LoginBody> {
  final phoneController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CustomerViewModel>(context,listen: false).getAll();
  }
  @override
  Widget build(BuildContext context) {
    final areaList = Provider.of<CustomerViewModel>(context);
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
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginView2(phone: widget.phone);
                      },
                    ));
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
}
