import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:agrotrac_control/pages/home.dart';
import 'dart:io';
import 'dart:convert';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'Setting',
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
  var imWidth = "";
  var speed = "";
  var data = "";

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

  setting() async {
    setState(() {
      data = "set-" + speed + "-" + imWidth;
    });
    await web_socket();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(40, 100, 40, 10),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tractor Speed(%): ',
                ),
                onChanged: (s) {
                  print(s);
                  setState(() {
                    speed = s;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Implement Width(cm.): ',
                ),
                onChanged: (w) {
                  print(w);
                  setState(() {
                    imWidth = w;
                  });
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 60, 40, 10),
                  child: SizedBox(
                    width: 280,
                    height: 70,
                    child: RaisedButton(
                      onPressed: setting,
                      child: Text(
                        'Setting',
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
