// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historic_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoricController on _HistoricControllerBase, Store {
  final _$historicoAtom = Atom(name: '_HistoricControllerBase.historico');

  @override
  List<Map<String, dynamic>> get historico {
    _$historicoAtom.reportRead();
    return super.historico;
  }

  @override
  set historico(List<Map<String, dynamic>> value) {
    _$historicoAtom.reportWrite(value, super.historico, () {
      super.historico = value;
    });
  }

  final _$getDataFromDataBaseAsyncAction =
      AsyncAction('_HistoricControllerBase.getDataFromDataBase');

  @override
  Future getDataFromDataBase() {
    return _$getDataFromDataBaseAsyncAction
        .run(() => super.getDataFromDataBase());
  }

  @override
  String toString() {
    return '''
historico: ${historico}
    ''';
  }
}
