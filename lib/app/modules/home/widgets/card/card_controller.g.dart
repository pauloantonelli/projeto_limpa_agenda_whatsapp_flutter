// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardController on _CardControllerBase, Store {
  final _$valueAtom = Atom(name: '_CardControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_CardControllerBaseActionController =
      ActionController(name: '_CardControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_CardControllerBaseActionController.startAction(
        name: '_CardControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
