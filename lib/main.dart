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
  var selected = "Ruppees";
  @override
  Widget build(BuildContext context) {
    
  TextStyle textStyle = Theme.of(context).textTheme.title;
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: new ListView(padding: EdgeInsets.all(25.0), children: <Widget>[
        new Column(
          children: <Widget>[
            new Image(
              image: new AssetImage('images/currency.png'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: new TextField(
                style: textStyle,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
  
                    labelText: "Principal",
                    hintText: 'enter Principal e.g. 12000',
                    labelStyle: textStyle,
                    hintStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: new TextField(
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
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
              child: new Row(
                children: <Widget>[
                  Expanded(
                      child: new TextField(
                        style: textStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Duration',
                      hintText: 'Duration',
                      labelStyle: textStyle,
                      hintStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  )),
                  new Container(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Expanded(
                    child: new DropdownButton(
                      items: list.map((String value) {
                        return new DropdownMenuItem(
                          value: value,
                          child: Text(value, style: textStyle,),
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
                onPressed: () {},
                child: Text("Calculate", style: textStyle,),
              ),
            ),
            Expanded(
              child: new RaisedButton(
                color: Colors.black,
                padding: EdgeInsets.all(15.0),
                onPressed: () {},
                child: Text("Clear", style:textStyle),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
