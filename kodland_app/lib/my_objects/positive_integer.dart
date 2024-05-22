
import 'dart:core';

class PositiveInteger {
  _checkValue(int value){
    int upperBound = 10000;
    int lowerBound = 1;
    if(value > upperBound){
        throw FormatException('value "$value" not allowed because is greater then $upperBound');
    }
    if(value < lowerBound){
        throw FormatException('value "$value" not allowed because is lower then $lowerBound');
    }
    return true;
  }
  final int value;

  PositiveInteger(this.value){
    _checkValue(value);
  }
  
}