import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:housing/screens/rulePage.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userCodeController = TextEditingController();

  final passwordController = TextEditingController();

  var api = 'https://bobahtoo-housing.com/api/authentication';
  var res, datas;

  @override
  void initState() {
    super.initState();
  }

  fetchData(String userCodeController, String passwordController) async {
    res = await http.post(api, headers: {
      "Accept": 'application/json',
    }, body: {
      'user_code': userCodeController,
      'password': passwordController
    });
    if (res != null) {
      datas = jsonDecode(res.body);
    }

    print('Response data : $datas');
    print('String Response  ${datas.toString()}');
    print("Access Token   :" + datas['access_token']);
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (c) => RulePage(
                token: datas['access_token'],
              )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image(
                  image: AssetImage("assets/images/f.png"),
                )),
            Container(
              margin: EdgeInsets.only(top: 140, left: 20, right: 20),
              height: 350,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.blue,
                  width: 0.0,
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  // Text(
                  //   "Login",
                  //   style: TextStyle(fontSize: 23, color: Colors.green),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "BoBaHtoo Housing",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: userCodeController,
                      cursorColor: Theme.of(context).cursorColor,
                      maxLength: 20,
                      initialValue: null,
                      decoration: InputDecoration(
                        labelText: 'User Code',
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: passwordController,
                      cursorColor: Theme.of(context).cursorColor,
                      maxLength: 20,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6200EE)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)),
                    color: Colors.white,
                    onPressed: () {
                      fetchData(
                          userCodeController.text, passwordController.text);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  // Text(drinks['access_token']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
