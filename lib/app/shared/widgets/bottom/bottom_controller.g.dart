// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomController on _BottomControllerBase, Store {
  final _$valueAtom = Atom(name: '_BottomControllerBase.value');

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

  final _$_BottomControllerBaseActionController =
      ActionController(name: '_BottomControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_BottomControllerBaseActionController.startAction(
        name: '_BottomControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_BottomControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
