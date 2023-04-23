List<double> extractNumberListFromString(String text){
  RegExp regExp = RegExp(r'\d{1,3}(,\d{3})*(\.\d+)?');
  List<String?> matches = regExp.allMatches(text).map((match) => match.group(0)).toList();
  return matches.map((match) => double.parse(match!.replaceAll(',', ''))).toList();
}