import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';
import 'dart:convert';

class ListFinal extends StatefulWidget {
  @override
  _ListFinalState createState() => _ListFinalState();
}

class _ListFinalState extends State<ListFinal> {
  @override
  List datalist = List();


  _getList() async {
    List result;
//    var url = 'https://httpbin.org/ip';
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      print("_getlist");
      if (response.statusCode == HttpStatus.OK) {
        var data01 = await response.transform(utf8.decoder).join();
        result = json.decode(data01);

      } else {
        print("failed");
      }
    } catch (exception) {
      print(exception.toString());
    }

    return result;
  }

  @override
  void initState() {
    super.initState();
    Future future = _getList();
    future.then((value){
      setState(() {
        datalist = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQueryData.fromWindow(window).size;
    var widthq = size.width;
    var heightq = size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('httplist'),
        ),
        body: Center(
          child: Container(
              width: widthq,
              height: heightq,
              child: ListView.separated(itemBuilder: (context,index){
                return Column(
                  children: <Widget>[
                    Container(
                      width: widthq,
                      color: Colors.redAccent,
                      child: Text(datalist[index]["body"]),
                    ),
                    Container(
                      width: widthq,
//                      height: 100.0,
                      color: Colors.lightBlue,
                      child: Text(datalist[index]["title"]),
                    )

                  ],
                );
              }, separatorBuilder: (context,index)=>Divider(), itemCount: datalist.length),

        ),
        ),
      ),
    );
  }
}
