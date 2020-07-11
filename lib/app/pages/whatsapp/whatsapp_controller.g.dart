// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whatsapp_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WhatsappController on _WhatsappControllerBase, Store {
  final _$formTextAtom = Atom(name: '_WhatsappControllerBase.formText');

  @override
  TextEditingController get formText {
    _$formTextAtom.reportRead();
    return super.formText;
  }

  @override
  set formText(TextEditingController value) {
    _$formTextAtom.reportWrite(value, super.formText, () {
      super.formText = value;
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
formText: ${formText}
    ''';
  }
}
