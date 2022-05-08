import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:sacka/Screen/AboutUs.dart';
import 'package:sacka/Screen/add_name.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:sacka/Screen/archife.dart';
import 'package:sacka/Screen/rouls_screen.dart';
import 'package:sacka/helper/helper.dart';
import 'package:sacka/sacka_cubit.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: Container(),
        elevation: 0,
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 125,
                  width: 140,
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
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      "إعدادت التطبيق",
                      style: TextStyle(
                        fontFamily: "ReadexPro",
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Archfe(),
                        ));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.arrow_back),
                        Spacer(),
                        Text(
                          "الأرشيف",
                          style: TextStyle(
                            fontFamily: "ReadexPro",
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.red[100],
                          child: Icon(
                            Icons.archive,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => AddName()));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.arrow_back),
                        Spacer(),
                        Text(
                          "الأسماء المكتوبة",
                          style: TextStyle(
                            fontFamily: "ReadexPro",
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.red[100],
                          child: Icon(
                            Icons.article_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomSwitch(
                        activeColor: Colors.red,
                        value: SackaCubit.isSound,
                        onChanged: (value) {
                          SackaCubit.get(context).chaneSound(value);

                          CashHelper.setDataApp(
                            a: SackaCubit.isSound,
                          );
                        },
                      ),
                      Spacer(),
                      Text(
                        "تلقي الإشعارات",
                        style: TextStyle(
                          fontFamily: "ReadexPro",
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.red[100],
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomSwitch(
                        activeColor: Colors.red,
                        value: SackaCubit.isneon,
                        onChanged: (value) {
                          SackaCubit.get(context).chaneN(value);

                          CashHelper.setApp(
                            a: SackaCubit.isneon,
                          );
                        },
                      ),
                      Spacer(),
                      Text(
                        "خاصية عدم إطفاء الشاشة",
                        style: TextStyle(
                          fontFamily: "ReadexPro",
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.red[100],
                        child: Icon(
                          Icons.flare_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    await FlutterShare.share(
                      title: 'لعبة صكة',
                      text: 'قم بتنزيل تطبيق صكة ',
                      linkUrl: 'https://app.skkah.com',
                      chooserTitle: 'لعبة صكة',
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.arrow_back),
                        Spacer(),
                        Text(
                          "شارك التطبيق",
                          style: TextStyle(
                            fontFamily: "ReadexPro",
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.red[100],
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      "أخرى",
                      style: TextStyle(
                        fontFamily: "ReadexPro",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => AboutUs()));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.arrow_back),
                        Spacer(),
                        Text(
                          "عن التطبيق",
                          style: TextStyle(
                            fontFamily: "ReadexPro",
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.red[100],
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.arrow_back),
                      Spacer(),
                      Text(
                        "تواصل معنا ",
                        style: TextStyle(
                          fontFamily: "ReadexPro",
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.red[100],
                        child: Icon(
                          Icons.contact_support,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Roules()));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.arrow_back),
                        Spacer(),
                        Text(
                          "الشروط والأحكام",
                          style: TextStyle(
                            fontFamily: "ReadexPro",
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.red[100],
                          child: Icon(
                            Icons.article_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Roules()));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.arrow_back),
                        Spacer(),
                        Text(
                          "سياسة الخصوصية",
                          style: TextStyle(
                            fontFamily: "ReadexPro",
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.red[100],
                          child: Icon(
                            Icons.speaker_notes_rounded,
                            color: Colors.white,
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
