import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  const Button({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Text(
          text,
          // 이렇게 하면 text가 변경될수 있는데, Padding에서 const를 사용한다고 오류가 난다.
          // 그래서 Padding의 const를 제거해야 한다.
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
    // 마지막에 세미콜론을 붙여줘야 한다.
  }
}
