import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_flutter_test/components/reusable_card.dart';
import 'package:bmi_flutter_test/components/reusable_child_card.dart';
import 'package:bmi_flutter_test/constants/constants.dart';
import 'package:bmi_flutter_test/functions/calculator_brain.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: activeCardColor,
        title: const Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(children: <Widget>[
            Expanded(
              child: ReusableCard(
                onPress: () => {
                  setState(() {
                    selectedGender = Gender.male;
                  })
                },
                colour: selectedGender == Gender.male
                    ? activeCardColor
                    : inactiveCardColor,
                cardChild: const ReusableChildCard(
                  label: 'MALE',
                  icon: FontAwesomeIcons.mars,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: ReusableCard(
                  colour: selectedGender == Gender.female
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: const ReusableChildCard(
                    label: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                  ),
                ),
              ),
            )
          ])),
          Expanded(
              child: Row(children: <Widget>[
            Expanded(
              child: ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // SizedBox(height: 15.0),
                    const Text('HEIGHT', style: labelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        // color of the active part of the track
                        activeTrackColor: Colors.white,
                        // color of the inactive part of the track
                        inactiveTrackColor: Colors.yellow,
                        // color of the thumb
                        thumbColor: const Color(0xFFEB1555),
                        // shape and size of the thumb
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        // color of the overlay
                        overlayColor: const Color(0xFFEB1555).withOpacity(0.5),
                        // shape and size of the overlay
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 25),
                      ),
                      child: Slider(
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                        value: height.toDouble(),
                        min: 55,
                        max: 255,
                        inactiveColor: const Color(0xFF8D8E98),
                        // activeColor: const Color(0xFFEB1555),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])),
          Expanded(
              child: Row(children: <Widget>[
            Expanded(
              child: ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text('WEIGHT', style: labelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        const Text(
                          'kg',
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                weight--;
                              });
                            }),
                        const SizedBox(width: 10.0),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                weight++;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text('AGE', style: labelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          age.toString(),
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        const Text(
                          'years',
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            }),
                        const SizedBox(width: 10.0),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ])),
          GestureDetector(
            // onTap: () => {
              // 用MaterialPageRoute的寫法
              // calc = CalculatorBrain(height: height, weight: weight),
              // CalculatorBrain calc,
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return ResultPage(
              //     bmiResult: calc.calculateBMI(),
              //     resultText: calc.getResult(),
              //     interpretation: calc.getInterpretation(),
              //   );
              // }))
            // },
            onTap: () {
              var calc = CalculatorBrain(height: height, weight: weight);
              Navigator.pushNamed(
                context,
                '/result',
                arguments: {
                  'bmiResult': calc.calculateBMI(
                    height: height, weight: weight,
                  ),
                  'resultText': calc.getResult(),
                  'interpretation': calc.getInterpretation(),
                },
              );
            },
            child: Container(
              color: bottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: bottomContainerHeight,
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: calculateBtnStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: Theme(
      //   data: ThemeData.light(),
      //   child: FloatingActionButton(
      //     onPressed: () => {},
      //     backgroundColor: Colors.purple,
      //     child: const Icon(Icons.add),
      //   ),
      // ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPress});
  final IconData icon;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      disabledElevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}

class CalculatorRouteArguments {
  CalculatorRouteArguments(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
}
