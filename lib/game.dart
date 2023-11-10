import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rsp_game/custWid/cardboard.dart';

class MyGame extends StatefulWidget {
  @override
  State<MyGame> createState() => _MyGameState();

  String rightImage = 'eldata/PaperR.png';
  String leftImage = 'eldata/PaperL.png';
  String rWL = '';
  String lWL = '';
  int rScore = 0;
  int lScore = 0;
}

class _MyGameState extends State<MyGame> {
  play() {
    setState(() {
      Random random = new Random();
      int rIndex = random.nextInt(3);
      int lIndex = random.nextInt(3);

      if (rIndex == 0) {
        if (lIndex == 0) {
          widget.rightImage = 'eldata/rockR.png';
          widget.leftImage = 'eldata/rockL.png';
          widget.rWL = "DRAW!";
          widget.lWL = "DRAW!";
        } else if (lIndex == 1) {
          widget.rightImage = 'eldata/rockR.png';
          widget.leftImage = 'eldata/PaperL.png';
          widget.rWL = "LOSER!";
          widget.lWL = "WINNER!";
          widget.lScore++;
        } else {
          widget.rightImage = 'eldata/rockR.png';
          widget.leftImage = 'eldata/SciL.png';
          widget.rWL = "WINNER!";
          widget.lWL = "LOSER!";
          widget.rScore++;
        }
      } else if (rIndex == 1) {
        if (lIndex == 0) {
          widget.rightImage = 'eldata/PaperR.png';
          widget.leftImage = 'eldata/rockL.png';
          widget.rWL = "WINNER!";
          widget.lWL = "LOSER!";
          widget.rScore++;
        } else if (lIndex == 1) {
          widget.rightImage = 'eldata/PaperR.png';
          widget.leftImage = 'eldata/PaperL.png';
          widget.rWL = "DRAW!";
          widget.lWL = "DRAW!";
        } else {
          widget.rightImage = 'eldata/PaperR.png';
          widget.leftImage = 'eldata/SciL.png';
          widget.rWL = "LOSER!";
          widget.lWL = "WINNER!";
          widget.lScore++;
        }
      } else {
        if (lIndex == 0) {
          widget.rightImage = 'eldata/SciR.png';
          widget.leftImage = 'eldata/rockL.png';
          widget.rWL = "LOSER!";
          widget.lWL = "WINNER!";
          widget.lScore++;
        } else if (lIndex == 1) {
          widget.rightImage = 'eldata/SciR.png';
          widget.leftImage = 'eldata/PaperL.png';
          widget.rWL = "WINNER!";
          widget.lWL = "LOSER!";
          widget.rScore++;
        } else {
          widget.rightImage = 'eldata/SciR.png';
          widget.leftImage = 'eldata/SciL.png';
          widget.rWL = "DRAW!";
          widget.lWL = "DRAW!";
        }
      }
    });
  }

  reset() {
    setState(() {
      widget.rightImage = 'eldata/PaperR.png';
      widget.leftImage = 'eldata/PaperL.png';
      widget.rWL = '';
      widget.lWL = '';
      widget.rScore = 0;
      widget.lScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD61C4E),
        title: Text("Rock Paper Scissors"),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffffea00),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              cardBox(
                  WLtext: widget.rWL,
                  image: widget.rightImage,
                  score: widget.rScore.toString()),
              cardBox(
                  WLtext: widget.lWL,
                  image: widget.leftImage,
                  score: widget.lScore.toString())
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 8),
            child: InkWell(
              onTap: play,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffD61C4E)),
                child: Text("Play",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          ),
          InkWell(
            onTap: reset,
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width * 0.5,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffD61C4E)),
              child: Text(
                "Reset",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
