// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$titleAtom = Atom(name: '_HomeControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$subtitleAtom = Atom(name: '_HomeControllerBase.subtitle');

  @override
  String get subtitle {
    _$subtitleAtom.reportRead();
    return super.subtitle;
  }

  @override
  set subtitle(String value) {
    _$subtitleAtom.reportWrite(value, super.subtitle, () {
      super.subtitle = value;
    });
  }

  final _$controllerPageAtom = Atom(name: '_HomeControllerBase.controllerPage');

  @override
  PageController get controllerPage {
    _$controllerPageAtom.reportRead();
    return super.controllerPage;
  }

  @override
  set controllerPage(PageController value) {
    _$controllerPageAtom.reportWrite(value, super.controllerPage, () {
      super.controllerPage = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
subtitle: ${subtitle},
controllerPage: ${controllerPage}
    ''';
  }
}
