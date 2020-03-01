import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agrotrac_control/pages/connectings.dart';
import 'package:agrotrac_control/pages/automatic.dart';
import 'package:agrotrac_control/pages/manual.dart';


class Homepage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agrotrac Controller v.0.2', style: TextStyle(
          fontSize: 24.0,
        ),),
        backgroundColor: Color(0xFF42BE63),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Connect to Tractor Button
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: SizedBox(
                width: 300,
                height: 100,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Connecting() )
                     );
                  },
                  child: Text(
                    'Connect to Tractor',
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
            //Automatic Control Button
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: SizedBox(
                width: 300,
                height: 100,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Automatic() )
                    );
                  },
                  child: Text(
                    'Automatic Control',
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
            //Manual control Button
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: SizedBox(
                width: 300,
                height: 100,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Manual() )
                    );
                  },
                  child: Text(
                    'Manual Control',
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
            //Setting
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: SizedBox(
                width: 300,
                height: 100,
                child: RaisedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Map() )
                    // );
                  },
                  child: Text(
                    'Setting',
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
