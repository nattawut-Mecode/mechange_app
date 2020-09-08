import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/themes.dart';
import 'country_dropdown.dart';

class CalculatorBottomSheet extends StatefulWidget {
  final String form;
  final String to;

  const CalculatorBottomSheet({Key key, this.form, this.to});

  @override
  _CalculatorBottomSheetState createState() => _CalculatorBottomSheetState();
}

class _CalculatorBottomSheetState extends State<CalculatorBottomSheet>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  String fromDropDownValue;
  String toDropDownValue;
  var _listCountry = <String>[
    "USD",
    "JPY",
    "IDR",
    "PHP",
    "RUB",
  ];

  TextEditingController amountTextControl = new TextEditingController(text: "");

  void calculateClick() {}

  Widget calculatorButton() {
    return Container(
      width: 110,
      height: 50,
      margin: const EdgeInsets.only(left: 12),
      child: RaisedButton(
        onPressed: amountTextControl.text.trim() != "" ? calculateClick : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          "Calculate",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        color: Colors.green,
        disabledColor: ThemeApp.disableColor,
      ),
    );
  }

  Widget textFieldAmout() {
    return Container(
      width: 165,
      height: 50,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: TextField(
          controller: amountTextControl,
          keyboardType: TextInputType.number,
          onTap: () {
            print("On Tap Amount");
          },
          style: TextStyle(fontSize: 14, fontFamily: "Lato"),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Amount (" + widget.form + ")",
          ),
        ),
      ),
    );
  }

  Widget toDropDownLanguage() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 10, bottom: 5),
            child: Text(
              "TO",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 135,
            height: 45,
            margin: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: Center(
              child: DropdownButton<String>(
                value: toDropDownValue,
                icon: Icon(Icons.arrow_drop_down, size: 30),
                iconSize: 24,
                elevation: 16,
                underline: Container(),
                onChanged: (newValue) {
                  setState(() {
                    toDropDownValue = newValue;
                  });
                },
                items:
                    _listCountry.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: CountryDropDownItem(
                      shortCurrency: value,
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget fromDropDownLanguage() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 37.5, bottom: 5),
            child: Text(
              "FROM",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 135,
            height: 45,
            margin: const EdgeInsets.only(left: 37.5),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(7.5)),
            child: Center(
              child: DropdownButton<String>(
                value: fromDropDownValue,
                icon: Icon(Icons.arrow_drop_down, size: 30),
                iconSize: 24,
                elevation: 16,
                underline: Container(),
                onChanged: (newValue) {
                  setState(() {
                    fromDropDownValue = newValue;
                  });
                },
                items:
                    _listCountry.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: CountryDropDownItem(
                      shortCurrency: value,
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    fromDropDownValue = widget.form;
    toDropDownValue = widget.to;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: ThemeApp.primaryColor));
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
          color: ThemeApp.primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          boxShadow: [
            BoxShadow(blurRadius: 6, color: Colors.black.withOpacity(0.6))
          ]),
      child: Column(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(top: 19),
              child: Text("Calculator",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline))),
          Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text("X.XXXX " + widget.to,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato"))),
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: Row(
              children: <Widget>[fromDropDownLanguage(), toDropDownLanguage()],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 39, top: 11),
            child: Row(
              children: <Widget>[textFieldAmout(), calculatorButton()],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
