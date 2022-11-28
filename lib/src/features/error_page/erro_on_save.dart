import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../common/colors/colors.dart';

class ErrorOnSavePage extends StatelessWidget {
  const ErrorOnSavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Text(
                    "Houve uma falha ao salvar sua movimentação\n",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(color: CustomColors.primayRed, fontSize: 30),
                  ),
                ),
              ),
            ),
            Lottie.asset('lib/assets/loading_animation/loading.json'),
            FlatButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.white, width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                'Ok, entendi',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              color: CustomColors.primayRed,
            ),
          ],
        ),
      ),
    );
  }
}
