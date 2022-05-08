import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sacka_state.dart';

class SackaCubit extends Cubit<SackaState> {
  static bool flag = false;
  static int totlaMy = 0;
  static int totlaYour = 0;
  static bool show = false;
  static bool isSound = false;
  static bool isneon = false;

  final _random = new Random();

  String fName = "";
  String SName = "";
  String ThName = "";
  String FoName = "";
  SackaCubit() : super(SackaInitial());
  static SackaCubit get(context) => BlocProvider.of(context);
  List<String> names = [];

  List<String> my = [];
  List<String> your = [];
  List<UserModel> score = [];
  UserModel userModel;
  var ss = GlobalKey<ScaffoldState>();
//******************************** */
  List<int> Finalyour = [];
  List<int> FinalMy = [];

//********************************* */
  void newName({@required String name}) {
    flag = false;
    for (int i = 0; i < names.length; i++) {
      if (names[i] == name.trim()) {
        flag = true;
        emit(SachaNameAlready());
        break;
      }
    }
    if (flag != true) {
      if (names.length < 4) {
        names.add(name);
        emit(SachaNameSuccessfully());
      } else {
        emit(SachaNameLoaded());
      }
    }
  }

  void AddMy({@required String name}) {
    my.add(name);
    emit(AddGameSuccessfully());
  }

  void AddYour({@required String name}) {
    your.add(name);
    emit(AddGameYourSuccessfully());
  }

//*********************************** */
  void addTotalMy({
    @required int num,
  }) {
    FinalMy.add(num);

    emit(AddGameYourScoreSuccess());
  }

  void changeTotalMy() {
    totlaMy = 0;
    FinalMy.forEach((element) {
      totlaMy += element;
    });
    emit(ChangeGameYourScoreSuccess());
  }

  void removeMy() {
    FinalMy.removeLast();
    emit(RemoveGameYourScoreSuccess());
  }

  void removeYour() {
    Finalyour.removeLast();
    emit(RemoveGameMyScoreSuccess());
  }

  void addTotalYour({
    @required int num,
  }) {
    Finalyour.add(num);
    emit(AddGameMyScoreSuccess());
  }

  void changeTotalYour() {
    totlaYour = 0;
    Finalyour.forEach((element) {
      totlaYour += element;
    });
    emit(ChangeGameMyScoreSuccess());
  }

  void ShowInput() {
    show = !show;
    emit(ShowInputData());
  }

  void addScore({
    @required String nameSuccess,
    @required String nameFaild,
    @required int scoreSucces,
    @required int scoreFaild,
    @required String timer,
  }) {
    UserModel user = new UserModel(
      nameFaild: nameFaild,
      nameSuccess: nameSuccess,
      scoreFaild: scoreFaild,
      scoreSucces: scoreSucces,
      timer: timer,
    );
    score.add(user);
    emit(AddScoreSuccessfully());
    print(score);
  }

  void chaneSound(dynamic value) {
    isSound = !isSound;
    emit(ChangeSound());
    print("value is $isSound");
  }

  void chaneN(dynamic value) {
    isneon = !isneon;
    emit(ChangeN());
    print("value is $isneon");
  }

  void ShowButtomSheet() {
    ss.currentState.showBottomSheet((context) {
      return Container(
        color: Colors.red,
        child: Column(
          children: [
            Text("data"),
            Text("data"),
          ],
        ),
      );
    });
    emit(ShowButtomCheet());
  }

  void addNamedInToVar() {
    fName = names[0];
    SName = names[1];
    ThName = names[2];
    FoName = names[3];
    emit(AddNamedIsSuccessfully());
  }

  void ChangeNamedInVariableBoy() {
    if (names.isEmpty) {
      print("null");
    } else {
      names.shuffle();
      // fName = names[_random.nextInt(names.length)];

      // SName = names[_random.nextInt(names.length)];
      // ThName = names[_random.nextInt(names.length)];
      // FoName = names[_random.nextInt(names.length)];
    }

    emit(ChangeNamedInVariable());
  }

  void c() {
    List<int> numberList = [5, 8, 4, 7, 9];
    Random random = new Random();
    for (var i = 0; i < numberList.length; i++) {
      int random_number = random.nextInt(numberList.length);
      if (!numberList.contains(random_number)) {
        print(random_number);
      }
    }
  }
}

class UserModel {
  String nameSuccess;
  String nameFaild;
  String timer;
  int scoreSucces;
  int scoreFaild;

  UserModel(
      {this.nameSuccess,
      this.nameFaild,
      this.timer,
      this.scoreSucces,
      this.scoreFaild});
}
