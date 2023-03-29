// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Labs 01"),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.green[200],
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 50.0),
            child: Text(""),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text("List view"),
          SizedBox(
            height: 5.0,
          ),
          Container(
            color: Colors.red,
            padding: EdgeInsets.symmetric(vertical: 40.0),
          ),
          Container(
            color: Colors.yellow,
            padding: EdgeInsets.symmetric(vertical: 40.0),
          ),
          Container(
            color: Colors.green[200],
            padding: EdgeInsets.symmetric(vertical: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  number++;
                });
              },
              color: Colors.yellow,
              icon: Icon(Icons.plus_one)),
          Text("$number"),
          Expanded(
            child: Center(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: const Text("He'd have you all unravel at the"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[200],
                    child: const Text('Heed not the rabble'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[300],
                    child: const Text('Sound of screams but the'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[400],
                    child: const Text('Who scream'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[500],
                    child: const Text('Revolution is coming...'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[600],
                    child: const Text('Revolution, they...'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
