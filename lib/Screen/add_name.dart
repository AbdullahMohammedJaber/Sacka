import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sacka/Screen/Quraa.dart';
import 'package:sacka/sacka_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var name = TextEditingController();

    return BlocConsumer<SackaCubit, SackaState>(
      listener: (context, state) {
        if (state is SachaNameAlready) {
          showTopSnackBar(
            context,
            CustomSnackBar.error(
              message: "الإسم موجود مسبقا حاول مجداًاً",
            ),
          );
        } else if (state is SachaNameSuccessfully) {
          showTopSnackBar(
            context,
            CustomSnackBar.success(
              message: "تم إضافة الاسم بنجاح ",
            ),
          );
        } else if (state is SachaNameLoaded) {
          showTopSnackBar(
            context,
            CustomSnackBar.error(
              message: "تجاوز عدد اللاعبين",
            ),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[400],
            appBar: AppBar(
              leading: Container(),
              toolbarHeight: 200,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
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
                          Text(
                            "إضافة اللاعبين",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "ReadexPro",
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
                                controller: name,
                                decoration: InputDecoration(
                                  hintText: "أدخل إسم اللاعب",
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  fillColor: Colors.white,
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () {
                                  if (name.text.isNotEmpty) {
                                    SackaCubit.get(context)
                                        .newName(name: name.text);
                                    name.clear();
                                  } else if (name.text.isEmpty) {
                                    showTopSnackBar(
                                      context,
                                      CustomSnackBar.error(
                                        message: "الرجاء كتابة إسم",
                                      ),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60),
                                  child: Text("إضافة"),
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
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      width: double.infinity,
                      child: Text(
                        ": أسماء اللاعبين",
                        style: TextStyle(
                          fontFamily: "ReadexPro",
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.topCenter,
                          height: MediaQuery.of(context).size.height * 0.60,
                          child: SackaCubit.get(context).names.length == null
                              ? Text("null")
                              : ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: false,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      SackaCubit.get(context).names[index],
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "ReadexPro",
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Divider(
                                        color: Colors.white,
                                        thickness: 0.5,
                                      ),
                                    );
                                  },
                                  itemCount:
                                      SackaCubit.get(context).names.length,
                                ),
                        ),
                        RaisedButton(
                          color: Colors.teal[900],
                          textColor: Colors.white,
                          onPressed: () {
                            if (SackaCubit.get(context).names.length < 4) {
                              showTopSnackBar(
                                context,
                                CustomSnackBar.error(
                                  message: "الرجاء إدخال كافة اللاعبين",
                                ),
                              );
                            } else {
                              SackaCubit.get(context).addNamedInToVar();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => Quraa()));
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            child: Text(
                              "دق ولد",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "ReadexPro",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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
}
