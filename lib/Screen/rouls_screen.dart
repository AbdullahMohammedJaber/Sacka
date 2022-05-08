import 'package:flutter/material.dart';

class Roules extends StatelessWidget {
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
          "سياسة الخصوصية",
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
                alignment: Alignment.topRight,
                child: Text(
                  "الشروط",
                  style: TextStyle(
                    fontFamily: "ReadexPro",
                    fontSize: 18,
                    color: Colors.black,
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
                  "بدخولك إلى الموقع فأنت توافق على الإلتزام بهذه الشروط، وعلى جميع القوانين واللوائح المعمول بها، وتقر كذلك بأنك مسئول عن الإمتثال لأي قوانين محلية سارية .إذا كنت لا توافق على أي من هذه الشروط، فلا يحق لك استخدام أو الدخول إلى هذا الموقع. جميع المواد الواردة في هذا الموقع محمية بموجب حقوق النشر المعمول بها وبموجب قانون حماية العلامات التجارية .",
                  style: TextStyle(
                    fontFamily: "ReadexPro",
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  "القانون المنظم ",
                  style: TextStyle(
                    fontFamily: "ReadexPro",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "تخضع هذه الشروط والأحكام ويؤول تفسيرها إلى قوانين المملكة العربية السعودية وتخضع أنت كذلك وبشكل غير قابل للنقض للإختصاص القضائي لمحاكم المملكة العربية السعودية .",
                  style: TextStyle(
                    fontFamily: "ReadexPro",
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  "سياسة الخصوصية ",
                  style: TextStyle(
                    fontFamily: "ReadexPro",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "تعتبر الخصوصية والأمن أقصى الأولويات في حيث أننا لم نقم على الإطلاق بمشاركة أو طباعة أو بيع معلومات أي زبون لأي طرف آخر .عند قيامك بتقديم المعلومات الشخصية على موقعنا سنعمل بكل جهد على حماية معلوماتك على الإنترنت وخارجه .نقوم باستخدام مجموعة متنوعة من تقنيات وإجراءات الأمان للمساعدة على حماية معلوماتك الشخصية من الوصول أو الاستخدام أو الكشف غير المصرح به حالما",
                  style: TextStyle(
                    fontFamily: "ReadexPro",
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
