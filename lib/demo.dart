// ignore_for_file: unused_field, unused_element

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final bool _fav = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: _incrementCounter,
      //       tooltip: 'Increment',
      //       child: const Icon(Icons.add),
      //     ),
      //     FloatingActionButton(
      //       onPressed: _decrementCounter,
      //       tooltip: 'Decrement',
      //       child: const Icon(Icons.remove),
      //     ),
      //   ],
      // ),
      // bottomSheet: Container(
      body: Container(
        alignment: Alignment.bottomRight,
        //  transform: Matrix4.rotationZ(0.1),
        height: 400,
        width: double.infinity,
        padding: const EdgeInsets.all(105),
        margin: const EdgeInsets.all(20),

        //constraints: const BoxConstraints.expand(height: 400.0),

        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 33)
            ],
            border: Border.all(color: Colors.black, width: 2),
            gradient:
                const LinearGradient(colors: [Colors.red, Colors.lightBlue]),
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(40)),
        // child: const Text(
        //   'Text',
        //   style: TextStyle(
        //       fontSize: 35,
        //       color: Colors.purple,
        //       fontWeight: FontWeight.w700,
        //       fontStyle: FontStyle.italic,
        //       letterSpacing: 8,
        //       wordSpacing: 20,
        //       backgroundColor: Colors.yellow,
        //       shadows: [
        //         Shadow(
        //             color: Colors.blueAccent,
        //             offset: Offset(2, 1),
        //             blurRadius: 10)
        //       ]),
        // ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 50,
              icon: const Icon(Icons.favorite_outline),
              isSelected: _fav,
              selectedIcon: const Icon(Icons.favorite),
              hoverColor: Colors.red,
              // splashColor: Colors.black,
              focusColor: Colors.red,
            )

            // Icon(Icons.favorite),
            // Text('favorite'),
            // Icon(Icons.favorite_outline),
            // Text('favorite'),

            // Text(
            //   'Text1',
            //   style: TextStyle(
            //       fontSize: 35,
            //       color: Colors.purple,
            //       fontWeight: FontWeight.w700,
            //       fontStyle: FontStyle.italic,
            //       letterSpacing: 8,
            //       wordSpacing: 20,
            //       backgroundColor: Colors.yellow,
            //       shadows: [
            //         Shadow(
            //             color: Colors.blueAccent,
            //             offset: Offset(2, 1),
            //             blurRadius: 10)
            //       ]),
            //   textAlign: TextAlign.left,
            // ),
            // Text(
            //   'Text2',
            //   style: TextStyle(
            //       fontSize: 35,
            //       color: Colors.purple,
            //       fontWeight: FontWeight.w700,
            //       fontStyle: FontStyle.italic,
            //       letterSpacing: 8,
            //       wordSpacing: 20,
            //       backgroundColor: Colors.yellow,
            //       shadows: [
            //         Shadow(
            //             color: Colors.blueAccent,
            //             offset: Offset(2, 1),
            //             blurRadius: 10)
            //       ]),
            // ),
          ],
        ),

        //   foregroundDecoration: BoxDecoration(color: Colors.blue),
      ),
    );
  }
}
