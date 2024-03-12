import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        backgroundColor: Color(0xFF1E1E1E), // colors가 아니다.
        body: Padding(
					padding: EdgeInsets.symmetric(horizontal: 40),
					// .all 모두에게 적용, .only 특정 부분에만 적용, .symmetric 상하좌우에만 적용. 여백주는 것임
					child:
						Column(
							children: [
								SizedBox( // 윗 공간 띄우기
									height: 80,
								),
								Row(
									mainAxisAlignment: MainAxisAlignment.end, // Row의 자식들을 오른쪽으로 정렬
									// Row의 MainAxis는 수평방향이고, CrossAxis는 수직방향이다.
									//Column의 MainAxis는 수직방향이고, CrossAxis는 수평방향이다.

									children: [
										Column(
											crossAxisAlignment: CrossAxisAlignment.end, // Column의 자식들을 오른쪽으로 정렬
											children: [
												Text('Hey, Kan',
													style:TextStyle(
														color:Colors.white,
														fontSize: 28,
														fontWeight: FontWeight.w800,
														),
													),
												Text('Welcome back',
													style:TextStyle(
														color:Colors.white.withOpacity(0.5),
														fontSize: 18,
													),
												),
											],
										),
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