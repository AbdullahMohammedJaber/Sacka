import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sacka/Screen/player_game.dart';
import 'package:sacka/sacka_cubit.dart';

import 'HomeLayoutScreen.dart';

class FinalGame extends StatefulWidget {
  @override
  State<FinalGame> createState() => _FinalGameState();
}

class _FinalGameState extends State<FinalGame> {
  AudioCache audioPlayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioCache(
      prefix: 'assets/audio/',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SackaCubit, SackaState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/suc.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 60),
                    height: 180,
                    width: 180,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/logo.jpeg',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "مبروووك فريق ",
                      style: TextStyle(
                        fontFamily: "ReadexPro",
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[350],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SackaCubit.totlaMy >= 152
                              ? Text(
                                  "لنا",
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 20,
                                    color: Colors.green,
                                  ),
                                )
                              : Text(
                                  "لهم",
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 20,
                                    color: Colors.green,
                                  ),
                                ),
                          Spacer(),
                          SackaCubit.totlaMy >= 152
                              ? Text(
                                  "${SackaCubit.totlaMy}",
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  "${SackaCubit.totlaYour}",
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Text(
                      "حظاً أوفر ل ",
                      style: TextStyle(
                        fontFamily: "ReadexPro",
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[350],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SackaCubit.totlaMy < 152
                              ? Text(
                                  "لنا",
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                )
                              : Text(
                                  "لهم",
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                          Spacer(),
                          SackaCubit.totlaMy < 152
                              ? Text(
                                  "${SackaCubit.totlaMy}",
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  "${SackaCubit.totlaYour}",
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[400],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.red,
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => HomeLayoutScreen(),
                                ),
                                (route) => false);
                            SackaCubit.get(context).FinalMy.clear();
                            SackaCubit.get(context).Finalyour.clear();
                            SackaCubit.totlaMy = 0;
                            SackaCubit.totlaYour = 0;
                            audioPlayer.clear('sot.mp3');
                            audioPlayer.clearCache();
                          },
                          child: Text(
                            "الرجوع للرئيسية",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ReadexPro",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.green,
                          onPressed: () {
                            SackaCubit.get(context).FinalMy.clear();
                            SackaCubit.get(context).Finalyour.clear();
                            SackaCubit.totlaMy = 0;
                            SackaCubit.totlaYour = 0;
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PlayerGame(),
                                ),
                                (route) => false);
                            audioPlayer.clear('sot.mp3');
                            audioPlayer.clearCache();
                          },
                          child: Text(
                            "إعادة صكة",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ReadexPro",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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
