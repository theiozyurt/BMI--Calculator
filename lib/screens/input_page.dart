import 'package:bmi_calculator/components/calculator_brain.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_includes.dart';
import '../components/reusable_card.dart';
import '../components/constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';

enum Genders {
  male,
  female,
}

enum operation {
  add,
  minus,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  Genders? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  void weightChanger(operation chosedOperation) {
    if (chosedOperation == operation.add) {
      weight < 200 ? weight += 1 : weight;
    }
    if (chosedOperation == operation.minus) {
      weight > 0 ? weight -= 1 : weight;
    }
  }

  void ageChanger(operation chosedOperation) {
    if (chosedOperation == operation.add) {
      age < 100 ? age += 1 : age;
    }
    if (chosedOperation == operation.minus) {
      age > 0 ? age -= 1 : age;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.male;
                      });
                    },
                    cardChild: iconIncludes(
                      icon1: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    colour: selectedGender == Genders.male
                        ? maleCardColor = kMaleActiveCardColor
                        : maleCardColor = kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.female;
                      });
                    },
                    colour: selectedGender == Genders.female
                        ? femaleCardColor = kFemaleActiveCardColor
                        : femaleCardColor = kInactiveCardColor,
                    cardChild: iconIncludes(
                      icon1: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text((height).toString(), style: kNumberTextStyle),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                    ),
                    child: Slider(
                      thumbColor: Color(0xFFF08080),
                      value: (height).toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFF99C1DE),
                      inactiveColor: Color(0xFF595959),
                      onChanged: (double newValue) {
                        setState(
                          () {
                            height = newValue.round();
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
              colour: kInactiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weightChanger(operation.add);
                                });
                              },
                              icon: Icons.add,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weightChanger(operation.minus);
                                });
                              },
                              icon: Icons.remove,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(
                                    () {
                                      ageChanger(operation.add);
                                    },
                                  );
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  ageChanger(operation.minus);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    bmiResult: calc.calculateBMI(),
                    bmiState: calc.getResult(),
                    bmiDescription: calc.getInterpretation(),
                  ),
                ),
              );
            },
            title: 'CALCULATE!',
          )
        ],
      ),
    );
  }
}
