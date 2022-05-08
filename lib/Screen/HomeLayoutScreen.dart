import 'package:flutter/material.dart';
import 'package:sacka/Screen/add_name.dart';
import 'package:sacka/Screen/final_game.dart';
import 'package:sacka/Screen/game.dart';
import 'package:sacka/Screen/player_game.dart';
import 'package:sacka/Screen/settings_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeLayoutScreen extends StatefulWidget {
  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  var scaffold = GlobalKey<ScaffoldState>();
  var s = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffold,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Container(),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            CircleAvatar(
              backgroundColor: Colors.teal[100],
              radius: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SettingScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.settings),
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlayerGame(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[100],
                    ),
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Text(
                            "قيد ربعها",
                            style: TextStyle(
                              fontFamily: "ReadexPro",
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddName(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[100],
                    ),
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: " دق الولد ",
                                      style: TextStyle(
                                        fontFamily: "ReadexPro",
                                        fontSize: 35,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ".",
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
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () async {
                    scaffold.currentState.showBottomSheet(
                      (context) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await launch(
                                      "https://rbb3ha.com/category/EZpDgD",
                                      enableJavaScript: true,
                                    );
                                  },
                                  child: Container(
                                    height: 80,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.teal[100],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        " ورق بلوت ربعها",
                                        style: TextStyle(
                                          fontFamily: "ReadexPro",
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: InkWell(
                                  onTap: () async {
                                    await launch(
                                      "https://rbb3ha.com/category/RArYAN",
                                      enableJavaScript: true,
                                    );
                                  },
                                  child: Container(
                                    height: 80,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.teal[100],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "طاولات البلوت",
                                        style: TextStyle(
                                          fontFamily: "ReadexPro",
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 80,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue[100],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        " إلغاء",
                                        style: TextStyle(
                                          fontFamily: "ReadexPro",
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      backgroundColor: Colors.grey[300],
                    ).close;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[100],
                    ),
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Text(
                            "متجر ربعها",
                            style: TextStyle(
                              fontFamily: "ReadexPro",
                              fontSize: 35,
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
        ),
      ),
    );
  }
}
