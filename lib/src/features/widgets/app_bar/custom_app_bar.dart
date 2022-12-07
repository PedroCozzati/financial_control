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

String appBarText = "Bom dia!";
void getTextAccordingToDate(){
  if(int.parse(DateTime.now().hour.toString())>=int.parse(DateTime.utc(0,0,0,12).hour.toString())){
    appBarText = "Boa tarde!";
  }
  if(int.parse(DateTime.now().hour.toString())>=int.parse(DateTime.utc(0,0,0,18).hour.toString())){
    appBarText = "Boa Noite!";
  };
}

class _CustomAppBarState extends State {
  @override
  Widget build(BuildContext context) {
    getTextAccordingToDate();
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black54,

          borderRadius: BorderRadius.only(
            bottomRight: const Radius.circular(30.0),
            bottomLeft: const Radius.circular(30.0),
          ),// BorderRadius

        ),// BoxDe
        child: Container(
          // backgroundColor: CustomColors.primaryBlue,
          // toolbarHeight: 200,
          // leading: Icon(
          //   Icons.android
          // ),
          // title: Text('Boa noite!'),
          height: 120,
          margin: const EdgeInsetsDirectional.only(start: 0, end: 0, top: 0),
          decoration: BoxDecoration(
            color: Color(0xffe0e7dd),
            borderRadius: BorderRadius.only(
              bottomRight: const Radius.circular(30.0),
              bottomLeft: const Radius.circular(30.0),
            ),// BorderRadius

          ),// BoxDecoration
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(13.0),
          //     bottomRight: Radius.circular(13.0),
          //   ),
          //   color: Colors.white,
          //   border: Border(
          //       bottom: BorderSide(
          //     color: CustomColors.thirdRed,
          //     width: 3
          //   ))
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        appBarText ,
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
                            Icons.question_mark,
                            color: Color(0xffffffff),
                            size: 25,
                          ),
                          onPressed: () =>Navigator.pushNamed(context, 'faq'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 30),
              //   child: Text(
              //     "Deseja monitorar suas finanças ?" ,
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 18,
              //     ),
              //     textAlign: TextAlign.end,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
