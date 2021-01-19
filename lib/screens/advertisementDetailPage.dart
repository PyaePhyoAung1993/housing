import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdvertisementDetailPage extends StatefulWidget {
  var data;
  String token;

  String img;

  AdvertisementDetailPage({Key key, @required this.token, @required this.data})
      : super(key: key);
  @override
  _RulePageState createState() => _RulePageState();
}

class _RulePageState extends State<AdvertisementDetailPage> {
  var api = 'https://bobahtoo-housing.com/api/advertisement_selected_info';
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
      "id": '${widget.data['id']}'
    });
    if (res != null) {
      datas = jsonDecode(res.body)['advertisement_selected'];
    }
    print('Response data : $datas');
    print('String Response  ${datas.toString()}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advertise Detail Page"),
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
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height / 2.2,
                    child: res != null
                        ? ListView.builder(
                            itemCount: datas.length,
                            itemBuilder: (context, index) {
                              var data = datas[index];
                              widget.img = "${data['img1']}";
                              return Container(
                                margin: EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                width: MediaQuery.of(context).size.width * 1,
                                height:
                                    MediaQuery.of(context).size.height / 2.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (_) =>
                                                        ShowAlertDialogs(),
                                                  );
                                                },
                                                child: _ImageCart(
                                                    "${data['img1']}")),
                                            InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (_) =>
                                                        ShowAlertDialogs(),
                                                  );
                                                },
                                                child: _ImageCart(
                                                    "${data['img2']}")),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (_) =>
                                                        ShowAlertDialogs(),
                                                  );
                                                },
                                                child: _ImageCart(
                                                    "${data['img3']}"),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (_) =>
                                                        ShowAlertDialogs(),
                                                  );
                                                },
                                                child: _ImageCart(
                                                    "${data['img4']}"),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: 80,
                                      margin: EdgeInsets.only(top: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "${data['title']}",
                                            style: textEditStyle,
                                          ),
                                          Text(
                                            "${data['short_des']}",
                                            style: textEditStyle,
                                          ),
                                          Text(
                                            "${data['standard_des']}",
                                            style: textEditStyle,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        : Text(" "),
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
                    "You can advertise",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 80),
                child: _ImageCart1(widget.img),
              ),
            )
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
      ),
    );
  }
}

Widget _ImageCart1(String img) {
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
}

const textEditStyle = TextStyle(
  color: Colors.blue,
);
