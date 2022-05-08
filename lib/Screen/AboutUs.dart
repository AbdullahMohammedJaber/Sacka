import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: Container(),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "عن التطبيق",
          style: TextStyle(
            fontFamily: "ReadexPro",
            fontSize: 18,
            color: Colors.black,
          ),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(10),
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
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.topRight,
                child: Text(
                  "التطبيق الأشهر كحاسبة بلوت في المملكة العربية السعودية",
                  style: TextStyle(
                    fontFamily: "ReadexPro",
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "شكرا لك لتحميل تطبيق حاسبة البلوت لنا لهم صكة ، في هذا التطبيق سوف تجد أهم الأدوات التي تساعدك في لعب البلوت مع اصدقائك والمقدمة لك من شركة صكة . تستطيع البدء بالتسجيل الصكة اذا كنتم جاهزين مباشرة بشكل تقليدي او دق الولد إذا كان العدد أربعة أو أكثر يتم اختيار الأربعة المتقابلين بشكل عشوائي وتحديد بداية التوزيع مع خيار كتابة الأسماء ليتم معرفة الأشخاص والنتائج لاحقا",
                  style: TextStyle(
                    fontFamily: "ReadexPro",
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.topRight,
                height: 150,
                color: Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "شبكاتنا الإجتماعية",
                        style: TextStyle(
                          fontFamily: "ReadexPro",
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/tww.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/insta.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/whats.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/www.jpg'),
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
    );
  }
}
