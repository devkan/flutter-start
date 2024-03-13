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
  //List<int> numbers = [];
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  void onClicked() {
    setState(() {
      counter = counter + 1;
      //numbers.add(numbers.length);
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
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle
                  ? const MyLargeTitle()
                  : const Text('nothing'), // 위젯으로 만듦
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.delete_forever_rounded),
              ),
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

/*
StatefulWidget을 벗어난 별도 위젯을 만들었다. StatelessWidget으로..
StatelessWidget인 MyLargeTitle에서 theme의 값에 접근을 원하는것이다.
즉, 부모요소인 _AppState에 접근을 원하는 것이다. 그때 사용하는 것이 build에 있는 BuildContext인 것이다.
BuildContext의 context에는 MyLargeTitle Text의 부모 요소들의 모든 정보가 담겨져 있다.
즉 context에는 상위의 모든 부모의 트리 구조가 담겨져 있다고 보면 된다. 그래서 접근이 가능한 것이다.
*/
class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  // initState는 상태를 초기화 하는 메소드이다.
  @override
  void initState() {
    super.initState();
    print('initState');
  }
  /*
  int count = 0;
  대부분의 경우 이처럼 상태변수를 초기화 시킬수 있다. 그럼 구지 initState()를 사용하지 않아도 된다.
  하지만, 부모 요소에 의존하는 데이타를 초기화 해야 하는 경우 context를 사용해야 한다.
  이때 initState()를 사용하는 것이다. 중요한 것은 iniState()는 build()보다 먼저 호출이 되고,
  한번만 호출이 가능하다.
  */

  // dispose() 메소드는 위젯이 스크린에서 제거될때 호출되는 메소드다
  // 주로 취소할때 많이 사용한다.
  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      'My Large Title',
      style: TextStyle(
          fontSize: 30, color: Theme.of(context).textTheme.titleLarge?.color),
      // ? : mybe, ! : never null(null이 절대 안옴) 아무것을 사용해도 된다.
    );
  }
}
