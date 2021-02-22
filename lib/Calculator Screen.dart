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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        padding: EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    "GENDER",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
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
                    "Height",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "$_heightValue cm",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Slider(
                    value: _heightValue,
                    activeColor: Colors.white,
                    inactiveColor: Colors.red[50],
                    min: 0,
                    max: 200,
                    divisions: 200,
                    onChanged: (changeValue) {
                      setState(() {
                        _heightValue = changeValue;
                      });
                    },
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    "Weight",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "$_weightValue kg",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Slider(
                    value: _weightValue,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white,
                    min: 0,
                    max: 120,
                    divisions: 120,
                    onChanged: (changeValue) {
                      setState(() {
                        _weightValue = changeValue;
                      });
                    },
                  ),
                  SizedBox(height: 100.0),
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.only(left: 200),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: FlatButton(
                      onPressed: () {},
                      child: Icon(Icons.arrow_forward,
                          size: 50, color: Colors.red),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your BMI : ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      Text("The BMI Table",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Function definitions

  void calculateBMI() {
    _bmi = (_weightValue / ((_heightValue * _heightValue) / 10000));
    // return _bmi;
  }

  String Remarks(var _bmi) {
    if (_bmi >= 18.5 && _bmi <= 25) {
      comments = "You are Totaly Fit";
    } else if (_bmi < 18.5) {
      comments = "You are Underweighted";
    } else if (_bmi > 25 && _bmi <= 30) {
      comments = "You are Overweighted";
    } else {
      comments = "You are Obesed";
    }
    return comments;
  }

  Widget genderCard({String gender, bool isSelected}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.black45,
          borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.redAccent,
          ),
          Text(
            gender,
            style:
                TextStyle(color: isSelected ? Colors.redAccent : Colors.white),
          )
        ],
      ),
    );
  }
}
