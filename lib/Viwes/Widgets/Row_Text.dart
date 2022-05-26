import 'package:flutter/material.dart';

class RowText extends StatefulWidget {
  bool Selectbox1 = false;
  bool Selectbox2 = false;
  String text;
  static var countt = 0;
  static var countf = 0;


  dynamic FunctionIf() {
    if (Selectbox1 == true &&Selectbox2==false) {
      RowText.countt = RowText.countt + 1;
      ((RowText.countf >= 1))
          ?RowText.countf = RowText.countf - 1
          : "";
    }
    else if (Selectbox2 == true &&Selectbox1==false) {
      RowText.countf = RowText.countf + 1;
      ((RowText.countt >= 1))
          ?RowText.countt= RowText.countt - 1
          : "";

    }
  }

  dynamic FunctionIf2() {
    if (Selectbox1 == false && Selectbox2 == false) {
      (RowText.countt >= 1)
          ?RowText.countt= RowText.countt - 1
          : "";
    }

  }

  dynamic FunctionIf3() {
    if (Selectbox1 == false && Selectbox2 == false) {
      (RowText.countf >= 1)
          ?RowText.countf= RowText.countf - 1
          : "";
    }
  }

  RowText(
      {required this.Selectbox1, required this.Selectbox2, required this.text});

  @override
  _RowTextState createState() => _RowTextState();
}

class _RowTextState extends State<RowText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Container(
          height: 200,
          width: 200,
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: TextStyle(
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          children: [
            Text("T", style: TextStyle(fontWeight: FontWeight.bold)),
            Checkbox(
              value: widget.Selectbox1,
              activeColor: Colors.lightGreen,
              onChanged: ( value) {
                setState(() {
                  widget.Selectbox1 = !widget.Selectbox1;
                  widget.Selectbox2 = false;

                  widget.FunctionIf();
                  widget.FunctionIf2();
                  print("true=${RowText.countt}");
                  print("false=${RowText.countf}");
                });
              },
            ),
          ],
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          children: [
            Text(
              "F",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Checkbox(
              value: widget.Selectbox2,
              activeColor: Colors.lightGreen,
              onChanged: (value) {
                setState(() {
                  widget.Selectbox2 = !widget.Selectbox2;
                  widget.Selectbox1 = false;

                  widget.FunctionIf();
                  widget.FunctionIf3();
                  print("true=${RowText.countt}");
                  print("false=${RowText.countf}");
                });
              },
            ),
          ],
        ),
        ],
    );
  }
}
