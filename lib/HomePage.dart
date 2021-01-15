import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:housing/noticeSwiperPage.dart';
import 'package:housing/screens/BillingPage.dart';
import 'package:housing/screens/advertisementPage.dart';
import 'package:housing/screens/contactPage.dart';
import 'package:housing/screens/enquiryPage.dart';
import 'package:housing/screens/profilePage.dart';
import 'package:housing/screens/rulePage.dart';
import 'package:housing/screens/votingPage.dart';

class HomePage extends StatefulWidget {
  String token;

  HomePage({Key key, @required this.token}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home Page"),
        actions: [
          Icon(Icons.more_vert),
        ],
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
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  color: Colors.blue,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.deepPurpleAccent, width: 4),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    Text(
                      "MR.JOY",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.0),
                  side: BorderSide(color: Colors.grey[100]),
                ),
                margin: EdgeInsets.only(top: 165, left: 20, right: 20),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height / 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                token: widget.token,
                              ),
                            ),
                          );
                        },
                        child: _cardFirst("assets/images/a.jpeg", "Home"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                token: widget.token,
                              ),
                            ),
                          );
                        },
                        child: _cardFirst("assets/images/b.png", "Profile"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BillingPage(),
                            ),
                          );
                        },
                        child: _cardFirst("assets/images/c.jpeg", "Billing"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17.0),
              side: BorderSide(color: Colors.grey[100]),
            ),
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height / 3.2,
              child: Column(
                children: [
                  Text(
                    "Function",
                    style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RulePage(
                                token: widget.token,
                              ),
                            ),
                          );
                        },
                        child: _card("assets/images/b.png", "Rules"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VotingPage(),
                            ),
                          );
                        },
                        child: _card("assets/images/b.png", "Voting"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EnquiryPage(),
                            ),
                          );
                        },
                        child: _card("assets/images/d.png", "Enquiry"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactPage(
                                token: widget.token,
                              ),
                            ),
                          );
                        },
                        child: _cardView("assets/images/b.png", "Contact"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdvertisementPage(),
                            ),
                          );
                        },
                        child:
                            _cardView("assets/images/b.png", "Advertisement"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoticeSwiperPage(),
                ),
              );
            },
            child: Card(
              // color: Colors.grey[100],
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.grey[100]),
              ),
              child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Swiper(
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // color: Colors.deepPurpleAccent,
                        ),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("test"),
                                Text("test"),
                                Text("test"),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // color: Colors.red,
                              ),
                              width: 130,
                              height: 100,
                              child: Image(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1468072114808-903e572b8ead?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1932&q=80"),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 18,
                    autoplay: true,
                    pagination: SwiperPagination(
                        builder: new DotSwiperPaginationBuilder(
                      color: Colors.grey,
                      activeColor: Colors.deepPurpleAccent,
                    )),
                  )),
            ),
          ),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(top: 70),
            child: Text(""),
          ),
        ],
      )),
    );
  }

  Widget _cardFirst(String img, String name) {
    return Column(
      children: [
        Container(
          width: 50,
          child: Image(
            image: AssetImage(img),
          ),
        ),
        Text(name),
      ],
    );
  }

  Widget _card(String img, String name) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey[100]),
      ),
      child: Container(
        // width: MediaQuery.of(context).size.width / 5,
        // height: MediaQuery.of(context).size.height / 9,
        width: 80,
        height: 90,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              child: Image(
                image: AssetImage(img),
              ),
            ),
            Text(name),
          ],
        ),
      ),
    );
  }

  Widget _cardView(String img, String name) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey[100]),
      ),
      child: Container(
        // width: MediaQuery.of(context).size.width / 5,
        // height: MediaQuery.of(context).size.height / 9,
        width: 140,
        height: 90,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              child: Image(
                image: AssetImage(img),
              ),
            ),
            Text(name),
          ],
        ),
      ),
    );
  }
}
