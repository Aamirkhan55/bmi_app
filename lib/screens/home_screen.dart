import 'dart:math';

import 'package:bmi_app/components/IconWithLable.dart';
import 'package:bmi_app/components/ReuseableCard.dart';
import 'package:bmi_app/components/Rounded_btn.dart';
import 'package:bmi_app/methods/CalBmi.dart';
import 'package:bmi_app/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

enum GenderSelection {male , female}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _age = 16;
  int _height = 150;
  int _weight = 150;
  final inActiveColor = const Color(0xff1d1e33);
  final activeColor = const Color(0x111d1e33);
  GenderSelection? selection;
  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Expanded(
            child: Row(
              children: [
               ReuseableCard(
                  color: selection == GenderSelection.male ? activeColor : inActiveColor,
                  myChild: const IconWithLable(
                    icon: FontAwesomeIcons.mars,
                    lable: 'MALE',
                  ),
                  onpress: () {
                    setState(() {
                      selection = GenderSelection.male;
                    });
                  },
                ),
                ReuseableCard(
                  color: selection == GenderSelection.female ? activeColor : inActiveColor,
                  myChild: const IconWithLable(
                    icon: FontAwesomeIcons.venus,
                    lable: 'FEMALE',
                  ),
                  onpress: () {
                    setState(() {
                      selection = GenderSelection.female;
                    });
                  },
                ),
              ],
            ),
          ),
          ReuseableCard(
            
            color: const Color(0xff1d1e33),
            myChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Height',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      _height.toString(),
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('cm'),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2,
                    activeTrackColor: Colors.white,
                    overlayColor: const Color(0x15eb1555),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 30),
                    thumbColor: const Color(0xffeb1555),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15),
                  ),
                  child: Slider(
                    max: 220,
                    min: 120,
                    onChanged: (double newValue) {
                      setState(() {
                        _height = newValue.toInt().round();
                      });
                    },
                    value: _height.toDouble(),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReuseableCard(
                  color: const Color(0xff1d1e33),
                  myChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Weight',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            _weight.toString(),
                            style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('kg'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedBtn(
                            color: const Color(0xff0A0E21),
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                _weight++;
                              });
                            },
                          ),
                          const SizedBox(width: 5),
                          RoundedBtn(
                            color: const Color(0xff0A0E21),
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                _weight = max(_weight-1, 0);
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
                 ReuseableCard(
                  color: const Color(0xff1d1e33),
                   myChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Age',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            _age.toString(),
                            style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('yr'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedBtn(
                            color: const Color(0xff0A0E21),
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                _age++;
                              });
                            },
                          ),
                          const SizedBox(width: 5),
                          RoundedBtn(
                            color: const Color(0xff0A0E21),
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                _age = max(_age-1, 0);
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Consumer<CalculateBMI>(
            builder:(context, value, child) => TextButton(
              onPressed: (){
                CalculateBMI calculateBMI =  CalculateBMI(
                  height: _height,
                  weigth: _weight,
                );
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => 
                   ResultScreen(
                    bmi: calculateBMI.calculateBMI(),
                    result: calculateBMI.getResult(),
                    feedback: calculateBMI.feedback(),
                  )));
              }, 
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffeb1555),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    )),
              )
              ),
          )
        ],
      )),
    );
  }
}

