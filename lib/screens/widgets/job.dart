import 'package:flutter/material.dart';

class Job extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Job Image',
      child: CircleAvatar(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.white,
          radius: 70.0,
          child: ClipOval(
            child: Image.asset(
              "assets/job.png",
              fit: BoxFit.cover,
              width: 120.0,
              height: 120.0,
            ),
          )),
    );
  }
}
