import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;
  String _condition;

  final List<String> _conditions = [
    'Severly Underweight',
    'Underweight',
    'Normal',
    'Overweight',
    'Obese',
    'Severly Obese'
  ];

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 16) _condition = _conditions[0];
    if (_bmi > 16 && _bmi < 18.5) _condition = _conditions[1];
    if (_bmi > 18.5 && _bmi < 25) _condition = _conditions[2];
    if (_bmi > 25 && _bmi < 30) _condition = _conditions[3];
    if (_bmi > 30 && _bmi < 35) _condition = _conditions[4];
    if (_bmi > 35) _condition = _conditions[5];
    return _condition;
  }

  String getInterpretation() {
    String message;
    if (_condition == _conditions[0])
      message = 'You are severly underweight, you should see a doctor!';
    if (_condition == _conditions[1])
      message = 'You are underweight, you should eat more but not too much.';
    if (_condition == _conditions[2])
      message = 'You are normal, your body is doing just fine !';
    if (_condition == _conditions[3])
      message = 'You are overweight, you should do some exrecise and watch out for your weight';
    if (_condition == _conditions[4])
      message = 'You are obese, you should eat much less and exercise more before it\'s too late!';
    if (_condition == _conditions[5])
      message = 'You are severly obese, you should see a doctor!';
    return message;
  }

  Color getColor() {
    Color color;
    if (_condition == _conditions[0]) color = Colors.red;
    if (_condition == _conditions[1]) color = Colors.amber;
    if (_condition == _conditions[2]) color = Color(0xFF24D876);
    if (_condition == _conditions[3]) color = Colors.amber;
    if (_condition == _conditions[4]) color = Colors.red;
    if (_condition == _conditions[5]) color = Colors.red;
    return color;
  }
}
