import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/components/calculator_brain.dart';

class ResultScreen extends StatelessWidget {
  String bmiState;
  String bmiDescription;
  String bmiResult;
  ResultScreen(
      {required this.bmiResult,
      required this.bmiState,
      required this.bmiDescription});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(25.0, 15.0, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Result:',
                style: kResultTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    textAlign: TextAlign.center,
                    bmiState,
                    style: kBmiStateTextStyle,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    bmiResult.toString(),
                    style: kBmiTextStyle,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    bmiDescription,
                    style: kDescriptionTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              title: 'RE-CALCULATE!',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
