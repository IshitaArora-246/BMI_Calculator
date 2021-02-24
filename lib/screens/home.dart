import 'package:BMI_Calculator/screens/infoScreen.dart';
import 'package:flutter/material.dart';

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
  double screenHeight;
  double screenWidth;
  num _heightValue = 0.0;
  num _weightValue = 0.0;
  bool isMale = true;
  double _bmi = 0;
  String comments = "";
  bool isCalculated = false;
  TextEditingController height = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black87, Colors.blueGrey])),
        padding: EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text("BMI CALCULATOR",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              wordSpacing: 5,
                              color: Colors.teal[300])),
                    ],
                  ),
                  SizedBox(height: 15.0),
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
                    activeColor: Colors.green[200],
                    inactiveColor: Colors.white,
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
                  SizedBox(height: 10.0),
                  Text(
                    "${_weightValue.toStringAsFixed(1)} kg",
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  Slider(
                    value: _weightValue,
                    activeColor: Colors.green[200],
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
                        calculateBMI();
                      },
                      child: Text("Calculate", style: TextStyle(fontSize: 22)),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  showText(),
                  SizedBox(height: 20.0),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoScreen()));
                      setState(() {
                        _heightValue = 0.0;
                        _weightValue = 0.0;
                        isCalculated = false;
                      });
                    },
                    child: Text(
                      "BMI Chart",
                      style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                          color: Colors.blue[900]),
                    ),
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

  Widget showText() {
    if (isCalculated) {
      return Column(children: [
        Text(
          "Your BMI : $_bmi",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 36),
        ),
        SizedBox(height: 10),
        Text(
          "$comments",
          style: TextStyle(
              color: Colors.tealAccent,
              fontWeight: FontWeight.w400,
              fontSize: 24),
        ),
      ]);
    } else {
      return Column(children: [
        Center(
          child: Text(
              "Body mass index (BMI) is a measure of body fat based on height and weight",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              )),
        ),
        SizedBox(height: 30),
        Center(
          child: Text(
              "* This calculator is not recomended for pregnant women and children",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 14,
              )),
        )
      ]);
    }
  }

  Widget genderCard({String gender, bool isSelected}) {
    return Container(
      height: screenHeight * 0.14,
      width: screenWidth * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isSelected
                  ? [Colors.teal[600], Colors.green[300]]
                  : [Colors.grey[600], Colors.grey[600]]),
          borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 15.0),
            if (gender == "Male")
              (Image.asset(
                "assets/male.png",
                width: 45,
                height: 45,
              ))
            else
              (Image.asset(
                "assets/female.png",
                width: 45,
                height: 45,
              )),
            SizedBox(height: 5.0),
            Text(
              ("$gender"),
              style: TextStyle(
                  color: isSelected ? Colors.black : Colors.grey[900],
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    isCalculated = true;
    setState(() {
      print("$_heightValue");
      print("$_weightValue");
      _bmi = (_weightValue / ((_heightValue * _heightValue) / 10000));

      var finalResult;

      _bmi = _bmi * 100;

      finalResult = _bmi.round();

      _bmi = finalResult / 100;

      debugPrint("$_bmi");

      if (_bmi >= 18.5 && _bmi <= 25) {
        comments = "You are Totally Fit!";
      } else if (_bmi < 18.5) {
        comments = "You are Underweight!";
      } else if (_bmi > 25 && _bmi <= 30) {
        comments = "You are Overweight!";
      } else {
        comments = "You are Obese!";
      }
    });
  }
}
