import 'dart:math';
import 'package:flutter/material.dart';
void main() => runApp(AnimatedContainerApp());
// 참고 : 해당 프로젝트에서 처음으로 실행하는 main.dart 파일이 아니라면 void main()은 실행되지 않는다.
class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}
class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  // 기본값으로 다양한 속성을 정의합니다.
  // 사용자가 FloatingActionButton을 누를 때 속성이 업데이트 됩니다.
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedContainer Demo'),
        ),
        body: Center(
          child: AnimatedContainer(
          // State 클래스에 저장된 속성을 사용합니다.
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
             // 애니메이션 소요 시간을 정의합니다.
            duration: Duration(seconds: 1),
            // 애니메이션을 부드럽게 만들기 위해 선택적 커브를 제공합니다.
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          // 사용자가 버튼을 탭하면
          onPressed: () {
            // setState를 사용하여 위젯을 새 값으로 다시 작성합니다.
            setState(() {
              //난수 생성기를 만듭니다.
              final random = Random();
              // 무작위 너비와 높이를 생성합니다.
              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();
              //임의의 색상을 생성합니다.
              _color = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1,
              );

              // 임의의 border 경계 반경을 생성합니다.
              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
        ),
      ),
    );
  }
}