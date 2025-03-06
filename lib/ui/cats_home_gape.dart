import 'package:cats_app/model/cat.dart';
import 'package:flutter/material.dart';

class CatsHomePage extends StatefulWidget {
  const CatsHomePage({super.key});

  @override
  State<CatsHomePage> createState() => _CatsHomePageState();
}

class _CatsHomePageState extends State<CatsHomePage> {
  CatModel? catModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child:
                  catModel != null
                      ? Image.network(catModel!.url)
                      : CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
