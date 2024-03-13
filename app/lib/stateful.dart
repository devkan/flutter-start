import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

/*
stateful 위젯은 두 파트로 나누어져 있다.
stateful 위젯 클래스, state 클래스로 구분 되어 있다.
stateful 위젯 클래스는 state 클래스를 생성하고, state 클래스는 위젯의 상태를 관리한다.
*/

// stateful 위젯 클래스
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

// state 클래스
// 이건 counter라는 property를 가지고 있는 Dart 클래스일뿐이다. flutter가 아닌다.
class _AppState extends State<App> {
  int counter = 0; // 계속 데이타가 변해야 하기 때문에 final을 사용하지 않는다.

  void onClicked() {
    setState(() {
      counter = counter + 1;
    });
    // seState를 사용해서 데이타의 변화가 생겼음을 알려줘야 한다.
    // setState()가 호출될때 매다 매번 아래의 build를 실행해서 ui를 변경해 주는 것이다. 매번..

    /*
    counter = counter + 1;
    setState(() {});
    이렇게 구성해도 작동은 한다. 그런데, 가독성을 올리기 위해서 setState안에 넣는 것을 추천한다.

    */
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click count',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                '$counter',
                style: const TextStyle(fontSize: 30),
              ),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(
                  Icons.add_box_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
