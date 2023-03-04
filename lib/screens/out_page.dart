import 'package:flutter/material.dart';

class OutPage extends StatefulWidget {
  const OutPage({Key? key}) : super(key: key);

  @override
  State<OutPage> createState() => _OutPageState();
}

class _OutPageState extends State<OutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Out"),
      ),
    );
  }
}
