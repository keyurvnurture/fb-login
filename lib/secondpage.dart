import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:fb_login/model/secondmodel.dart';

import 'package:fb_login/video_play.dart';

class Secondpage extends StatefulWidget {
  @override
  _SecondpageState createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  List showdata = new List();
  static int page = 1;
  int totalPage = 0;
  String Api_Pagination =
      'https://restapi-stag.socialpilot.co/posts/delivered?page=${page}&limit=10';
  ScrollController _scrollController = new ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    this._getMoreData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<Secondmodel> _getMoreData() async {
    if (page == totalPage) {
      setState(() {
        Api_Pagination = null;
      });
    }
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      final response = await http.get(
        'https://restapi-stag.socialpilot.co/posts/delivered?page=${page}&limit=10',
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb21wYW55SWQiOjI2MzA2LCJyb2xlIjoiTyIsImNsaWVudElkIjoiZWR1d2s5OXliMW91ODV3cTJsNTMzcHV2aHczcTU1M2tqeWczOHEyaiIsImVudGVycHJpc2VJZCI6MSwib3duZXJJZCI6MjYzMDYsImlkIjoiMDExYjZiZjIzMzk0MzgxMyIsImlhdCI6MTU3OTI1MjU4NSwiZXhwIjoxNTg0NDM2NTg1fQ.n9UT2_MjqU_IEzD8uUxMov3SjNLCUGUbOxgF2Db6rEE"
        },
      );
      List tempList = new List();
      final responseJson = json.decode(response.body);
      for (int i = 0; i < responseJson['response']['list'].length; i++) {
        tempList.add(responseJson['response']['list'][i]);
      }
      setState(() {
        isLoading = false;
        page = responseJson['response']['currentPage'] + 1;
        totalPage = responseJson['response']['totalPages'] + 1;
        showdata.addAll(tempList);
      });
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: new AppBar(
                backgroundColor: Colors.blue,
                title: new Text(
                  "Delivered",
                  style: TextStyle(color: Colors.white),
                ),
                actions: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.query_builder),
                    tooltip: 'show more',
                    onPressed: () {},
                  ),
                  new IconButton(
                    onPressed: () {},
                    icon: new Icon(Icons.more_horiz),
                    tooltip: 'show more',
                  ),
                ],
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                )),
            body: ListView.builder(
              itemCount: showdata.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == showdata.length) {
                  return _buildProgressIndicator();
                } else {
                  return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: new EdgeInsets.all(6.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[

                            showdata[index]['postVideo'] == ""
                                ? //Text("")
                                Image.network(showdata[index]
                                ['profilePicture'] == null
                                    ? Text("")
                                    : showdata[index]['profilePicture'],fit: BoxFit.fill,height: 80,width: 80,)
                                : GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => VideoApp(
                                                  showdata[index]['postVideo'])));
                                    },
                                    child: Image.asset(
                                      "image/videoimage.png",
                                      fit: BoxFit.fill,
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        showdata[index]['postDesc'] == null
                                            ? Text("No Records Found")
                                            : showdata[index]['postDesc'],
                                        style: TextStyle(fontSize: 12.0)),
                                    Text(
                                        showdata[index]['accountUrl'] == null
                                            ? Text("No Records Found")
                                            : showdata[index]['accountUrl'],
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.blue[900])),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            CircleAvatar(
                                                radius: 17,
                                                backgroundImage: NetworkImage(
                                                    showdata[index]['postImage']
                                                        .length ==
                                                        0
                                                        ? ""
                                                        : showdata[index]
                                                    ['postImage'][0])),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                        3,
                                                    child: Text(
                                                      showdata[index]
                                                      ['accountUsername'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          fontSize: 12.0),
                                                      softWrap: true,
                                                      maxLines: 1,
                                                      textAlign: TextAlign.start,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Text(showdata[index]['createdOn'],
                                                      style: TextStyle(
                                                          fontSize: 12.0)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.reply),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ));
                }
              },
              controller: _scrollController,
            )));
  }
}
