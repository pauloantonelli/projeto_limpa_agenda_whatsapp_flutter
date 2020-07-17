// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historic_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoricController on _HistoricControllerBase, Store {
  final _$sqfliteAtom = Atom(name: '_HistoricControllerBase.sqflite');

  @override
  dynamic get sqflite {
    _$sqfliteAtom.reportRead();
    return super.sqflite;
  }

  @override
  set sqflite(dynamic value) {
    _$sqfliteAtom.reportWrite(value, super.sqflite, () {
      super.sqflite = value;
    });
  }

  final _$getHistoricoAsyncAction =
      AsyncAction('_HistoricControllerBase.getHistorico');

  @override
  Future<List<Map<String, dynamic>>> getHistorico() {
    return _$getHistoricoAsyncAction.run(() => super.getHistorico());
  }

  @override
  String toString() {
    return '''
sqflite: ${sqflite}
    ''';
  }
}
