import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class cardBox extends StatelessWidget {
  final String WLtext;
  final String image;
  final String score;

  cardBox({required this.WLtext, required this.image, required this.score});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Text(
              WLtext,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: (WLtext) == "WINNER!"
                      ? Colors.green.shade400
                      : (WLtext) == "LOSER!"
                          ? Colors.red
                          : Colors.black,
                  fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              image,
              height: 100,
            ),
            SizedBox(height: 50),
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xffF77E21),
              child: Text(
                score,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
