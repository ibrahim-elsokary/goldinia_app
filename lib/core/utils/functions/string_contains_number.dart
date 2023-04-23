
bool stringContainsNumber(String text){
 RegExp regExp = RegExp(r'\d+');
  return regExp.hasMatch(text);
}