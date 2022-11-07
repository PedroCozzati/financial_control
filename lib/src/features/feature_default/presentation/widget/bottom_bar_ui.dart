import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomBar extends StatefulWidget {
  final VoidCallback? onTap;

  const BottomBar({Key? key, required this.onTap}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                'Press this button',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade800),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 8,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    color: Colors.brown,
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Center(
                    child: GestureDetector(
                      // enableFeedback: true,
                      // borderRadius: BorderRadius.circular(
                      //   MediaQuery.of(context).size.height / 8,
                      // ),
                      onTap: () {
                        HapticFeedback.lightImpact();
                        widget.onTap!();
                        },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 8,
                        width: MediaQuery.of(context).size.height / 8,
                        child: Center(
                          child: Container(
                              height: MediaQuery.of(context).size.height / 13,
                              width: MediaQuery.of(context).size.height / 13,
                              child: Image(
                                image: AssetImage(
                                  'lib/assets/coffee.png',
                                ),
                              )),
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown.withOpacity(0.5),
                              spreadRadius: 10,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.brown.shade50,
                          border: Border.all(color: Colors.brown, width: 4),
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height / 8,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
