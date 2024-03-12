import 'package:flutter/material.dart';

/*
class Player{
  String name;
  Player({required this.name});
}
*/

void main() {
  //var player = Player(name : 'Jone'); // Text("Hello Flutter")가 이처럼 position parameter로 들어가는 것이고..
  runApp(App()); // runApp은 import에서 가져온 함수
}

// Missing concrete implementation of 'StatelessWidget.build'.
// StatelessWidget은 build 메소드를 구현해야 합니다.
// build 메소드는 widget의 ui를 생성을 하는 것이다.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true, // Appbar의 텍스트 중앙정렬하냐 마냐
          elevation: 10, // 앱바의 그림자
          title: Text("Hello Flutter"),
        ),
        body: Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
/*
앱의 root Widget은 두개의 옵션중 하나를 반드시 return 해야 한다.
1. MaterialApp : 이건 구글의 디자인 시스템이고,
2. CupertinoApp : 이건 애플의 디자인 스시템이다.
이 둘중 하나를 선택해 리턴해야 해야 한다.

scaffold : 화면의 구조 제공. 모든 스크린은 scaffold가 필요하다
*/