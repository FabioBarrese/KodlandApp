
import 'dart:core';

class Level {
  _checkValue(String value){
    value = value.toLowerCase();
    value = value.trim();
    List<String> _allowedValues = ['principiante','intermedio','esperto'];
    for(int i = 0; i<_allowedValues.length;i++){
      if(value == _allowedValues[i]){
        return true;
      }
    }
    throw FormatException('value "$value" not allowed, use one of $_allowedValues instead');
  }
  final String value;

  Level(this.value){
    _checkValue(value);
  }
  
}