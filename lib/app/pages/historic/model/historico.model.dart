import 'dart:convert';

HistoricoModel historicoModelFromMap(String str) =>
    HistoricoModel.fromMap(json.decode(str));

String historicoModelToMap(HistoricoModel data) => json.encode(data.toMap());

class HistoricoModel {
  final int id;
  final String ddd;
  final String telefone;
  final String mensagem;

  HistoricoModel({
    this.id,
    this.ddd,
    this.telefone,
    this.mensagem,
  });
  factory HistoricoModel.fromMap(Map<String, dynamic> json) => HistoricoModel(
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
