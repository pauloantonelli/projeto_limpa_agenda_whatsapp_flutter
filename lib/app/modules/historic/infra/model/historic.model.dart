import 'dart:convert';

import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';

HistoricModel historicoModelFromMap(String str) =>
    HistoricModel.fromMap(json.decode(str));

String historicoModelToMap(HistoricModel data) => json.encode(data.toMap());

class HistoricModel implements HistoricEntity {
  final int id;
  final int ddd;
  final int telefone;
  final String mensagem;

  HistoricModel({
    this.id,
    this.ddd,
    this.telefone,
    this.mensagem,
  });
  factory HistoricModel.fromMap(Map<String, dynamic> json) => HistoricModel(
        id: json["id"] == null ? null : json["id"],
        ddd: json["ddd"] == null ? null : json["ddd"],
        telefone: json["telefone"] == null ? null : json["telefone"],
        mensagem: json["mensagem"] == null ? null : json["mensagem"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "ddd": ddd == null ? null : ddd,
        "telefone": telefone == null ? null : telefone,
        "mensagem": mensagem == null ? null : mensagem,
      };
}
