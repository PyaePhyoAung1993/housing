import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:housing/screens/profilePage.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  String token;

  ContactPage({Key key, @required this.token}) : super(key: key);
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var api = 'https://bobahtoo-housing.com/api/employee_info';
  var res, datas;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
      datas = jsonDecode(res.body)['employee_info'];
    }

    print('Response data : $datas');
    print('String Response  ${datas.toString()}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100, left: 20, right: 20),
              height: 450,
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
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height / 1.7,
                    child: res != null
                        ? ListView.builder(
                            itemCount: datas.length,
                            itemBuilder: (context, index) {
                              var data = datas[index];
                              return Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                width: MediaQuery.of(context).size.width * 1,
                                height: 70,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(
                                            "${data['name']}",
                                            style: textStyle,
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "${data['phone']}",
                                            style: textStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _launchURL(
                                                  "tel:${data['phone']}");
                                            });
                                          },
                                          icon: Icon(
                                            Icons.phone,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 2,
                                    ),
                                  ],
                                ),
                              );
                            },
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
