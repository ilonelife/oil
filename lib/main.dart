import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'model/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data> _data = [];

  Future<void> fetch() async {
    var url = Uri.parse(
        'https://api.odcloud.kr/api/uws/v1/inventory?page=1&perPage=10&serviceKey=data-portal-test-key');
    var response = await http.get(url);

    final jsonResult = jsonDecode(response.body);
    final jsonData = jsonResult['data']; // 받은 데이터에서 'data' 부분만 가져온다

    print('fetch 종료');

    setState(() {
      _data.clear();
      jsonData.forEach((e) {
        _data.add(Data.fromJson(e)); // json 데이터  e 를 반복 가져와서 _data 에 넣는다
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('요소수 주유소 현황'),
        actions: [
          IconButton(
            onPressed: () {
              fetch();
            },
            icon: const Icon(Icons.restart_alt_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              fetch();
            },
            child: const Text('가져오기'),
          ),
          Expanded(
            child: ListView(
              children: _data.map((e) {
                return ListTile(
                  title: Text(e.name ?? '이름없음'),
                  subtitle: Text(e.addr ?? '주소없음'),
                  trailing: Text(e.inventory ?? '재고없음'),
                  onTap: () {
                    launch('tel:+010 8529 2830');
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/*
child: ListView(
  children: _data
      .map((e) => Text(e.name ?? ''))  이것은 이렇게 변환 가능 =>   _data.map(e) {return Text(e.name ?? '')}).toList(),
      .toList(),                       만약 e.name 이 널이면 '' 으로 해라...
 */
