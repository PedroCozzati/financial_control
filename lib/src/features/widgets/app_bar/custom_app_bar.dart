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
    return Container(
      // backgroundColor: CustomColors.primaryBlue,
      // toolbarHeight: 200,
      // leading: Icon(
      //   Icons.android
      // ),
      // title: Text('Boa noite!'),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(
          color: CustomColors.thirdRed,
          width: 3
        ))
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Boa noite!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.info,
                    color: CustomColors.primayRed,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
