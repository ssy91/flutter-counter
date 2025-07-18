import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Map info = {
    'appTitle': 'StatelessWidget Demo',
    'appBarTitle': 'Flutter Official Site',
    'titleImageLink':
        'http://storage.googleapis.com/cms-storage-bucket/2f118a9971e4ca6ad737.png',
    'titleSectionHeader': 'Flutter on Mobile',
    'titleSectionBody': 'http://flutter.dev/multi-platform/mobile',
    'titleSectionScore': 100,
    'textSection':
        'Bring tour app idea to more users from day one by building sith Flutter on iOS and Adnroid simultaneously, without sacrificing feature, quality, or performance. All mobile on day one: in both ecosysytems from a single codebase. One experience: Release simultaneously on iOS and Android with feature parity for the best experience for all users.',
  };

  Image _buildTitleImage(String imageName) {
    return Image.network(imageName, width: 600, height: 240, fit: BoxFit.cover);
  }

  Container _buildTitleSection(String name, String addr, int count) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(addr, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          const Counter(),
        ],
      ),
    );
  }

  Widget _buildButtonSection(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.assistant_navigation, 'Visit'),
        _buildButtonColumn(color, Icons.add_alert_sharp, 'Alarm'),
        _buildButtonColumn(color, Icons.share, 'Share'),
      ],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ColorChanger(color: color, icon: icon, label: label)],
    );
  }

  Container _buildTextSection(String section) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        section,
        softWrap: true,
        textAlign: TextAlign.justify,
        style: const TextStyle(height: 1.5, fontSize: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleImage = _buildTitleImage(info['titleImageLink']);
    Widget textSection = _buildTextSection(info['textSection']);
    // 다크 테마 / 화이트 테마
    Widget buttonSection = _buildButtonSection(Theme.of(context).primaryColor);
    Widget titleSection = _buildTitleSection(
      info['titleSectionHeader'],
      info['titleSectionBody'],
      info['titleSectionScore'],
    );

    return MaterialApp(
      title: info['appTitle'],
      home: Scaffold(
        appBar: AppBar(title: Text(info['appBarTitle'])),
        body: ListView(
          children: [titleImage, titleSection, buttonSection, textSection],
        ),
      ),
    );
  }
}

class ColorChanger extends StatefulWidget {
  // 생성자(얘가 어떤 역할을 하는지 key 로 구분하는 용도. 굳이 작성 안해도 됨)
  ColorChanger({
    super.key,
    required Color color,
    required IconData icon,
    required String label,
  }) {
    inputColor = color;
    inputIcon = icon;
    inputLabel = label;
  }

  late Color inputColor;
  late IconData inputIcon;
  late String inputLabel;

  @override
  State<ColorChanger> createState() =>
      ColorState(color: inputColor, icon: inputIcon, label: inputLabel);
}

class ColorState extends State<ColorChanger> {
  ColorState({
    required Color color,
    required IconData icon,
    required String label,
  }) {
    _statusColor = color;
    _icon = icon;
    _label = label;
  }

  //
  // 사용자가 이 아이콘을 눌렀는지에 대한 상태를 저장하는 변수
  bool _boolStatus = false;
  // 현재 상태에 따른 변경될 아이콘의 색에 대한 상태를 저장하는 변수
  Color _statusColor = Colors.deepPurpleAccent;
  late IconData _icon;
  late String _label;

  // 실제로 State 에 저장된 상태를 변경해줄 수 있는 함수
  // = 사용자가 아이콘 버튼을 눌렀을 때 동작할 함수
  void _buttonPressed() {
    // State 를 변경하는 코드 작성
    setState(() {
      if (_boolStatus == true) {
        _boolStatus = false;
        _statusColor = Colors.deepPurpleAccent;
      } else {
        _boolStatus = true;
        _statusColor = Colors.orange;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(_icon),
          color: _statusColor,
          onPressed: _buttonPressed,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            _label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: _statusColor,
            ),
          ),
        ),
      ],
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
  int _counter = 0;
  bool _boolStatus = false;
  Color _statusColor = Colors.black;

  void _buttonPressed() {
    setState(() {
      if (_boolStatus == true) {
        _boolStatus = false;
        _counter--;
        _statusColor = Colors.black;
      } else {
        _boolStatus = true;
        _counter++;
        _statusColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.star),
          color: _statusColor,
          onPressed: _buttonPressed,
        ),
        Text('$_counter'),
      ],
    );
  }
}
