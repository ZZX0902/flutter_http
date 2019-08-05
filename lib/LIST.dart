import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';
import 'dart:convert';

class LIST extends StatefulWidget {
  @override
  _LISTState createState() => _LISTState();
}

var _ipAddress = 'Unknown';

class _LISTState extends State<LIST> {
  @override

  _getIPAddress() async {
    var data;
//    var url = 'https://httpbin.org/ip';
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var httpClient = new HttpClient();

    var result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var data01 = await response.transform(utf8.decoder).join();
        data = json.decode(data01);
//        result = data['origin'];

//        result = "${data.length}";
        result = data;
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.

    setState(() {
      _ipAddress = result[1]['body'];
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('httplist'),
        ),
        body: Center(
         child: Column(
           children: <Widget>[
             Text(_ipAddress),
             RaisedButton(
               onPressed: _getIPAddress,
               child: new Text('Get IP address'),
             ),
           ],
         ),
        ),
      ),
    );
  }
}
