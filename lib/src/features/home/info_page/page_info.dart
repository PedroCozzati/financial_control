import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageInfo extends StatefulWidget {
  const PageInfo({Key? key}) : super(key: key);
  @override
  State<PageInfo> createState() => _PageInfoState();
}

class _PageInfoState extends State<PageInfo> {
  // Initializing a Controller fore PageView
  final PageController _pageViewController =
      PageController(initialPage: 0); // set the initial page you want to show
  int _activePage = 0; // will hold current active page index value
  //Create a List Holding all the Pages

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Color(0xFF60667E),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Color(0x33000000),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Aplicativo desenvolvido com Flutter.',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      '2022',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ]),
            ),
          ),
        ),
      )
    ]);
  }
}
