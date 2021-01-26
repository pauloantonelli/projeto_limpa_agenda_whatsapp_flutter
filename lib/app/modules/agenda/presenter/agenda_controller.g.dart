// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgendaController on _AgendaControllerBase, Store {
  final _$openSnackbarAtom = Atom(name: '_AgendaControllerBase.openSnackbar');

  @override
  BehaviorSubject<bool> get openSnackbar {
    _$openSnackbarAtom.reportRead();
    return super.openSnackbar;
  }

  @override
  set openSnackbar(BehaviorSubject<bool> value) {
    _$openSnackbarAtom.reportWrite(value, super.openSnackbar, () {
      super.openSnackbar = value;
    });
  }

  final _$historicoAtom = Atom(name: '_AgendaControllerBase.historico');

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
      AsyncAction('_AgendaControllerBase.getDataFromDataBase');

  @override
  Future getDataFromDataBase() {
    return _$getDataFromDataBaseAsyncAction
        .run(() => super.getDataFromDataBase());
  }

  @override
  String toString() {
    return '''
openSnackbar: ${openSnackbar},
historico: ${historico}
    ''';
  }
}
