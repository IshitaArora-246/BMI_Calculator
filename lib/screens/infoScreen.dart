import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({Key key}) : super(key: key);

  final List<String> facts = [
    "BMI has been used to give an idea about whether people are overweight or underweight for over 100 years.",
    "A BMI of between 18.5 and 24.99 is considered healthy, but some people are healthy with other BMIs.",
    "At the same BMI, women tend to have more body fat than men.",
    "At the same BMI, older people, on average, tend to have more body fat than younger adults.",
    "At the same BMI, athletes have less body fat than do non-athletes.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black87, Colors.blueGrey])),
        padding: EdgeInsets.only(top: 15.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: Colors.tealAccent, size: 35),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Text("Facts about BMI",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Column(
                children: List.generate(
                    facts.length, (index) => listItems(facts[index])),
              ),
              SizedBox(height: 20.0),
              Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Image.asset("assets/chart.jpg")),
            ]),
          ),
        ),
      ),
    );
  }

  Widget listItems(String fact) {
    return Column(
      children: [
        ListTile(
            leading: Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
            title: Text("$fact",
                style: TextStyle(fontSize: 18, color: Colors.white))),
        SizedBox(height: 15.0),
      ],
    );
  }
}
