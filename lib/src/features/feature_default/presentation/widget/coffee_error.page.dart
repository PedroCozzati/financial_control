import 'package:flutter/material.dart';

class CoffeeErrorWidget extends StatelessWidget {
  const CoffeeErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.5,
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage("lib/assets/coffeeE.jpg"),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Error when preparing your coffee",
          style: TextStyle(
            color: Colors.brown.shade600,
            fontSize: 20
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Please wait",
          style: TextStyle(
              color: Colors.brown.shade600,
              fontSize: 15
          ),
        )
      ],
    );
  }
}
