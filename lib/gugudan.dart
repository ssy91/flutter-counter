// Materal 이라고 부르는 안드로이드 운영체제 전용 그래픽 라이브러리
import 'package:flutter/material.dart';
// Apple 전용 그래픽 라이브러리 도 있음!
// import 'package:flutter/cupertino.dart';

// 기본 플러터 앱에서 최상단 Appbar 부분에 [구구단 화면] 이라는 텍스트가
// 중앙 정렬되게 작성을 하고,
// body 부분에 1단 ~ 9단까지 구구단을 출력하는 기능을 하는 화면을 구성하세요.
// 1 x 1 = 1 2 x 1 = 2 .... 9 x 1 = 9
// .....
// 1 x 9 = 9

void main() {
  runApp(Gugudan());
}

class Gugudan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 구구단 작성할 수 있는 기능 만들기!
    String gugudan1 = ''; // 1 x 1 = 1 1 x 2 = 2 ... 값을 저장할 변수
    String gugudan2 = '';
    String gugudan3 = '';
    String gugudan4 = '';
    String gugudan5 = '';
    String gugudan6 = '';
    String gugudan7 = '';
    String gugudan8 = '';
    String gugudan9 = '';

    // 1 x 1 = 1 부터 9 x 9 = 81 까지의 값을 생성하는 기능 만들기!
    for (var dan = 1; dan <= 9; dan++) {
      for (var num = 1; num <= 9; num++) {
        if (dan == 1) {
          gugudan1 = gugudan1 + ("$dan x $num = ${dan * num}\n");
        } else if (dan == 2) {
          gugudan2 = gugudan2 + ("$dan x $num = ${dan * num}\n");
        } else if (dan == 3) {
          gugudan3 = gugudan3 + ("$dan x $num = ${dan * num}\n");
        } else if (dan == 4) {
          gugudan4 = gugudan4 + ("$dan x $num = ${dan * num}\n");
        } else if (dan == 5) {
          gugudan5 = gugudan5 + ("$dan x $num = ${dan * num}\n");
        } else if (dan == 6) {
          gugudan6 = gugudan6 + ("$dan x $num = ${dan * num}\n");
        } else if (dan == 7) {
          gugudan7 = gugudan7 + ("$dan x $num = ${dan * num}\n");
        } else if (dan == 8) {
          gugudan8 = gugudan8 + ("$dan x $num = ${dan * num}\n");
        } else if (dan == 9) {
          gugudan9 = gugudan9 + ("$dan x $num = ${dan * num}\n");
        }
      }
    }

    return MaterialApp(
      title: 'App Title',
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("구구단 화면"))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text(gugudan1), Text(gugudan2), Text(gugudan3)],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text(gugudan4), Text(gugudan5), Text(gugudan6)],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text(gugudan7), Text(gugudan8), Text(gugudan9)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
