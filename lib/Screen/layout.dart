import 'package:flutter/material.dart';
import 'package:sacka/sacka_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class Layout extends StatefulWidget {
  @override
  State<Layout> createState() => _LayoutState();
}

var ss = GlobalKey<ScaffoldState>();

class _LayoutState extends State<Layout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: ss,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: Colors.grey[300],
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
