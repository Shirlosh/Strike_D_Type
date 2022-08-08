import 'package:flutter/material.dart';

import '../../../../flutter_flow/flutter_flow_theme.dart';

class ScoreFlag extends StatelessWidget {
  ScoreFlag(this.score);

  final score;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
        top: screenHeight * 0.025,
        child: SizedBox(
          width: screenWidth  * 0.27,
          height: screenHeight *0.3,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset(
                    "assets/images/GreenFlag.png",
                  ).image,
                  fit: BoxFit.cover),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text('Your Score: $score',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: screenWidth  * 0.02 ,
                        lineHeight: 0.1,
                        color: Colors.orange.shade50,
                      )),
            ),
          ),
        ));
  }
}
