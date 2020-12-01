import 'package:Converter/distance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String option_1 = "Kelvin";
  String option_2 = "Celsius";
  String input ;
  var input_control = TextEditingController();
  var output = TextEditingController();
  final pageoption = [MyApp(),TempApp()];
  void calc(){
    var res;
    if (input_control.text.isEmpty){
      setState(() {
        output.text = "0";
      });
    }
    else if (option_1=="Kelvin"&&option_2=="Kelvin"){
      res = int.parse(input);
      setState(() {
        output.text = res.toString();
      });

    }
    else if (option_1=="Kelvin"&&option_2=="Celsius"){
      res = int.parse(input)-273;
      setState(() {
        output.text = res.toString();
      });

    }else if (option_1=="Celsius"&&option_2=="Celsius"){
      res = int.parse(input);
      setState(() {
        output.text = res.toString();
      });

    }else if (option_1=="Celsius"&&option_2=="Kelvin"){
      res = int.parse(input)+273;
      setState(() {
        output.text = res.toString();
      });

    }else if (option_1=="Fahrenheit"&&option_2=="Fahrenheit"){
      res = int.parse(input);
      setState(() {
        output.text = res.toString();
      });

    }else if (option_1=="Fahrenheit"&&option_2=="Celsius"){
      res = ((double.parse(input)-32) * 5/9);
      if (res % 1 == 0){
        res = res.toInt();
      }
      setState(() {
        output.text = res.toString();
      });

    }else if (option_1=="Celsius"&&option_2=="Fahrenheit"){
      res = ((double.parse(input)*9/5)+32);
      if (res % 1 == 0){
        res = res.toInt();
      }
    }
      else if (option_1=="Fahrenheit"&& option_2=="Kelvin"){
        res = ((double.parse(input)-32)*5/9)+273;
        if (res % 1 == 0){
          res = res.toInt();
        }
      
      setState(() {
        output.text = res.toString();
      });

    }
  }

  Widget dropdownitem(String _text) {
    return DropdownMenuItem(
      value: _text,
      child: Center(child: Text("$_text")),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(icon: Icons.wb_sunny, title: 'Temperature'),
            TabItem(icon: Icons.directions_car_rounded, title: 'Distance'),
            TabItem(icon: Icons.square_foot, title: 'Area'),
            TabItem(icon: CupertinoIcons.question_circle_fill, title: 'About'),
          ],
          initialActiveIndex: 0,//optional, default as 0
          onTap: (int i){
            print(i);
            TempApp();
            setState(() {
              print(i);
              if (i == 1){Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => TempApp()
              ));}

            });
          },
        ),
      appBar: AppBar(
        title: Text('Temperature'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child:Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  border: Border.all(color: Colors.lightBlue),
                  borderRadius: BorderRadius.circular(7)
                ),

                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    iconEnabledColor: Colors.white,
                    isExpanded: false,
                    dropdownColor: Colors.lightBlueAccent,
                    onChanged: (_value) {
                      setState(() {
                        option_1 = _value;
                      });
                    },
                    items: [
                      dropdownitem("Kelvin"),
                      dropdownitem("Celsius"),
                      dropdownitem("Fahrenheit"),
                    ],
                    hint: Text("$option_1",style: TextStyle(color:Colors.white),),
              ),
            ),
          ),
          ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black54,
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: input_control,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: option_1
                  ),
                  onChanged: (val){
                    print(val);
                    setState(() {
                      input = val;
                      print(val);
                      calc();
                    });
                  },
                ),
              )
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child:Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    border: Border.all(color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(7)
                ),

                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    iconEnabledColor: Colors.white,
                    isExpanded: false,
                    dropdownColor: Colors.lightBlueAccent,
                    onChanged: (value) {
                      setState(() {
                        option_2 = value;
                      });
                    },
                    items: [
                      dropdownitem("Kelvin"),
                      dropdownitem("Celsius"),
                      dropdownitem("Fahrenheit"),
                    ],
                    hint: Text("$option_2",style: TextStyle(color:Colors.white),),
                ),
              ),
            ),
    ),
          ),
          Center(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black54,
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    controller: output,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: option_2
                    ),
                    onChanged: (val){
                      print(val);
                    },
                  ),
                )
            ),
          ),
        ],
      ),
      )
    );
  }
}
