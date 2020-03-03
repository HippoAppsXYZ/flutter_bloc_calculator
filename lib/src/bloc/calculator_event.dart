import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

/// |---|---|---|---|
/// | AC| → | % | ÷ |
/// |---|---|---|---|
/// | 1 | 2 | 3 | × |
/// |---|---|---|---|
/// | 4 | 5 | 6 | - |
/// |---|---|---|---|
/// | 7 | 8 | 9 | + |
/// |---|---|---|---|
/// | 0 | . | ± | = |
/// |---|---|---|---|

/// ×
class Multiple extends CalculatorEvent {}

/// -
class Minus extends CalculatorEvent {}

/// +
class Plus extends CalculatorEvent {}

/// ÷
class Divide extends CalculatorEvent {}

/// =
class Equals extends CalculatorEvent {}

/// 0
class Zero extends CalculatorEvent {}

/// 1
class One extends CalculatorEvent {}

/// 2
class Two extends CalculatorEvent {}

/// 3
class Three extends CalculatorEvent {}

/// 4
class Four extends CalculatorEvent {}

/// 5
class Five extends CalculatorEvent {}

/// 6
class Six extends CalculatorEvent {}

/// 7
class Seven extends CalculatorEvent {}

/// 8
class Eight extends CalculatorEvent {}

/// 9
class Nine extends CalculatorEvent {}

/// .
class Point extends CalculatorEvent {}

/// →
class Delete extends CalculatorEvent {}

/// ±
class Sign extends CalculatorEvent {}

/// %
class Percent extends CalculatorEvent {}

/// AC
class AllClear extends CalculatorEvent {}