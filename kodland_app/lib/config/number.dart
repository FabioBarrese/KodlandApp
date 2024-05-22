import 'package:validators/validators.dart';

class Number{
  final String prefix;
  final String number;

  Number(this.prefix, this.number){
    if(!matches(prefix, r'^\d{2}$'))
    {
      throw const FormatException('not a valid prefix');
    }
    if(!matches(number, r'^\d{10}$')){
      throw const FormatException('not a valid number');
    }
    
  }

  

}