import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnouncementDetailPage extends StatefulWidget {
  var data;
  String token;

  AnouncementDetailPage({Key key, @required this.token, @required this.data})
      : super(key: key);
  @override
  _RulePageState createState() => _RulePageState();
}

class _RulePageState extends State<AnouncementDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Announcement Detail Page"),
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
              height: 380,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => ShowAlertDialogs(),
                          );
                        },
                        child: _ImageCart(widget.data['photo']),
                      ),
                      Text(widget.data['title']),
                      Text(widget.data['description']),
                      Text("Announced Date: ${widget.data['period']}"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ShowAlertDialogs() {
    var imageCart = _ImageCart(widget.data['photo']);
    return AlertDialog(
      backgroundColor: Colors.blue[100],
      content: Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width,
        height: 450,
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    "Announcement",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 80),
                child: imageCart,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _ImageCart(String img) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
      ),
    );

    // if (img != null) {
    //   return Visibility(
    //     visible: true,
    //   child: Container(
    //     width: 120,
    //     height: 100,
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: NetworkImage(img),
    //         fit: BoxFit.fill,
    //       ),
    //       shape: BoxShape.rectangle,
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //   ),
    // );
    // } else {
    //   Visibility(
    //     visible: false,
    //     child: Container(
    //       width: 120,
    //       height: 100,
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           image: NetworkImage(img),
    //           fit: BoxFit.fill,
    //         ),
    //         shape: BoxShape.rectangle,
    //         borderRadius: BorderRadius.circular(15),
    //         border: Border.all(
    //           color: Colors.grey,
    //         ),
    //       ),
    //     ),
    //   );
    // }
  }
}

const textEditStyle = TextStyle(
  color: Colors.blue,
);
