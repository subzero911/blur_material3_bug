import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/big_plus_bubble.png'),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                Ink(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
                    borderRadius: BorderRadius.circular(24.0),
                    color: Colors.orange,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24.0),
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                        child: Column(
                          children: [
                            Text(
                              'This is a blurred widget',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 32),
                            Text(
                              'Some description',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // add some random stuff to make the screen scrollable
                const SizedBox(
                  height: 400,
                ),
                Container(
                  color: Colors.green,
                  height: 300,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
