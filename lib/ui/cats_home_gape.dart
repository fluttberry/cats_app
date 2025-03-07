import 'dart:convert';
import 'package:cats_app/model/cat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
                      ? Image.network(catModel!.url, width: double.infinity)
                      : Center(child: CircularProgressIndicator()),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff6756ff),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 50,
                width: double.infinity,

                child: Center(
                  child: InkWell(
                    onTap: getCat,
                    child: Text('Next', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getCat() async {
    setState(() {
      catModel = null;
    });

    var response = await http.get(Uri.parse('https://cataas.com/cat?json=true'),);
    if (response.statusCode == 200) {
      setState(() {
        catModel = CatModel.fromJson(utf8.decode(response.bodyBytes));
      });
    }
  }
}
