import 'package:flutter/material.dart';

import '../../common/colors/colors.dart';

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
      color: CustomColors.primaryBlue,
      child: Column(
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Boa noite!',style: TextStyle(color: CustomColors.primaryWhite,fontSize: 24),textAlign: TextAlign.end,),
                IconButton(
                  icon: Icon(Icons.info,color: CustomColors.thirdBlue,size: 40,),
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
