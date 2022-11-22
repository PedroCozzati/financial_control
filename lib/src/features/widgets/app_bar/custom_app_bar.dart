import 'package:flutter/material.dart';

import '../../../common/colors/colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(130.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // backgroundColor: CustomColors.primaryBlue,
        // toolbarHeight: 200,
        // leading: Icon(
        //   Icons.android
        // ),
        // title: Text('Boa noite!'),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(
            color: CustomColors.thirdRed,
            width: 3
          ))
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Boa noite!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff5e7848),
                      borderRadius:BorderRadius.circular(300)
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.question_answer,
                          color: Color(0xffffffff),
                          size: 25,
                        ),
                        onPressed: () {},
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
