import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:io';
import 'dart:convert';

class Connecting extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Connect to Tractor', 
              style: TextStyle(
              fontSize: 24.0,
              ),
            ),
            backgroundColor: Color(0xFF42BE63),
            centerTitle: true,
             ),
            body: Center(
              child: UpdateText()
              )
            )
          );
  }
}

class UpdateText extends StatefulWidget {

  UpdateTextState createState() => UpdateTextState();

}

class UpdateTextState extends State {

  String textHolder = 'Disconnect';


  final channel = IOWebSocketChannel.connect("ws://203.150.107.176:17711");

  web_socket() async {
    var data = "connectFromApp";
    var codec = new Utf8Codec();
    List<int> dataToSend = codec.encode(data);
    var addressesListenFrom = InternetAddress.anyIPv4;
    int portListenOn = 17711;
    RawDatagramSocket.bind(addressesListenFrom, portListenOn).then((
      RawDatagramSocket updSocket) {
        updSocket.forEach((RawSocketEvent event) {
          if(event == RawSocketEvent.read){
            Datagram dg = updSocket.receive();
            dg.data.forEach((x) => print(x.toString()));
            if(dg.data[0] == 49){
              setState(() {
               textHolder = 'Connected'; 
              });
            }else{
              setState(() {
               textHolder = 'Disconnected'; 
              });
            }
          }
        });
        updSocket.send(dataToSend, new InternetAddress('203.150.107.176'), 17711);
        print('Did send data on the stream');
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Status :',
                  style: TextStyle(fontSize: 32.0, color: Colors.green[900]),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '$textHolder',
                  style: TextStyle(fontSize: 32.0, color: Colors.red[900]),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 60, 40, 10),
              child: SizedBox(
                width: 300,
                height: 70,
                child: RaisedButton(
                  onPressed: web_socket,
                  child: Text(
                    'Connect',
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
                    side: BorderSide(color: Colors.green[900], width: 3)
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}