import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'น้ำขึ้นให้รีบตัก ผู้ชายทักให้รีบตอบ',
    'กลางคืนอย่างห้าว ตอนเช้าอย่างง่วง',
    'แคปชั่นไม่รู้ แต่แคบหมูไม่แน่',
    'ใจไม่ดำหรอกจ้ะ ขอบตาต่างหากที่ดำ',
    'พูดไม่ค่อยเก่ง แต่กินหมดจาน',
    'พูดไม่ค่อยเก่ง แต่กินหมดจาน',
    'ไม่เคยวิ่งตามใคร เพราะขับรถไปหาอย่างเดียว'
  ];
  static const List<Color> colorList = [
    Colors.pinkAccent,
    Colors.lightGreenAccent,
    Colors.lightBlue,
    Colors.orangeAccent
  ];

  var quote = quoteList[0];
  int colorIndex = 0;

  void handleClickGo() {
    var rand = Random();
    int randomIndex;

    do{
      randomIndex = rand.nextInt(quoteList.length);
    }while(quote == quoteList[randomIndex]);

    do{
      randomIndex = rand.nextInt(colorList.length);
    }while(colorList[colorIndex] == colorList[randomIndex]);

    setState(() {
      quote = quoteList[randomIndex];
      colorIndex = randomIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('คำคมกวนๆ'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Go'),
        onPressed: handleClickGo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote,
            style: TextStyle(
              color: colorList[colorIndex],
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
