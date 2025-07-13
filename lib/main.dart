import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'app_body.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 建立appTitle物件
    var appTitle = const Text(
      'Calculator',
    );
    var appBody = const AppBody();
    final TextEditingController myController = new TextEditingController();

    var input = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              '本金：',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Expanded(  // 讓 TextField 占滿剩餘空間
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0),  // 加點間距
                child: TextField(
                  controller: myController,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFC3CCDD),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // 邊框圓角
                      borderSide: const BorderSide(color: Colors.white, width: 1), // 邊框樣式
                    ),
                  ),
                  onChanged: (String value) {
                    // log("${value}");
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            const Text(
              '年利率：',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0),  // 加點間距
                child: TextField(
                  controller: myController,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFC3CCDD),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // 邊框圓角
                      borderSide: const BorderSide(color: Colors.white, width: 1), // 邊框樣式
                    ),
                  ),
                  onChanged: (String value) {
                    //log("${value}");
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            const Text(
              '年期：',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0),  // 加點間距
                child: TextField(
                  controller: myController,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFC3CCDD),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // 邊框圓角
                      borderSide: const BorderSide(color: Colors.white, width: 1), // 邊框樣式
                    ),
                  ),
                  onChanged: (String value) {
                    //log("${value}");
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6A7D9F),
                padding: const EdgeInsets.symmetric(vertical:10, horizontal: 65),
                elevation: 4,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '計算',
                style: TextStyle(fontSize: 20, color: Colors.white,),
              ),
              onPressed: () {
                // 按下按鈕要執行的程式碼
              },
            ),
            const SizedBox(width: 12,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6A7D9F),
                padding: const EdgeInsets.symmetric(vertical:10, horizontal: 65),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '清空',
                style: TextStyle(fontSize: 20, color: Colors.white,),
              ),
              onPressed: () {
                // 按下按鈕要執行的程式碼
              },
            ),
          ]
        )
      ],
    );

    // 計算機的數字按鈕部分
    var calculator = Column(
      //mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7E98BA),
                padding: const EdgeInsets.symmetric(vertical:18, horizontal: 40),
                //elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '7',
                style: TextStyle(fontSize: 48, color: Colors.white,),
              ),
              onPressed: () {
              // 按下按鈕要執行的程式碼
              },
            ),
            const SizedBox(width: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7E98BA),
                padding: const EdgeInsets.symmetric(vertical:18, horizontal: 40),
                //elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '8',
                style: TextStyle(fontSize: 48, color: Colors.white,),
              ),
              onPressed: () {
                // 按下按鈕要執行的程式碼
              },
            ),
            const SizedBox(width: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7E98BA),
                padding: const EdgeInsets.symmetric(vertical:18, horizontal: 40),
                //elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '9',
                style: TextStyle(fontSize: 48, color: Colors.white,),
              ),
              onPressed: () {
                // 按下按鈕要執行的程式碼
              },
            ),
          ]
        ),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7E98BA),
                padding: const EdgeInsets.symmetric(vertical:18, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '4',
                style: TextStyle(fontSize: 48, color: Colors.white,),
              ),
              onPressed: () {
                // 按下按鈕要執行的程式碼
              },
            ),
            const SizedBox(width: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7E98BA),
                padding: const EdgeInsets.symmetric(vertical:18, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '5',
                style: TextStyle(fontSize: 48, color: Colors.white,),
              ),
              onPressed: () {
                // 按下按鈕要執行的程式碼
              },
            ),
            const SizedBox(width: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7E98BA),
                padding: const EdgeInsets.symmetric(vertical:18, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '6',
                style: TextStyle(fontSize: 48, color: Colors.white,),
              ),
              onPressed: () {
                // 按下按鈕要執行的程式碼
              },
            ),
          ]
        ),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7E98BA),
                padding: const EdgeInsets.symmetric(vertical:18, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '1',
                style: TextStyle(fontSize: 48, color: Colors.white,),
              ),
              onPressed: () {
                // 按下按鈕要執行的程式碼
              },
            ),
            const SizedBox(width: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7E98BA),
                padding: const EdgeInsets.symmetric(vertical:18, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '2',
                style: TextStyle(fontSize: 48, color: Colors.white,),
              ),
              onPressed: () {
                // 按下按鈕要執行的程式碼
              },
            ),
            const SizedBox(width: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7E98BA),
                padding: const EdgeInsets.symmetric(vertical:18, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '3',
                style: TextStyle(fontSize: 48, color: Colors.white,),
              ),
              onPressed: () {
                // 按下按鈕要執行的程式碼
              },
            ),
          ]
        ),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7E98BA),
                padding: const EdgeInsets.symmetric(vertical:18, horizontal: 101),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '0',
                style: TextStyle(fontSize: 48, color: Colors.white,),
              ),
              onPressed: () {
              // 按下按鈕要執行的程式碼
              },
            ),
            const SizedBox(width: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7E98BA),
                padding: const EdgeInsets.symmetric(vertical:18, horizontal: 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '.',
                style: TextStyle(fontSize: 48, color: Colors.white,),
              ),
              onPressed: () {
                // 按下按鈕要執行的程式碼
              },
            ),
          ],
        ),
      ],
    );

    // 建立appBody物件
    /*var appBody = Container(
      padding: EdgeInsets.fromLTRB(25, 15, 25, 0),  // 設定頁面間距（左，上，右，下）
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          input,
          const SizedBox(height: 25,),
          calculator,
        ],
      )
    );*/

    // 建立appBar物件
    var appBar = AppBar(
      title: Text('Calculator', style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),),
      backgroundColor: Color(0xFF7d7478),
      //elevation: 10,
    );

    // 建立app物件
    var app = MaterialApp(
      home: Scaffold(
        appBar: appBar,
        body: appBody,
      ),
    );

    return app;
  }

}
