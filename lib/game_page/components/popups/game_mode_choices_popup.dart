import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../home_page/home_page_widget.dart';
import '../../../../lobby/lobby_widget.dart';
import '../../../application/modes/PvPMode.dart';
import '../../../application/modes/TimerMode.dart';

Future<void> gameModePopup(context) async {
  showDialog<bool>(
    context: context,
    /* builder: (alertDialogContext) {
      return _GameModePopup();
    },*/
  );
}

Future<void> gameModeDialog(context) async {
  showDialog(
      context: context,
      builder: (alertDialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(1),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB877FF), Color(0xFFFBAB66)],
                stops: [0, 1],
                begin: AlignmentDirectional(0.64, 1),
                end: AlignmentDirectional(-0.64, -1),
              ),
            ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Single Player
                  InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LobbyWidget(TimerMode(), true),
                          ),
                        );
                      },
                      splashColor: Colors.deepOrange.withOpacity(0.5),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child:  Ink(
                            decoration: BoxDecoration(
                              /*border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(12),*/
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/SinglePlayer.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                        ),
                      ),
                    ),

                  //Two Players
                   InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LobbyWidget(PvPMode(), true) //two players lobby LobbyWidget(),
                              ),
                        );
                      },
                      splashColor: Colors.deepOrange.withOpacity(0.5),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Ink(
                            decoration: BoxDecoration(
                              /*border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(12),*/
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/TwoPlayers.png'),
                                scale: 0.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                    ),
                ]),
          ),
        );
      });
}