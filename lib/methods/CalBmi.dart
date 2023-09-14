
import 'dart:math';

import 'package:flutter/material.dart';

class CalculateBMI with ChangeNotifier{
   int height;
   int weigth;

  CalculateBMI({
    this.height = 0, 
     this.weigth = 0,
  });

 late double _bmi;

 String calculateBMI() {
   _bmi = weigth / pow(height / 100, 2);
   return _bmi.toStringAsFixed(1);
 }

 String getResult () {
  if (_bmi >= 25) {
    return 'OverWeigth';
  } else if(_bmi > 18.5) {
    return 'Normal';
  } else {
    return 'UnderWeigth';
  }
 }

 String feedback () {
  if (_bmi >= 25) {
    return 'You have a higher then normal weigth.Try to exerices more. Those who are overweigth (BMI of 25 to 29.9).';
  } else  if (_bmi > 18.5){
    return 'You have a normal body weigth. Congratulation';
  } else {
    return 'Eat more frequently, you are underweigth';
  }
 }
}