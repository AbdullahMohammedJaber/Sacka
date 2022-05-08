import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sacka/Screen/player_game.dart';
import 'package:sacka/Screen/player_game2.dart';
import 'package:sacka/sacka_cubit.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Quraa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SackaCubit, SackaState>(
      listener: (context, state) {},
      builder: (context, state) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            toolbarHeight: 180,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 110,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'assets/images/logo.jpeg',
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios_new),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "نتيجة القرعة",
                      style: TextStyle(
                        fontFamily: "ReadexPro",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                    ),
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        SackaCubit.get(context).names[0],
                        style: TextStyle(
                          fontFamily: "ReadexPro",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      start: 15,
                    ),
                    alignment: Alignment.topLeft,
                    child: Text(
                      SackaCubit.get(context).names[1],
                      style: TextStyle(
                        fontFamily: "ReadexPro",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      end: 15,
                    ),
                    alignment: Alignment.topRight,
                    child: Text(
                      SackaCubit.get(context).names[2],
                      style: TextStyle(
                        fontFamily: "ReadexPro",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      top: MediaQuery.of(context).size.height * 0.14,
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      SackaCubit.get(context).names[3],
                      style: TextStyle(
                        fontFamily: "ReadexPro",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        color: Colors.teal[100],
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {
                          SackaCubit.get(context).ChangeNamedInVariableBoy();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Text(
                            "إعادة التوزيع",
                            style: TextStyle(
                              fontFamily: "ReadexPro",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        color: Colors.teal[100],
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {
                          SackaCubit.get(context).ChangeNamedInVariableBoy();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Text(
                            "إعادة دق ولد",
                            style: TextStyle(
                              fontFamily: "ReadexPro",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        color: Colors.teal[300],
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => PlayerGame2()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Text(
                            "إبدا اللعب",
                            style: TextStyle(
                              fontFamily: "ReadexPro",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                  bottom: MediaQuery.of(context).size.height * 0.3,
                ),
                alignment: Alignment.center,
                height: 120,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 120,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              ":يبدأ عند ",
                              style: TextStyle(
                                fontFamily: "ReadexPro",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              " ${SackaCubit.get(context).names[0]}",
                              style: TextStyle(
                                fontFamily: "ReadexPro",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
 

*/