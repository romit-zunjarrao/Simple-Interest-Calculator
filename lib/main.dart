import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Interest Calculator",
    home: new SIForm(),
    theme: ThemeData(
      accentColor: Colors.indigo,
      primaryColor: Colors.indigoAccent,
      brightness: Brightness.dark,
    ),
  ));
}

class SIForm extends StatefulWidget {
  @override
  SIFormState createState() {
    return new SIFormState();
  }
}

class SIFormState extends State<SIForm> {
  List<String> list = ['Ruppees', 'Dollar', 'Pounds', 'Others'];
  var selected;

  var formKey = GlobalKey<FormState>();

  TextEditingController principalController = new TextEditingController();
  TextEditingController roiController = new TextEditingController();
  TextEditingController durationController = new TextEditingController();
  String displayText = "";

  @override
  void initState() {
    super.initState();
    selected = list[0];
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
        key: formKey,
        child: new ListView(padding: EdgeInsets.all(25.0), children: <Widget>[
          new Column(
            children: <Widget>[
              new Image(
                image: new AssetImage('images/currency.png'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: new TextFormField(
                  style: textStyle,
                  controller: principalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Principal",
                      hintText: 'enter Principal e.g. 12000',
                      labelStyle: textStyle,
                      hintStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  validator: (String value) {
                    if (value.isEmpty) return "Please enter Principal Amount";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: new TextFormField(
                  controller: roiController,
                  style: textStyle,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Rate Of Interest',
                      hintText: 'in Percent ',
                      labelStyle: textStyle,
                      hintStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  validator: (String value) {
                    if (value.isEmpty) return "please enter Rate of interest";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: new TextFormField(
                      controller: durationController,
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Duration',
                        hintText: 'term',
                        labelStyle: textStyle,
                        hintStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) return "please enter a duration";
                      },
                    )),
                    new Container(
                      padding: EdgeInsets.all(10.0),
                    ),
                    Expanded(
                      child: new DropdownButton(
                        items: list.map((String value) {
                          return new DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: textStyle,
                            ),
                          );
                        }).toList(),
                        onChanged: (newSelected) {
                          selected = newSelected;
                          setState(() {});
                        },
                        value: selected,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: new Row(children: <Widget>[
              Expanded(
                child: new RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    setState(() {
                      if (formKey.currentState.validate()) {
                        calculateInterest();
                      }
                    });
                  },
                  child: Text(
                    "Calculate",
                    style: textStyle,
                  ),
                ),
              ),
              Expanded(
                child: new RaisedButton(
                  color: Colors.black,
                  padding: EdgeInsets.all(15.0),
                  onPressed: () {
                    setState(() {
                      reset();
                    });
                  },
                  child: Text("Clear", style: textStyle),
                ),
              ),
            ]),
          ),
          new Text(
            displayText,
            style: textStyle,
          ),
        ]),
      ),
    );
  }

  void calculateInterest() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double duration = double.parse(durationController.text);
    double pnr = principal + (principal * roi * duration) / 100;
    displayText = "Your simple interest Calculated in ${selected} is ${pnr}";
  }

  void reset() {
    principalController.text = "";
    roiController.text = "";
    durationController.text = "";
    displayText = "";
    selected = list[0];
  }
}
