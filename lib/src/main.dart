import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_calculator/src/calculator.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:intl/intl.dart' as intl;

import 'bloc/bloc.dart';

class BlocCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myLocale = Localizations.localeOf(context);
    var nf = intl.NumberFormat.decimalPattern(myLocale.toLanguageTag())
      ..maximumFractionDigits = 6;
    Calculator calculator = Calculator.numberFormat(nf, 6);

    return BlocProvider(
      create: (context) => CalculatorBloc(calculator: calculator),
      child: CalculatorWidget(),
    );
  }
}

class CalculatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(children: <Widget>[
          Expanded(
            child: _getDisplay(context),
            flex: 2,
          ),
          Expanded(
            child: _getButtons(context),
            flex: 5,
          ),
        ]),
      ],
    );
  }
}

Widget _getDisplay(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide.none,
        left: BorderSide.none,
        right: BorderSide.none,
        bottom: Divider.createBorderSide(
          context,
          color: Theme.of(context).dividerColor,
          width: 1.0,
        ),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.cyan,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: BlocBuilder<CalculatorBloc, CalculatorState>(
                  builder: (context, state) {
                    final String dString = state.displayString;
                    return AutoSizeText(
                      '$dString',
                      style: const TextStyle(fontSize: 50),
                      maxLines: 2,
                      textDirection: TextDirection.ltr,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: true,
          child: Expanded(
            child: Container(
              color: Colors.amber,
              child: Align(
                alignment: Alignment.centerRight,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: BlocBuilder<CalculatorBloc, CalculatorState>(
                    builder: (context, state) {
                      final String eString = state.expressionString;
                      return Text(
                        '$eString',
                        style: const TextStyle(fontSize: 12),
                        maxLines: 2,
                        textDirection: TextDirection.ltr,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _getButtons(BuildContext context) {
  return GridButton(
    textStyle: TextStyle(
      fontSize: 26,
    ),
    borderColor: Divider.createBorderSide(
      context,
      color: Theme.of(context).dividerColor,
      width: 1.0,
    ).color,
    textDirection: TextDirection.ltr,
    hideSurroundingBorder: false,
    borderWidth: 1.0,
    onPressed: (dynamic val) {
      print(val);
      switch (val) {
        case "→":
          context.bloc<CalculatorBloc>().add(Delete());
          break;
        case "±":
          context.bloc<CalculatorBloc>().add(Sign());
          break;
        case "+":
          context.bloc<CalculatorBloc>().add(Plus());
          break;
        case "-":
          context.bloc<CalculatorBloc>().add(Minus());
          break;
        case "×":
          context.bloc<CalculatorBloc>().add(Multiple());
          break;
        case "÷":
          context.bloc<CalculatorBloc>().add(Divide());
          break;
        case "=":
          context.bloc<CalculatorBloc>().add(Equals());
          break;
        case "AC":
          context.bloc<CalculatorBloc>().add(AllClear());
          break;
        case ".":
          context.bloc<CalculatorBloc>().add(Point());
          break;
        case "%":
          context.bloc<CalculatorBloc>().add(Percent());
          break;
        case "0":
          context.bloc<CalculatorBloc>().add(Zero());
          break;
        case "1":
          context.bloc<CalculatorBloc>().add(One());
          break;
        case "2":
          context.bloc<CalculatorBloc>().add(Two());
          break;
        case "3":
          context.bloc<CalculatorBloc>().add(Three());
          break;
        case "4":
          context.bloc<CalculatorBloc>().add(Four());
          break;
        case "5":
          context.bloc<CalculatorBloc>().add(Five());
          break;
        case "6":
          context.bloc<CalculatorBloc>().add(Six());
          break;
        case "7":
          context.bloc<CalculatorBloc>().add(Seven());
          break;
        case "8":
          context.bloc<CalculatorBloc>().add(Eight());
          break;
        case "9":
          context.bloc<CalculatorBloc>().add(Nine());
          break;
      }
    },
    items: _getItems(context),
  );
}

/// |---|---|---|---|
/// | AC| → | % | ÷ |
/// |---|---|---|---|
/// | 7 | 8 | 9 | × |
/// |---|---|---|---|
/// | 4 | 5 | 6 | - |
/// |---|---|---|---|
/// | 1 | 2 | 3 | + |
/// |---|---|---|---|
/// | 0 | . | ± | = |
/// |---|---|---|---|
List<List<GridButtonItem>> _getItems(BuildContext context) {
  return [
    ["AC", "→", "%", "÷"],
    ["7", "8", "9", "×"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["0", ".", "±", "="],
  ].map((items) {
    return items.map((title) {
      return GridButtonItem(
        title: title,
        color: Theme.of(context).scaffoldBackgroundColor,
        textStyle: const TextStyle(fontSize: 16, color: Colors.lightBlue),
      );
    }).toList();
  }).toList();
}
