import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sacka/sacka_cubit.dart';

class Archfe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SackaCubit, SackaState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey[300],
            leading: Container(),
            title: Text(
              "الأرشيف",
              style: TextStyle(
                fontFamily: "ReadexPro",
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            actions: [
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
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${SackaCubit.get(context).score[index].timer}',
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                Spacer(),
                                Text(
                                  "${SackaCubit.get(context).score[index].nameSuccess}",
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "فريق ",
                                  style: TextStyle(
                                    fontFamily: "ReadexPro",
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red[200],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${SackaCubit.get(context).score[index].nameFaild}",
                                          style: TextStyle(
                                            fontFamily: "ReadexPro",
                                            fontSize: 30,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          "${SackaCubit.get(context).score[index].scoreFaild}",
                                          style: TextStyle(
                                            fontFamily: "ReadexPro",
                                            fontSize: 30,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green[200],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${SackaCubit.get(context).score[index].nameSuccess}",
                                          style: TextStyle(
                                            fontFamily: "ReadexPro",
                                            fontSize: 30,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          "${SackaCubit.get(context).score[index].scoreSucces}",
                                          style: TextStyle(
                                            fontFamily: "ReadexPro",
                                            fontSize: 30,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: SackaCubit.get(context).score.length,
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
