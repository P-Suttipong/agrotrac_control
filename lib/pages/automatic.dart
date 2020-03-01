import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Automatic extends StatelessWidget {
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
                  labelText: 'Point 1: ',
                ),
                // onSubmitted: (pos1) {
                //   print("SUBMIT");
                //   List<String> splitPos1 = pos1.split(",");
                //   setArea(0, double.parse(splitPos1[0]),
                //       double.parse(splitPos1[1]));
                // },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Point 2: ',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Point 3: ',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Point 4: ',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: SizedBox(
                width: 300,
                height: 70,
                child: RaisedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Automatic() )
                    // );
                  },
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
                    side: BorderSide(color: Colors.green[900], width: 3)
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: SizedBox(
                width: 300,
                height: 70,
                child: RaisedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Automatic() )
                    // );
                  },
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
                    side: BorderSide(color: Colors.green[900], width: 3)
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: SizedBox(
                width: 300,
                height: 70,
                child: RaisedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Automatic() )
                    // );
                  },
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
                    side: BorderSide(color: Colors.red[900], width: 3)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
      