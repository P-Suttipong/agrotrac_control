import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:io';
import 'dart:convert';

class Manual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'Manual Control',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              backgroundColor: Color(0xFF42BE63),
              centerTitle: true,
            ),
            body: Center(child: UpdateText())));
  }
}

class UpdateText extends StatefulWidget {
  UpdateTextState createState() => UpdateTextState();
}

class UpdateTextState extends State {
  String textHolder = 'Disconnect';
  var distance = "";
  var data = "";

  final channel = IOWebSocketChannel.connect("ws://203.150.243.132:17711");

  web_socket() async {
    var codec = new Utf8Codec();
    List<int> dataToSend = codec.encode(data);
    var addressesListenFrom = InternetAddress.anyIPv4;
    int portListenOn = 17711;
    RawDatagramSocket.bind(addressesListenFrom, portListenOn)
        .then((RawDatagramSocket updSocket) {
      updSocket.forEach((RawSocketEvent event) {
        if (event == RawSocketEvent.read) {
          Datagram dg = updSocket.receive();
          dg.data.forEach((x) => print(x.toString()));
        }
      });
      updSocket.send(dataToSend, new InternetAddress('203.150.243.132'), 17711);
      print('Did send data on the stream');
    });
  }

  forward() {
    setState(() {
     data = "forward";
    });
    web_socket();
  }

  backward() {
    setState(() {
     data = "backward";
    });
    web_socket();
  }

  left() {
    setState(() {
     data = "left";
    });
    web_socket();
  }

  right() {
    setState(() {
     data = "right";
    });
    web_socket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.fromLTRB(40, 100, 40, 10),
            //   child: TextField(
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Distance: ',
            //     ),
            //     onSubmitted: (dist) {
            //       print(dist);
            //       setState(() {
            //         distance = dist;
            //       });
            //     },
            //   ),
            // ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 10, 0, 10),
                  child: SizedBox(
                    width: 130,
                    height: 70,
                    child: RaisedButton(
                      onPressed: forward,
                      child: Text(
                        'Forward',
                        style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.green[50],
                      elevation: 8,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.green[900], width: 3)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 40, 10),
                  child: SizedBox(
                    width: 130,
                    height: 70,
                    child: RaisedButton(
                      onPressed: backward,
                      child: Text(
                        'Backward',
                        style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.green[50],
                      elevation: 8,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.green[900], width: 3)),
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(40, 50, 40, 10),
            //   child: TextField(
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Degree: ',
            //     ),
            //   ),
            // ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 10, 0, 10),
                  child: SizedBox(
                    width: 130,
                    height: 70,
                    child: RaisedButton(
                      onPressed: left,
                      child: Text(
                        'Left',
                        style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.green[50],
                      elevation: 8,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.green[900], width: 3)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 40, 10),
                  child: SizedBox(
                    width: 130,
                    height: 70,
                    child: RaisedButton(
                      onPressed: right,
                      child: Text(
                        'Right',
                        style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.green[50],
                      elevation: 8,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.green[900], width: 3)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
