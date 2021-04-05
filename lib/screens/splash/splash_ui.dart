import 'package:flutter/material.dart';

class SplashUI extends StatelessWidget {
  const SplashUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text("Second route"),
      ),
    );
  }
}
