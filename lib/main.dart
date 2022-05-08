import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sacka/Screen/splash_screen.dart';
import 'package:sacka/helper/helper.dart';
import 'package:sacka/sacka_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  await Firebase.initializeApp();
  bool isSou = CashHelper.getDataApp(key: 'aa');
  bool isNeon = CashHelper.getDataApp(key: 'bb');
  if (isSou == true) {
    SackaCubit.isSound = true;
    FirebaseMessaging().autoInitEnabled();
  } else if (isSou == false) {}
  if (isNeon == true) {
    SackaCubit.isneon == true;
  }
  print(isSou);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => SackaCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
