import 'package:flutter/material.dart';
import 'package:albahar2/views/leaveRequest.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Center(child: LeaveRequestForm()),
    );
  }
}
