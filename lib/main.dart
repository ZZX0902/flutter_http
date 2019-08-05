import 'package:flutter/material.dart';
import 'dart:io';
import 'ListFinal.dart';
import 'basic.dart';
import 'dart:ui';
import 'dart:convert';
import 'LIST.dart';
void main() => runApp(basic());
var size = MediaQueryData.fromWindow(window).size;
var widthq = size.width;
var heightq = size.height;
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();


}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  var _ipAddress = 'Unknown';

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
        result = data[3]['body'];


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
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);
return MaterialApp(
    home: Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text(_ipAddress),
            spacer,
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text('Get IP address'),
            ),
          ],
        ),
      ),
    )
    );
  }
  }


