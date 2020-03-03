import 'package:equatable/equatable.dart';

abstract class CalculatorState extends Equatable {
  final String expressionString;
  final String displayString;

  const CalculatorState({this.expressionString, this.displayString});

  @override
  List<Object> get props => [expressionString, displayString];
}

class CalculatorInitialState extends CalculatorState {
  const CalculatorInitialState({String expressionString, String displayString})
      : super(expressionString: "", displayString: "0");

  CalculatorInitialState copyWith({
    String expressionString,
    String displayString,
  }) {
    return CalculatorInitialState(
      expressionString: "",
      displayString: "0",
    );
  }

  @override
  String toString() {
    return 'CalculatorInitialState { expressionString: , displayString: 0}';
  }
}

class CalculatorSuccessState extends CalculatorState {
  const CalculatorSuccessState({String expressionString, String displayString})
      : super(expressionString: expressionString, displayString: displayString);

  CalculatorSuccessState copyWith({
    String expressionString,
    String displayString,
  }) {
    return CalculatorSuccessState(
      expressionString: expressionString ?? this.expressionString,
      displayString: displayString ?? this.displayString,
    );
  }

  @override
  String toString() {
    return 'CalculatorSuccessState { expressionString: $expressionString, displayString: $displayString}';
  }
}

class CalculatorFailedState extends CalculatorState {
  const CalculatorFailedState({String expressionString, String displayString})
      : super(expressionString: "Error", displayString: "Error");

  CalculatorFailedState copyWith({
    String expressionString,
    String displayString,
  }) {
    return CalculatorFailedState(
      expressionString: "Error",
      displayString: "Error",
    );
  }

  @override
  String toString() {
    return 'CalculatorInitialState { expressionString: Error, displayString: Error}';
  }
}
