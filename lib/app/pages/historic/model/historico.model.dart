// To parse this JSON data, do
//
//     final historicoModel = historicoModelFromMap(jsonString);

import 'dart:convert';

HistoricoModel historicoModelFromMap(String str) =>
    HistoricoModel.fromMap(json.decode(str));

String historicoModelToMap(HistoricoModel data) => json.encode(data.toMap());

class HistoricoModel {
  HistoricoModel({
    this.id,
    this.telefone,
    this.mensagem,
  });

  final int id;
  final String telefone;
  final String mensagem;

  factory HistoricoModel.fromMap(Map<String, dynamic> json) => HistoricoModel(
        id: json["id"] == null ? null : json["id"],
        telefone: json["telefone"] == null ? null : json["telefone"],
        mensagem: json["mensagem"] == null ? null : json["mensagem"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "telefone": telefone == null ? null : telefone,
        "mensagem": mensagem == null ? null : mensagem,
      };
}
