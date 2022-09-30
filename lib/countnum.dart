import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountNum extends StatefulWidget {
  const CountNum({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<CountNum> createState() => _CountNumState();
}

class _CountNumState extends State<CountNum> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 192, 203),
        title: Text(
          "Number Program",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                letterSpacing: .5,
                fontSize: 20),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
