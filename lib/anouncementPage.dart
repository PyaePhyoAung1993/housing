import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:housing/anouncementDetailPage.dart';
import 'package:housing/screens/advertisementDetailPage.dart';
import 'package:http/http.dart' as http;

class NoticeSwiperPage extends StatefulWidget {
  String token;
  var data;

  NoticeSwiperPage({Key key, @required this.token, this.data})
      : super(key: key);
  @override
  _AdvertisementPageState createState() => _AdvertisementPageState();
}

class _AdvertisementPageState extends State<NoticeSwiperPage> {
  var api = 'https://bobahtoo-housing.com/api/announcement_info';
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
      datas = jsonDecode(res.body)['data'];
    }

    print('Response data : $datas');
    print('String Response  ${datas.toString()}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anouncement List Page"),
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
                                              AnouncementDetailPage(
                                            data: data,
                                            token: widget.token,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      margin: EdgeInsets.only(
                                          top: 10, left: 20, right: 20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side:
                                            BorderSide(color: Colors.grey[100]),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          // color: Colors.deepPurpleAccent,
                                        ),
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.2,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                // crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.blue,
                                                    ),
                                                    margin: EdgeInsets.only(
                                                        top: 20),
                                                    child: Text(
                                                      "Announcement",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17,
                                                        // backgroundColor: Colors.blue,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text(
                                                      "${data['title']}",
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            1,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            9,
                                                    child: Text(
                                                      "${data['description']}",
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            _ImageCart("${data['photo']}")
                                          ],
                                        ),
                                      ),
                                    ));
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
              margin: EdgeInsets.only(top: 3000),
              child: Text(""),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ImageCart(String img) {
    return Container(
      width: 120,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]),
      ),
    );
  }
}
