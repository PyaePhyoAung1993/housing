import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  String token;

  ProfilePage({Key key, @required this.token}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var api = 'https://bobahtoo-housing.com/api/room_user_info';
  var res, datas;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.post(
      api,
      headers: {
        "Accept": 'application/json',
        "Authorization": "Bearer ${widget.token}"
      },
    );
    if (res != null) {
      datas = jsonDecode(res.body)['room_user_info'];
    }

    print('Response data : $datas');
    print('String Response  ${datas.toString()}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Room User Information"),
        actions: [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.blue,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100, left: 20, right: 20),
              height: MediaQuery.of(context).size.height / 1.8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.blue,
                  width: 0.0,
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Room User Info",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height / 2.1,
                    child: res != null
                        ? Container(
                            margin: EdgeInsets.only(top: 20),
                            width: MediaQuery.of(context).size.width * 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 40),
                                      child: Text(
                                        "Email   :",
                                        style: textStyle,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 40),
                                      child: Text(
                                        datas['user_email'],
                                        style: textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 40),
                                      child: Text(
                                        "UserName   :",
                                        style: textStyle,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 110),
                                      child: Text(
                                        datas['name'],
                                        style: textStyle,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 40),
                                      child: Text(
                                        "Phone Number :",
                                        style: textStyle,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 70),
                                      child: Text(
                                        datas['phone'],
                                        style: textStyle,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Family Member :",
                                      style: textStyle,
                                    ),
                                    Text("                           "),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 40),
                                      child: Text(
                                        "Car    :",
                                        style: textStyle,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 110),
                                      child: Text(
                                        "3J-9847\n7l-6569",
                                        style: textStyle,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Text(" "),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const textStyle = TextStyle(
  color: Colors.blue,
);
