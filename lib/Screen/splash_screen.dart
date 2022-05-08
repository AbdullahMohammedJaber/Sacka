import 'package:flutter/material.dart';
import 'package:sacka/Screen/HomeLayoutScreen.dart';
import 'package:sacka/Screen/layout.dart';
import 'package:sacka/sacka_cubit.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 4),
      () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => HomeLayoutScreen(),
        ),
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 180,
                  width: 180,
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
                Center(
                  child: CircularProgressIndicator(),
                ),
                Spacer(),
                Image.asset('assets/images/log2.jpeg')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
