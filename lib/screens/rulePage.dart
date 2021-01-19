import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:housing/HomePage.dart';
import 'package:http/http.dart' as http;

class RulePage extends StatefulWidget {
  String token;

  RulePage({Key key, @required this.token}) : super(key: key);
  @override
  _RulePageState createState() => _RulePageState();
}

class _RulePageState extends State<RulePage> {
  var api = 'https://bobahtoo-housing.com/api/housing_info';
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
      datas = jsonDecode(res.body)['housing_info'];
    }

    print('Response data : $datas');
    print('String Response  ${datas.toString()}');
    setState(() {});
  }

  int _radioValue;

  bool isSelected = false;

  void _handleRadioValueChange(int value) {
    setState(() {
      fetchData();
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          isSelected = false;
          break;
        case 1:
          isSelected = true;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Housing Rules Page"),
        actions: [
          Icon(Icons.more_vert),
        ],
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
                    height: MediaQuery.of(context).size.height / 2.1,
                    child: res != null
                        ? ListView.builder(
                            itemCount: datas.length,
                            itemBuilder: (context, index) {
                              var data = datas[index];
                              return Container(
                                margin: EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                width: MediaQuery.of(context).size.width * 1,
                                child: Text(
                                  isSelected
                                      ? data['housing_rules_eng']
                                      : data['housing_rules_myan'],
                                  // style: TextStyle(
                                  //     fontSize: 15, color: Colors.blue),
                                ),
                              );
                            },
                          )
                        : Text(" "),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            new Radio(
                              value: 0,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                            new Text(
                              'Myanmar',
                              style: new TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            new Radio(
                              value: 1,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                            new Text(
                              'English',
                              style: new TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => HomePage(
                                  token: widget.token,
                                )));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Home",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          Icon(
                            Icons.near_me,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
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
