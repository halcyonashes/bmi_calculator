import 'package:bmi_calculator/brain/bmi_calculator.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bmi_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import '../components/bottom_button.dart';
import '../constants/constants.dart';

enum Sex { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Sex selectedSex;
  int height = 175;
  int weight = 60;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BMICard(
                    onPress: () {
                      setState(() {
                        selectedSex = Sex.male;
                      });
                    },
                    widgetColor: (selectedSex == Sex.male)
                        ? kActiveCardColour
                        : kInActiveCardColour,
                    cardChild:
                        BMISexCard(icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    onPress: () {
                      setState(() {
                        selectedSex = Sex.female;
                      });
                    },
                    cardChild: BMISexCard(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    widgetColor: (selectedSex == Sex.female)
                        ? kActiveCardColour
                        : kInActiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BMICard(
              widgetColor: kInActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kHeavyTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kSubTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kBottomContainerColour,
                      overlayColor: kInActiveCardColour,
                      inactiveTrackColor: kInActiveCardColour,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: kMinHeight,
                      max: kMaxHeight,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CountCard(
                    count: weight,
                    label: 'WEIGHT',
                    onMinusPressed: () {
                      setState(() {
                        weight--;
                      });
                    },
                    onAddPressed: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CountCard(
                    count: age,
                    label: 'AGE',
                    onMinusPressed: () {
                      setState(() {
                        age--;
                      });
                    },
                    onAddPressed: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            label: 'CALCULATE',
            onTap: () {
              BMICalculator results = BMICalculator(height, weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          bmiResults: results,
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CountCard extends StatelessWidget {
  final int count;
  final String label;
  final Function onAddPressed, onMinusPressed;

  CountCard({this.count, this.label, this.onMinusPressed, this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    return BMICard(
      widgetColor: kInActiveCardColour,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: kLabelTextStyle,
          ),
          Text(
            count.toString(),
            style: kHeavyTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(Icons.remove, onMinusPressed),
              SizedBox(
                width: 10.0,
              ),
              RoundIconButton(Icons.add, onAddPressed),
            ],
          ),
        ],
      ),
    );
  }
}
