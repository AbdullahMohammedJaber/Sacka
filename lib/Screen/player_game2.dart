import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sacka/Screen/HomeLayoutScreen.dart';
import 'package:sacka/Screen/final_game.dart';
import 'package:sacka/Screen/final_game2.dart';
import 'package:sacka/sacka_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class PlayerGame2 extends StatefulWidget {
  @override
  State<PlayerGame2> createState() => _PlayerGame2State();
}

class _PlayerGame2State extends State<PlayerGame2> {
  var lahom = TextEditingController();
  var lana = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SackaCubit, SackaState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[400],
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "لهم",
                              style: TextStyle(
                                fontFamily: "ReadexPro",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                controller: lahom,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "لنا",
                              style: TextStyle(
                                fontFamily: "ReadexPro",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                controller: lana,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  if (SackaCubit.totlaMy != 0) {
                                    _showMyDialog();
                                  } else {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => HomeLayoutScreen(),
                                        ),
                                        (route) => false);
                                  }
                                },
                                icon: Icon(Icons.home),
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            RaisedButton(
                              onPressed: () {
                                if (lahom.text.isEmpty &&
                                    lana.text.isNotEmpty) {
                                  int x = int.parse(lana.text);
                                  print("x is ${x}");
                                  SackaCubit.get(context).addTotalMy(num: x);
                                  SackaCubit.get(context).changeTotalMy();
                                  int y = 0;
                                  print("y is ${y}");
                                  SackaCubit.get(context).addTotalYour(num: y);
                                  SackaCubit.get(context).changeTotalYour();
                                  lana.clear();
                                  lahom.clear();
                                } else if (lana.text.isEmpty &&
                                    lahom.text.isNotEmpty) {
                                  int x = 0;
                                  print("x is ${x}");
                                  SackaCubit.get(context).addTotalMy(num: x);
                                  SackaCubit.get(context).changeTotalMy();
                                  int y = int.parse(lahom.text);
                                  print("y is ${y}");
                                  SackaCubit.get(context).addTotalYour(num: y);
                                  SackaCubit.get(context).changeTotalYour();
                                  lana.clear();
                                  lahom.clear();
                                } else if (lana.text.isEmpty &&
                                    lahom.text.isEmpty) {
                                  int x = 0;
                                  print("x is ${x}");
                                  SackaCubit.get(context).addTotalMy(num: x);
                                  SackaCubit.get(context).changeTotalMy();
                                  int y = 0;
                                  print("y is ${y}");
                                  SackaCubit.get(context).addTotalYour(num: y);
                                  SackaCubit.get(context).changeTotalYour();
                                  lana.clear();
                                  lahom.clear();
                                } else if (lana.text.isNotEmpty &&
                                    lahom.text.isNotEmpty) {
                                  int x = int.parse(lana.text);
                                  print("x is ${x}");
                                  SackaCubit.get(context).addTotalMy(num: x);
                                  SackaCubit.get(context).changeTotalMy();
                                  int y = int.parse(lahom.text);
                                  print("y is ${y}");
                                  SackaCubit.get(context).addTotalYour(num: y);
                                  SackaCubit.get(context).changeTotalYour();
                                  lana.clear();
                                  lahom.clear();
                                }

                                if (SackaCubit.totlaMy >= 152 ||
                                    SackaCubit.totlaYour >= 152) {
                                  lana.clear();
                                  lahom.clear();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => FinalGame2()),
                                      (route) => false);
                                  DateTime now = DateTime.now();
                                  var x = DateFormat('kk:mm:ss').format(now);
                                  SackaCubit.get(context).addScore(
                                    nameSuccess: SackaCubit.totlaMy >= 152
                                        ? "لنا"
                                        : "لهم",
                                    nameFaild: SackaCubit.totlaMy >= 152
                                        ? "لهم"
                                        : "لنا",
                                    scoreSucces: SackaCubit.totlaMy >= 152
                                        ? SackaCubit.totlaMy
                                        : SackaCubit.totlaYour,
                                    scoreFaild: SackaCubit.totlaMy < 152
                                        ? SackaCubit.totlaMy
                                        : SackaCubit.totlaYour,
                                    timer: x,
                                  );
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              child: Text(
                                "سجل",
                                style: TextStyle(
                                  fontFamily: "ReadexPro",
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${SackaCubit.totlaYour}',
                              style: TextStyle(
                                fontFamily: "ReadexPro",
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  SackaCubit.get(context).names[0],
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 28,
                                  ),
                                ),
                                Text(
                                  "*******",
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  SackaCubit.get(context).names[3],
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 28,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .66,
                              width: MediaQuery.of(context).size.width * .40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${SackaCubit.get(context).Finalyour[index]}",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "ReadexPro",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Divider(
                                      thickness: 1.5,
                                    ),
                                  );
                                },
                                itemCount:
                                    SackaCubit.get(context).Finalyour.length,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${SackaCubit.totlaMy}',
                              style: TextStyle(
                                fontFamily: "ReadexPro",
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  SackaCubit.get(context).names[2],
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 28,
                                  ),
                                ),
                                Text(
                                  "*******",
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  SackaCubit.get(context).names[1],
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 28,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .66,
                              width: MediaQuery.of(context).size.width * .40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${SackaCubit.get(context).FinalMy[index]}",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "ReadexPro",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Divider(
                                      thickness: 1.5,
                                    ),
                                  );
                                },
                                itemCount:
                                    SackaCubit.get(context).FinalMy.length,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "هل تريد إنهاء اللعبة الحالية؟",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "ReadexPro",
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.red,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => HomeLayoutScreen()),
                    (route) => false);
              },
              child: Text(
                "خروج",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ReadexPro",
                  color: Colors.white,
                ),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.green,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "متابعة اللعب",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ReadexPro",
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
/*

 backgroundColor: Colors.teal[100],
            appBar: AppBar(
              leading: Container(),
              toolbarHeight: 200,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.teal[300],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {
                                if (SackaCubit.totlaMy != 0) {
                                  _showMyDialog();
                                } else {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => HomeLayoutScreen(),
                                      ),
                                      (route) => false);
                                }
                              },
                              icon: Icon(Icons.home),
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {
                                if (SackaCubit.totlaMy != 0) {
                                  _showMyDialog();
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              icon: Icon(Icons.arrow_back_ios_new),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "لهم",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ReadexPro",
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "لنا",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ReadexPro",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            '${SackaCubit.totlaYour}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ReadexPro",
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '${SackaCubit.totlaMy}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ReadexPro",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          "إبدأ بتوزيع الورق",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ReadexPro",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        height: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "لهم",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ReadexPro",
                                  color: Colors.black,
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${SackaCubit.get(context).Finalyour[index]}",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "ReadexPro",
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 10,
                                  );
                                },
                                itemCount:
                                    SackaCubit.get(context).Finalyour.length,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.1, 0.5, 0.7, 0.9],
                            colors: [
                              Colors.teal[300],
                              Colors.teal[200],
                              Colors.teal[100],
                              Colors.teal[50],
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            Spacer(),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                SackaCubit.get(context).ShowInput();
                                if (lana.text.isEmpty || lahom.text.isEmpty) {
                                  showTopSnackBar(
                                    context,
                                    CustomSnackBar.error(
                                      message: "الرجاء إدخال قيمة اللعب",
                                    ),
                                  );
                                } else {
                                  int x = int.parse(lana.text);
                                  SackaCubit.get(context).addTotalMy(num: x);
                                  SackaCubit.get(context).changeTotalMy();
                                  int y = int.parse(lahom.text);
                                  SackaCubit.get(context).addTotalYour(num: y);
                                  SackaCubit.get(context).changeTotalYour();
                                }
                                if (SackaCubit.totlaMy == 160 ||
                                    SackaCubit.totlaYour == 160) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => FinalGame()),
                                      (route) => false);
                                }
                              },
                              child: Text(
                                "سجل",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ReadexPro",
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        height: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "لنا",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ReadexPro",
                                  color: Colors.black,
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${SackaCubit.get(context).FinalMy[index]}",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "ReadexPro",
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 10,
                                  );
                                },
                                itemCount:
                                    SackaCubit.get(context).FinalMy.length,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.teal[300],
                      onPressed: () {
                        if (SackaCubit.totlaMy != 0) {
                          _showMyDialog();
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomeLayoutScreen(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "صكّة جديدة",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ReadexPro",
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.red,
                      onPressed: () {
                        SackaCubit.get(context).removeMy();
                        SackaCubit.get(context).changeTotalMy();
                        SackaCubit.get(context).removeYour();
                        SackaCubit.get(context).changeTotalYour();
                      },
                      child: Text(
                        "تراجع",
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
                SackaCubit.show == false
                    ? Container()
                    : Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                child: TextFormField(
                                  controller: lahom,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 50,
                                child: TextFormField(
                                  controller: lana,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),

*/
