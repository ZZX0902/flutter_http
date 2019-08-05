import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'DioRequest.dart';
class details extends StatefulWidget {
  @override


  State<StatefulWidget> createState() {
    // TODO: implement createState
    return detailsState();
  }
}

class detailsState extends State<details> {

  String edition;
  bool MSelectNetData ;

  void initState() {
    // TODO: implement initState
    super.initState();
    edition="1.0.0";
    MSelectNetData=false;

  }
void downloadData()async{
  final params = Map<String, String>();
  params["name"] = "zhq";
  params["password"] = 12334.toString();
  HttpManager().post("https://httpbin.org/ip", params,(response){
    print(response);
  }, (error){
    print("----"+error);
  });
}

  void nullhead() {}

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final widthq = size.width;
    final hrightq = size.height;

    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
            },
            color: Colors.black,
          ),
          title: Text(
            '设置',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.5,
          brightness: Brightness.dark,
          backgroundColor: Colors.white,
        ),
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Color.fromARGB(255, 245, 245, 245),
                    height: 10.0,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: widthq / 2,
                              child: Container(
                                child: Text(
                                  '消息提示音',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                                width: 29.0,
                                height: 29.0,
                                margin: const EdgeInsets.all(16.0),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              width: widthq / 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: CupertinoSwitch(
                                      activeColor:Colors.deepOrange,

                                      value: MSelectNetData,
                                      onChanged: (bool value) {
                                        MSelectNetData = value;
                                        if (value) {

                                        } else {

                                        }

                                        setState(() {
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    child: IconButton(
                                        icon: Icon(Icons.arrow_forward_ios),
                                        onPressed: nullhead),
                                    width: 9.0,
                                    margin: EdgeInsets.fromLTRB(0, 0, 42.0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 245, 245, 245),
                    height: 10.0,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: widthq / 3,
                            color: Colors.white,
                            child: Container(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                '清空聊天记录',
                                style: TextStyle(fontSize: 15.0),
                              ),
                              width: 35.0,
                              height: 35.0,
                              margin: EdgeInsets.only(left: 16.0),
                            )),
                        GestureDetector(
//                    onTap: editname,
                          child: Container(
                              width: widthq / 1.5,
                              color: Colors.white,
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: IconButton(
                                        icon: Icon(Icons.arrow_forward_ios),
                                        onPressed: nullhead),
                                    width: 9.0,
                                    margin: EdgeInsets.fromLTRB(0, 0, 42.0, 0),
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 245, 245, 245),
                    height: 10.0,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: widthq / 3,
                            color: Colors.white,
                            child: Container(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                '获取新版本',
                                style: TextStyle(fontSize: 15.0),
                              ),
                              width: 35.0,
                              height: 35.0,
                              margin: EdgeInsets.only(left: 16.0),
                            )),
                        Container(
                            width: widthq / 1.5,
                            color: Colors.white,
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
//                        ontap:null,
                                  child: Container(
                                    alignment: Alignment(1, 0),
                                    child: Text(
                                      '当前版本' + edition,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Color.fromARGB(255, 168, 168, 168)),
                                    ),
                                    height: 30.0,
                                    margin: EdgeInsets.only(right: 14.0),
                                  ),
                                ),
                                GestureDetector(
                                  child: Container(
                                    child: IconButton(
                                        icon: Icon(Icons.arrow_forward_ios),
                                        onPressed: nullhead),
                                    width: 9.0,
                                    margin: EdgeInsets.fromLTRB(0, 0, 42.0, 0),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Divider(
                      height: 1.0,
                      indent: 70.0,
                      color: Color.fromARGB(255, 245, 245, 245)),
                  Container(
                    height: 50.0,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: widthq / 3,
                            color: Colors.white,
                            child: Container(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                '关于打call',
                                style: TextStyle(fontSize: 15.0),
                              ),
                              width: 35.0,
                              height: 35.0,
                              margin: EdgeInsets.only(left: 16.0),
                            )),
                        GestureDetector(
//                    onTap: ,
                          child: Container(
                              width: widthq / 1.5,
                              color: Colors.white,
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: IconButton(
                                        icon: Icon(Icons.arrow_forward_ios),
                                        onPressed: nullhead),
                                    width: 9.0,
                                    margin: EdgeInsets.fromLTRB(0, 0, 42.0, 0),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                      height: 1.0,
                      indent: 70.0,
                      color: Color.fromARGB(255, 245, 245, 245)),
                  Container(
                    height: 50.0,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: widthq / 3,
                            color: Colors.white,
                            child: Container(
                              alignment: Alignment(-1, 0),
                              child: Text(
                                '帮助与反馈',
                                style: TextStyle(fontSize: 15.0),
                              ),
                              width: 35.0,
                              height: 35.0,
                              margin: EdgeInsets.only(left: 16.0),
                            )),
                        GestureDetector(
//                    onTap: ,
                          child: Container(
                              width: widthq / 1.5,
                              color: Colors.white,
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: IconButton(
                                        icon: Icon(Icons.arrow_forward_ios),
                                        onPressed: nullhead),
                                    width: 9.0,
                                    margin: EdgeInsets.fromLTRB(0, 0, 42.0, 0),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: nullhead,
                child:  Container(
                  height: 50.0,
                  width: widthq,
                  color: Colors.black,
                  alignment:Alignment.center,
                  child:Text('退出',style: TextStyle(color: Colors.white,fontSize: 18.0,letterSpacing: 5.0),),
                )
            )


          ],
        )



    );
  }
}
