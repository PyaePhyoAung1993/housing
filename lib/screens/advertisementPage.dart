import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:housing/screens/advertisementDetailPage.dart';
import 'package:http/http.dart' as http;

class AdvertisementPage extends StatefulWidget {
  String token;

  AdvertisementPage({Key key, @required this.token}) : super(key: key);
  @override
  _AdvertisementPageState createState() => _AdvertisementPageState();
}

class _AdvertisementPageState extends State<AdvertisementPage> {
  var api = 'https://bobahtoo-housing.com/api/advertisement_info';
  var res, datas;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.post(api, headers: {
      "Accept": 'application/json',
      "Authorization": "Bearer ${widget.token}"
    }, body: {
      "advertiser_id": '1'
    });
    if (res != null) {
      datas = jsonDecode(res.body)['advertisement_all'];
    }

    print('Response data : $datas');
    print('String Response  ${datas.toString()}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advertisement List Page"),
        actions: [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
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
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 130),
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height,
                      child: res != null
                          ? ListView.builder(
                              itemCount: datas.length,
                              itemBuilder: (context, index) {
                                var data = datas[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AdvertisementDetailPage(
                                          data: data,
                                          token: widget.token,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border:
                                          Border.all(color: Colors.blue[300]),
                                      color: Colors.white,
                                    ),
                                    margin: EdgeInsets.only(
                                        top: 10, left: 20, right: 20),
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "Advertisment",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "${data['title']}",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              Text(
                                                "${data['short_des']}",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          child: Image(
                                            image:
                                                NetworkImage("${data['img1']}"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : Text(" "),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 1000),
              child: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}
