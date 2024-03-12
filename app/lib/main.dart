import 'package:app/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  //var player = Player(name : 'Jone'); // Text("Hello Flutter")가 이처럼 position parameter로 들어가는 것이고..
  runApp(const App()); // runApp은 import에서 가져온 함수
}

// Missing concrete implementation of 'StatelessWidget.build'.
// StatelessWidget은 build 메소드를 구현해야 합니다.
// build 메소드는 widget의 ui를 생성을 하는 것이다.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF1E1E1E), // colors가 아니다.
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // .all 모두에게 적용, .only 특정 부분에만 적용, .symmetric 상하좌우에만 적용. 여백주는 것임
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Column의 자식들을 왼쪽으로 정렬
            children: [
              const SizedBox(
                // 윗 공간 띄우기
                height: 80,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end, // Row의 자식들을 오른쪽으로 정렬
                // Row의 MainAxis는 수평방향이고, CrossAxis는 수직방향이다.
                //Column의 MainAxis는 수직방향이고, CrossAxis는 수평방향이다.

                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end, // Column의 자식들을 오른쪽으로 정렬
                    children: [
                      Text(
                        'Hey, Kan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          //color:Colors.white.withOpacity(0.8),
                          color: Color.fromRGBO(255, 255, 255, 0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Text('Total Balance',
                  style: TextStyle(
                      fontSize: 22, color: Colors.white.withOpacity(0.8))),
              const SizedBox(
                height: 5,
              ),
              Text('\$5 194 482',
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.8))),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 사이 공간 주기
                children: [
                  // container는 div 같은 존재. 여기에는 child가 들어간다.
                  Button(
                      text: 'Transfer',
                      bgColor: Color(0xfff1b33b),
                      textColor: Colors.black),
                  Button(
                      text: 'Request',
                      bgColor: Color(0xff1F2123),
                      textColor: Colors.white),
                ],
              ),
            ],
          ),
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