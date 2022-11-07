import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeLoadingWidget extends StatefulWidget {
  CoffeeLoadingWidget();

  @override
  State<CoffeeLoadingWidget> createState() => _CoffeeLoadingWidgetState();
}

class _CoffeeLoadingWidgetState extends State<CoffeeLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: MediaQuery.of(context).size.height / 2.5,
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.brown,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
              strokeWidth: 8,
            ),
          )),
    );
  }
}
