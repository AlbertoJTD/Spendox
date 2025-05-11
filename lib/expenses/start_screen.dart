import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget{
  const StartScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Hey there')
        ],
      ),
    );
  }
}