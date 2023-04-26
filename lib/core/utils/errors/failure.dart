abstract class Failure {
  final String errorMsg ;

  Failure(this.errorMsg);
}


class ParsingError extends Failure{
  ParsingError(super.errorMsg);

}



