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
                      ? Image.network(catModel!.url)
                      : CircularProgressIndicator(),
            ),
            InkWell(onTap: getCat

            , child: Text('Next'),),
          ],
        ),
      ),
    );
  }

  getCat () async{
setState(() {
  catModel = null;
});

var response = await http.get(Uri.parse('https://cataas.com/cat'));
if (response.statusCode==200) {
setState(() {
  catModel = CatModel.fromJson(response.body);
});
}
  }
}
