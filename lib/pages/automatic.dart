import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:io';
import 'dart:convert';

class Automatic extends StatelessWidget {
  var data = "";
  var width = "";
  var hieght = "";

  final channel = IOWebSocketChannel.connect("ws://203.150.107.176:17711");

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
      updSocket.send(dataToSend, new InternetAddress('203.150.107.176'), 17711);
      print('Did send data on the stream');
    });
  }

  settingWorkingArea() {
    data = "area-" + width + "-" + hieght;
    web_socket();
  }

  startWorking() {
    data = "start";
    web_socket();
  }

  stopWorking() {
    data = "stop";
    web_socket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Automatic Control',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        backgroundColor: Color(0xFF42BE63),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Width(cm)  : ',
                ),
                onChanged: (w) {
                  print(w);
                  width = w;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Hieght(cm) : ',
                ),
                onChanged: (h) {
                  print(h);
                  hieght = h;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: SizedBox(
                width: 300,
                height: 70,
                child: RaisedButton(
                  onPressed: settingWorkingArea,
                  child: Text(
                    'Setting Working Area',
                    style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 24,
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
              padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: SizedBox(
                width: 300,
                height: 70,
                child: RaisedButton(
                  onPressed: startWorking,
                  child: Text(
                    'Start Working',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.green[900],
                  elevation: 8,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.green[900], width: 3)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: SizedBox(
                width: 300,
                height: 70,
                child: RaisedButton(
                  onPressed: stopWorking,
                  child: Text(
                    'Stop Working',
                    style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.red[50],
                  elevation: 8,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.red[900], width: 3)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
