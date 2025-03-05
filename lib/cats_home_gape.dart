import 'package:flutter/material.dart';

class CatsHomePage extends StatelessWidget {
  const CatsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 200),
              Container(
                height: 50,
                width: 384,
                decoration: BoxDecoration(
                  color: Color(0xff6756ff),
                  borderRadius: BorderRadius.circular(5),
                ),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
