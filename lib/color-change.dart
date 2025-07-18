import 'package:flutter/material.dart';

void main() {
  runApp(ColorChange());
}

class ColorChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Container() -> 빈 박스
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 100, height: 100, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.orange),
              Container(width: 100, height: 100, color: Colors.yellow),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 100, color: Colors.lightBlueAccent),
              Container(width: 100, height: 100, color: Colors.blueAccent),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 100, height: 100, color: Colors.purple),
              Container(width: 100, height: 100, color: Colors.grey),
              Container(width: 100, height: 100, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}
