import 'package:flutter/material.dart';

import 'package:life_point_empleado/screens/home/components/widgets/card_presentatio.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: CardPresentation(),
      ),
    );
  }
}
