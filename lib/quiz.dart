//  BottomNavigationBar 에 Color 라는 이름을 가진 Item을 하나 생성하고,
// 해당 아이템을 클릭하면
// 기본 화면에 AppBar 부분에 ['좋아하는 색상 고르기'] 라는 이름을 가지도록 생성하고
// 빨 주 노
// 초 파 남
// 보 흰 검
// 에 해당하는 박스를 100 x 100 픽셀의 크리고 만들되,
// 좌우 여백과 상하 여백이 존재하게 만들어보세요
import 'package:flutter/material.dart';
import 'book.dart';
import 'gugudan.dart';
import 'star.dart';
import 'color-change.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _title = 'Flutter SketchApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title, home: const MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  // 각 네비게이션의 위치에 있는 탭을 눌렀을 때 각각 요기 있는 애들의 코드를 실행해라. ['BOOK','GUGUDAN','STAR']
  final List<Widget> _widgetOptions = <Widget>[
    Book(), //HomeWidget 클래스
    Gugudan(), // Hello~~ 클래스
    Star(), // Star~~ 클래스,
    // 여기에 4번째 네비게이션바를 눌렀을 때 뭘 실행시켜라 라고 작성을 안해줘서
    // 네비게이션 바 눌렀을 때 에러가 발생한다.
    ColorChange(),
  ];

  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter 예제')),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Scaffold(
            body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wb_cloudy), label: 'Hello'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Star'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Color'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
