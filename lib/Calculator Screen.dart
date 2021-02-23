import 'package:flutter/material.dart';
import 'package:BMI_Calculator/main.dart';

//Creating stateful widget
class BmiCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BmiCalculator();
  }
}

//State definition
class _BmiCalculator extends State<BmiCalculator> {
  //Declaration of variables
  num _heightValue = 0.0;
  num _weightValue = 0.0;
  bool isMale = true;
  double _bmi = 0;
  String comments = "";
  bool isCalculated = false;
  TextEditingController height = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black87, Colors.blueGrey[700]])),
        // color: Colors.black87,
        padding: EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text("BMI CALCULATOR",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Colors.teal)),
                    SizedBox(height: 20.0),
                    Text(
                      "GENDER",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            if (!isMale)
                              setState(() {
                                isMale = true;
                              });
                          },
                          child: genderCard(gender: "Male", isSelected: isMale),
                        ),
                        InkWell(
                          onTap: () {
                            if (isMale)
                              setState(() {
                                isMale = false;
                              });
                          },
                          child:
                              genderCard(gender: "Female", isSelected: !isMale),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.0),
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "${_heightValue.toStringAsFixed(1)} cm",
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                    Slider(
                      value: _heightValue,
                      activeColor: Colors.white,
                      inactiveColor: Colors.red[50],
                      // label: _heightValue.toString(),
                      min: 0,
                      max: 200,
                      divisions: 400,
                      onChanged: (changeValue) {
                        setState(() {
                          _heightValue = changeValue;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "WEIGHT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "${_weightValue.toStringAsFixed(1)} kg",
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                    Slider(
                      value: _weightValue,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white,
                      min: 0,
                      max: 120,
                      divisions: 240,
                      onChanged: (changeValue) {
                        setState(() {
                          _weightValue = changeValue;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 55,
                      width: 170,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.teal[600], Colors.green[300]]),
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          isCalculated = true;
                          setState(() {
                            print("$_heightValue");
                            print("$_weightValue");
                            _bmi = (_weightValue /
                                ((_heightValue * _heightValue) / 10000));

                            var finalResult;

                            _bmi = _bmi * 100;

                            finalResult = _bmi.round();

                            _bmi = finalResult / 100;

                            debugPrint("$_bmi");

                            if (_bmi >= 18.5 && _bmi <= 25) {
                              comments = "You are Totally Fit!";
                            } else if (_bmi < 18.5) {
                              comments = "You are Underweighted!";
                            } else if (_bmi > 25 && _bmi <= 30) {
                              comments = "You are Overweighted!";
                            } else {
                              comments = "You are Obesed!";
                            }
                          });
                        },
                        child:
                            Text("Calculate", style: TextStyle(fontSize: 22)),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Text(
                      "Your BMI : $_bmi",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 36),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "$comments",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w300,
                          fontSize: 24),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Function definitions

  Widget genderCard({String gender, bool isSelected}) {
    return Container(
      height: 150,
      width: 170,
      padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isSelected
                  ? [Colors.teal[600], Colors.green[300]]
                  : [Colors.black, Colors.black]),
          borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 25.0),
            isSelected
                ? Image.asset(
                    "assets/male.png",
                    width: 45,
                    height: 45,
                  )
                : Image.asset(
                    "assets/female.png",
                    width: 45,
                    height: 45,
                  ),
            SizedBox(height: 5.0),
            Text(
              ("   $gender"),
              style: TextStyle(
                  color: isSelected ? Colors.black : Colors.white,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
