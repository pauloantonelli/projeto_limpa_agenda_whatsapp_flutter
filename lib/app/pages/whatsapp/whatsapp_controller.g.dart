// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whatsapp_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WhatsappController on _WhatsappControllerBase, Store {
  final _$dddAtom = Atom(name: '_WhatsappControllerBase.ddd');

  @override
  TextEditingController get ddd {
    _$dddAtom.reportRead();
    return super.ddd;
  }

  @override
  set ddd(TextEditingController value) {
    _$dddAtom.reportWrite(value, super.ddd, () {
      super.ddd = value;
    });
  }

  final _$telefoneAtom = Atom(name: '_WhatsappControllerBase.telefone');

  @override
  TextEditingController get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(TextEditingController value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  final _$mensagemAtom = Atom(name: '_WhatsappControllerBase.mensagem');

  @override
  TextEditingController get mensagem {
    _$mensagemAtom.reportRead();
    return super.mensagem;
  }

  @override
  set mensagem(TextEditingController value) {
    _$mensagemAtom.reportWrite(value, super.mensagem, () {
      super.mensagem = value;
    });
  }

  final _$_WhatsappControllerBaseActionController =
      ActionController(name: '_WhatsappControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_WhatsappControllerBaseActionController.startAction(
        name: '_WhatsappControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_WhatsappControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ddd: ${ddd},
telefone: ${telefone},
mensagem: ${mensagem}
    ''';
  }
}
