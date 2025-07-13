import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {
    final body = _DropdownWidget();

    final widget = Container(
      padding: EdgeInsets.fromLTRB(25, 15, 25, 0),  // 設定頁面間距（左，上，右，下）
      color: Color(0xffede8ea),
      child: body
    );

    return widget;
  }
}

class _DropdownWidget extends StatefulWidget {
  const _DropdownWidget({super.key});

  @override
  State<StatefulWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<_DropdownWidget> {
  int? selectedValue = 1;

  // 建立三個 FocusNode 跟 Controller
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appBody = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _dropdownbtn(),
        const SizedBox(height: 10,),
        _inputContent(),
        const SizedBox(height: 15,),
        _calculateButton(),
        const SizedBox(height: 15,),
        _numbersButton(),
      ],
    );
    return appBody;
  }

  Widget _dropdownbtn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
            '功能：',
            style: TextStyle(
              fontSize: 18,
            )
        ),
        DropdownButton(
          items: const <DropdownMenuItem>[
            DropdownMenuItem(
              value: 1,
              child: Text('複利計算機', style: TextStyle(fontSize: 18),),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text(
                '借款還款試算計算機', style: TextStyle(fontSize: 18),),
            ),
          ],
          onChanged: (dynamic value) {
            setState(() {
              selectedValue = value as int;
            });
          },
          hint: const Text('計算機功能', style: TextStyle(fontSize: 18),),
          value: selectedValue,
          dropdownColor: Colors.white,
          // 下拉選單背景顏色
          borderRadius: BorderRadius.circular(12),
          // 下拉選單圓角
          underline: Container(
            height: 2,
            color: Color(0xFF333333), // 下拉選單底線顏色
          ),
          //isExpanded: true,
        ),
      ],
    );
  }

  Widget _inputContent() {
    final TextEditingController myController = new TextEditingController();
    switch (selectedValue) {
      case 1:
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '本金：',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Expanded( // 讓 TextField 占滿剩餘空間
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 4.0),
                    // 加點間距
                    child: TextField(
                      focusNode: _focusNode1,
                      controller: _controller1,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      // 僅允許整數
                      maxLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        isDense: true,
                        // 緊湊模式，讓高度變小
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        // 調整內邊距
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12), // 邊框圓角
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1), // 邊框樣式
                        ),
                      ),
                      onChanged: (String value) {
                        // log("${value}");
                      },
                    ),
                  ),
                ),
                const Text(
                  '元',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '月利率：',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Expanded( // 讓 TextField 占滿剩餘空間
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 4.0),
                    // 加點間距
                    child: TextField(
                      focusNode: _focusNode2,
                      controller: _controller2,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,3}')),
                      ],
                      // 僅允許浮點數，小數點後最多三位
                      maxLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        isDense: true,
                        // 緊湊模式，讓高度變小
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        // 調整內邊距
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12), // 邊框圓角
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1), // 邊框樣式
                        ),
                      ),
                      onChanged: (String value) {
                        // log("${value}");
                      },
                    ),
                  ),
                ),
                const Text(
                  '%',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  '期數：',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Expanded( // 讓 TextField 占滿剩餘空間
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 4.0),
                    // 加點間距
                    child: TextField(
                      focusNode: _focusNode3,
                      controller: _controller3,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      // 僅允許整數
                      maxLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        isDense: true,
                        // 緊湊模式，讓高度變小
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        // 調整內邊距
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12), // 邊框圓角
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1), // 邊框樣式
                        ),
                      ),
                      onChanged: (String value) {
                        // log("${value}");
                      },
                    ),
                  ),
                ),
                const Text(
                  '月',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        );
      case 2:
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '借貸金額：',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Expanded( // 讓 TextField 占滿剩餘空間
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 4.0),
                    // 加點間距
                    child: TextField(
                      focusNode: _focusNode1,
                      controller: _controller1,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      // 僅允許整數
                      maxLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        isDense: true,
                        // 緊湊模式，讓高度變小
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        // 調整內邊距
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12), // 邊框圓角
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1), // 邊框樣式
                        ),
                      ),
                      onChanged: (String value) {
                        // log("${value}");
                      },
                    ),
                  ),
                ),
                const Text(
                  '元',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '月利率：',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Expanded( // 讓 TextField 占滿剩餘空間
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 4.0),
                    // 加點間距
                    child: TextField(
                      focusNode: _focusNode2,
                      controller: _controller2,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,3}')),
                      ],
                      // 僅允許浮點數，小數點後最多三位
                      maxLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        isDense: true,
                        // 緊湊模式，讓高度變小
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        // 調整內邊距
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12), // 邊框圓角
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1), // 邊框樣式
                        ),
                      ),
                      onChanged: (String value) {
                        // log("${value}");
                      },
                    ),
                  ),
                ),
                const Text(
                  '%',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 12,),
                const Text(
                  '借款期數：',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Expanded( // 讓 TextField 占滿剩餘空間
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0, right: 4.0),
                    // 加點間距
                    child: TextField(
                      focusNode: _focusNode3,
                      controller: _controller3,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      // 僅允許整數
                      maxLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        isDense: true,
                        // 緊湊模式，讓高度變小
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        // 調整內邊距
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12), // 邊框圓角
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1), // 邊框樣式
                        ),
                      ),
                      onChanged: (String value) {
                        // log("${value}");
                      },
                    ),
                  ),
                ),
                const Text(
                  '月',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        );
      default:
        return const Text('👆 請先選擇一個選項');
    }
  }

  String _result = '';
  Widget _calculateButton() {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7d7478),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 65),
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
                  if (_controller1.text.isNotEmpty && _controller2.text.isNotEmpty && _controller3.text.isNotEmpty) {
                    int principal = int.parse(_controller1.text);
                    double rate = double.parse(_controller2.text);
                    int periods = int.parse(_controller3.text);

                    switch (selectedValue) {
                      case 1:
                        double finalAmount = principal.toDouble();
                        for (int i = 0; i < periods; i++) {
                          finalAmount = finalAmount + (finalAmount * (rate / 100));
                        }
                        // 更新結果顯示
                        setState(() {
                          _result = "總金額：${finalAmount.toStringAsFixed(2)} 元";
                        });
                        return;
                      case 2:
                        double finalAmount = principal.toDouble();
                        for (int i = 0; i < periods; i++) {
                          finalAmount = finalAmount + (finalAmount * (rate / 100));
                        }
                        finalAmount /= periods;
                        // 更新結果顯示
                        setState(() {
                          _result = "每月償還金額：${finalAmount.toStringAsFixed(2)} 元";
                        });
                    }

                  } else {
                    Fluttertoast.showToast(
                      msg: "以上欄位不得空白",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black45,
                      textColor: Colors.white,
                      fontSize: 20.0,
                    );
                  }
                },
              ),
              const SizedBox(width: 12,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7d7478),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 65),
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
                  setState(() {
                    _controller1.text = '';
                    _controller2.text = '';
                    _controller3.text = '';
                    _result = '';
                  });
                },
              ),
            ]
        ),
        _result.isNotEmpty
          ? Column(
              children: [
                const SizedBox(height: 15,),
                Text(
                  _result,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5,),
              ],
            )
          : const SizedBox(height: 10,),

      ],
    );
  }


  // 數字按鍵，按下按鈕可輸入
  Widget _numbersButton() {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC0A9B0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 40),
                  //elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // 設定圓角弧度
                  ),
                ),
                child: const Text(
                  '7',
                  style: TextStyle(fontSize: 48, color: Colors.white,),
                ),
                onPressed: () {
                  if (_focusNode1.hasFocus) {
                    _controller1.text += '7';
                  } else if (_focusNode2.hasFocus) {
                    _controller2.text += '7';
                  } else if (_focusNode3.hasFocus) {
                    _controller3.text += '7';
                  }
                },
              ),
              const SizedBox(width: 15,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC0A9B0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 40),
                  //elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // 設定圓角弧度
                  ),
                ),
                child: const Text(
                  '8',
                  style: TextStyle(fontSize: 48, color: Colors.white,),
                ),
                onPressed: () {
                  if (_focusNode1.hasFocus) {
                    _controller1.text += '8';
                  } else if (_focusNode2.hasFocus) {
                    _controller2.text += '8';
                  } else if (_focusNode3.hasFocus) {
                    _controller3.text += '8';
                  }
                },
              ),
              const SizedBox(width: 15,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC0A9B0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 40),
                  //elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // 設定圓角弧度
                  ),
                ),
                child: const Text(
                  '9',
                  style: TextStyle(fontSize: 48, color: Colors.white,),
                ),
                onPressed: () {
                  if (_focusNode1.hasFocus) {
                    _controller1.text += '9';
                  } else if (_focusNode2.hasFocus) {
                    _controller2.text += '9';
                  } else if (_focusNode3.hasFocus) {
                    _controller3.text += '9';
                  }
                },
              ),
            ]
        ),
        const SizedBox(height: 10,),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC0A9B0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 40),
                  //elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // 設定圓角弧度
                  ),
                ),
                child: const Text(
                  '4',
                  style: TextStyle(fontSize: 48, color: Colors.white,),
                ),
                onPressed: () {
                  if (_focusNode1.hasFocus) {
                    _controller1.text += '4';
                  } else if (_focusNode2.hasFocus) {
                    _controller2.text += '4';
                  } else if (_focusNode3.hasFocus) {
                    _controller3.text += '4';
                  }
                },
              ),
              const SizedBox(width: 15,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC0A9B0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 40),
                  //elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // 設定圓角弧度
                  ),
                ),
                child: const Text(
                  '5',
                  style: TextStyle(fontSize: 48, color: Colors.white,),
                ),
                onPressed: () {
                  if (_focusNode1.hasFocus) {
                    _controller1.text += '5';
                  } else if (_focusNode2.hasFocus) {
                    _controller2.text += '5';
                  } else if (_focusNode3.hasFocus) {
                    _controller3.text += '5';
                  }
                },
              ),
              const SizedBox(width: 15,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC0A9B0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 40),
                  //elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // 設定圓角弧度
                  ),
                ),
                child: const Text(
                  '6',
                  style: TextStyle(fontSize: 48, color: Colors.white,),
                ),
                onPressed: () {
                  if (_focusNode1.hasFocus) {
                    _controller1.text += '6';
                  } else if (_focusNode2.hasFocus) {
                    _controller2.text += '6';
                  } else if (_focusNode3.hasFocus) {
                    _controller3.text += '6';
                  }
                },
              ),
            ]
        ),
        const SizedBox(height: 10,),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC0A9B0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 40),
                  //elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // 設定圓角弧度
                  ),
                ),
                child: const Text(
                  '1',
                  style: TextStyle(fontSize: 48, color: Colors.white,),
                ),
                onPressed: () {
                  if (_focusNode1.hasFocus) {
                    _controller1.text += '1';
                  } else if (_focusNode2.hasFocus) {
                    _controller2.text += '1';
                  } else if (_focusNode3.hasFocus) {
                    _controller3.text += '1';
                  }
                },
              ),
              const SizedBox(width: 15,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC0A9B0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 40),
                  //elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // 設定圓角弧度
                  ),
                ),
                child: const Text(
                  '2',
                  style: TextStyle(fontSize: 48, color: Colors.white,),
                ),
                onPressed: () {
                  if (_focusNode1.hasFocus) {
                    _controller1.text += '2';
                  } else if (_focusNode2.hasFocus) {
                    _controller2.text += '2';
                  } else if (_focusNode3.hasFocus) {
                    _controller3.text += '2';
                  }
                },
              ),
              const SizedBox(width: 15,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC0A9B0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 40),
                  //elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // 設定圓角弧度
                  ),
                ),
                child: const Text(
                  '3',
                  style: TextStyle(fontSize: 48, color: Colors.white,),
                ),
                onPressed: () {
                  if (_focusNode1.hasFocus) {
                    _controller1.text += '3';
                  } else if (_focusNode2.hasFocus) {
                    _controller2.text += '3';
                  } else if (_focusNode3.hasFocus) {
                    _controller3.text += '3';
                  }
                },
              ),
            ]
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFC0A9B0),
                padding: const EdgeInsets.symmetric(
                    vertical: 18, horizontal: 40),
                //elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '0',
                style: TextStyle(fontSize: 48, color: Colors.white,),
              ),
              onPressed: () {
                String currentText = '';
                TextEditingController? controller;

                // 判斷哪個欄位有焦點，並取得對應的 Controller
                if (_focusNode1.hasFocus) {
                  controller = _controller1;
                  currentText = _controller1.text;
                } else if (_focusNode2.hasFocus) {
                  controller = _controller2;
                  currentText = _controller2.text;
                } else if (_focusNode3.hasFocus) {
                  controller = _controller3;
                  currentText = _controller3.text;
                }

                // 如果沒有焦點，直接 return
                if (controller == null) return;
                // 本金和期數：整數處理
                if (controller == _controller1 || controller == _controller3) {
                  // 如果目前值為 0 就不要再加 "0"
                  if ((int.parse(currentText) != 0)) {
                    controller.text += '0';
                  }
                }
                // 月利率：浮點數處理
                if (controller == _controller2) {
                  // 避免多個 "0" 在最前面
                  if (currentText == "0") return;
                  controller.text += '0';
                }
              },
            ),
            const SizedBox(width: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFC0A9B0),
                padding: const EdgeInsets.symmetric(
                    vertical: 18, horizontal: 47),
                //elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100), // 設定圓角弧度
                ),
              ),
              child: const Text(
                '.',
                style: TextStyle(fontSize: 48, color: Colors.white,),
              ),
              onPressed: () {
                if (_focusNode2.hasFocus && !_controller2.text.contains('.')) {
                  _controller2.text += '.';
                }
              },
            ),
            const SizedBox(width: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFC0A9B0),
                padding: const EdgeInsets.symmetric(
                    vertical: 32, horizontal: 32),
                //elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100), // 設定圓角弧度
                ),
              ),
              child: const Icon(
                  Icons.keyboard_backspace, color: Colors.white, size: 40),
              // 只顯示圖示
              onPressed: () {
                if (_focusNode1.hasFocus && _controller1.text.isNotEmpty) {
                  _controller1.text = _controller1.text.substring(
                      0, _controller1.text.length - 1);
                } else if (_focusNode2.hasFocus) {
                  _controller2.text = _controller2.text.substring(
                      0, _controller2.text.length - 1);
                } else if (_focusNode3.hasFocus) {
                  _controller3.text = _controller3.text.substring(
                      0, _controller3.text.length - 1);
                }
              },
            ),
          ],
        ),
      ],
    );
  }

// TextField Focus Event
  @override
  void initState() {
    super.initState();
    // 監聽焦點變更事件
    _focusNode1.addListener(_handleFocusChange);
    _focusNode2.addListener(_handleFocusChange);
    _focusNode3.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    // 清除監聽事件
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      if (_focusNode1.hasFocus) {
        _focusNode2.unfocus();
        _focusNode3.unfocus();
      } else if (_focusNode2.hasFocus) {
        _focusNode1.unfocus();
        _focusNode3.unfocus();
      } else if (_focusNode3.hasFocus) {
        _focusNode1.unfocus();
        _focusNode2.unfocus();
      }
    });
  }
}