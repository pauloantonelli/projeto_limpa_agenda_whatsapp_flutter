import 'package:whatsapp_agenda/app/modules/whatsapp/domain/entity/entitie.dart';

class OpenChatWhatsappDTO extends WhatsappEntity {
  final int ddd;
  final int telefone;
  final String mensagem;
  OpenChatWhatsappDTO(this.ddd, this.telefone, this.mensagem)
      : super(0, 0, 0, '');

  getDDD(String ddd) {
    final intDDD = int.parse(ddd);
    return intDDD;
  }

  getMensagem(String mensagem) {
    return mensagem;
  }

  getTelefone(String telefone) {
    final intTelefone = int.parse(telefone);
    return intTelefone;
  }
}
