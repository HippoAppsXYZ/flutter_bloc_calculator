import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'bloc.dart';
import '../calculator.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final Calculator _calculator;

  CalculatorBloc({@required Calculator calculator})
      : assert(calculator != null),
        _calculator = calculator;

  @override
  CalculatorState get initialState => CalculatorInitialState(
      expressionString: _calculator.expression.toString(),
      displayString: _calculator.displayString);

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is Delete) {
      /// →
      yield* _mapDeleteToState(event);
    }
    if (event is Sign) {
      /// ±
      yield* _mapSignToState(event);
    }
    if (event is Plus) {
      /// +
      yield* _mapPlusToState(event);
    }
    if (event is Minus) {
      /// -
      yield* _mapMinusToState(event);
    }
    if (event is Multiple) {
      /// ×
      yield* _mapMultipleToState(event);
    }
    if (event is Divide) {
      /// ÷
      yield* _mapDivideToState(event);
    }
    if (event is AllClear) {
      /// AC
      yield* _mapAllClearToState(event);
    }
    if (event is Percent) {
      /// %
      yield* _mapPercentToState(event);
    }
    if (event is Point) {
      /// .
      yield* _mapPointToState(event);
    }
    if (event is Equals) {
      /// =
      yield* _mapEqualsToState(event);
    }
    if (event is Zero) {
      /// =
      yield* _mapZeroToState(event);
    }
    if (event is One) {
      /// =
      yield* _mapOneToState(event);
    }
    if (event is Two) {
      /// =
      yield* _mapTwoToState(event);
    }
    if (event is Three) {
      /// =
      yield* _mapThreeToState(event);
    }
    if (event is Four) {
      /// =
      yield* _mapFourToState(event);
    }
    if (event is Five) {
      /// =
      yield* _mapFiveToState(event);
    }
    if (event is Six) {
      /// =
      yield* _mapSixToState(event);
    }
    if (event is Seven) {
      /// =
      yield* _mapSevenToState(event);
    }
    if (event is Eight) {
      /// =
      yield* _mapEightToState(event);
    }
    if (event is Nine) {
      /// =
      yield* _mapNineToState(event);
    }
  }

  Stream<CalculatorState> _mapDeleteToState(Delete delete) async* {
    _calculator.removeDigit();
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapSignToState(Sign sign) async* {
    _calculator.toggleSign();
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapPlusToState(Plus plus) async* {
    _calculator.setOperator("+");
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapMinusToState(Minus minus) async* {
    _calculator.setOperator("-");
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapMultipleToState(Multiple multiple) async* {
    _calculator.setOperator("×");
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapDivideToState(Divide divide) async* {
    _calculator.setOperator("÷");
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapAllClearToState(AllClear allClear) async* {
    _calculator.allClear();
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapPercentToState(Percent percent) async* {
    _calculator.setPercent();
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapPointToState(Point point) async* {
    _calculator.addPoint();
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapEqualsToState(Equals equals) async* {
    _calculator.operate();
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapZeroToState(Zero zero) async* {
    _calculator.addDigit(0);
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapOneToState(One one) async* {
    _calculator.addDigit(1);
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapTwoToState(Two two) async* {
    _calculator.addDigit(2);
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapThreeToState(Three three) async* {
    _calculator.addDigit(3);
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapFourToState(Four four) async* {
    _calculator.addDigit(4);
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapFiveToState(Five five) async* {
    _calculator.addDigit(5);
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapSixToState(Six six) async* {
    _calculator.addDigit(6);
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapSevenToState(Seven seven) async* {
    _calculator.addDigit(7);
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapEightToState(Eight eight) async* {
    _calculator.addDigit(8);
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }

  Stream<CalculatorState> _mapNineToState(Nine nine) async* {
    _calculator.addDigit(9);
    yield CalculatorSuccessState(
        expressionString: _calculator.expression,
        displayString: _calculator.displayString);
  }
}
