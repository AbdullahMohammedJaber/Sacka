import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sacka/Screen/player_game.dart';
import 'package:sacka/sacka_cubit.dart';

class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var name = TextEditingController();
  var youre = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SackaCubit, SackaState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
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
                        children: [
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.teal[900],
                        ),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: name,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'أدخل اسم اللاعب';
                                  } else {
                                    return '';
                                  }
                                },
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: "أدخل إسم اللاعب",
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  fillColor: Colors.white,
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      SackaCubit.get(context)
                                          .AddYour(name: name.text);
                                      name.clear();
                                    },
                                    child: Text(
                                      "إضافةلهم",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "ReadexPro",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      SackaCubit.get(context)
                                          .AddMy(name: name.text);
                                      name.clear();
                                    },
                                    child: Text(
                                      "إضافة لنا ",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "ReadexPro",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Row(
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
                                  SackaCubit.get(context).your[index],
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
                            itemCount: SackaCubit.get(context).your.length,
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PlayerGame(),
                              ),
                            );
                          },
                          child: Text(
                            "إبدا اللعب",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ReadexPro",
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
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
                                  SackaCubit.get(context).my[index],
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
                            itemCount: SackaCubit.get(context).my.length,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
