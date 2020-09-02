import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/error/error.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/repository/open_chat_whatsapp_repository.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/usecase/open_chat_whatsapp.dart';

class OpenChatWhatsappImpl implements OpenChatWhatsapp {
  final OpenChatWhatsappRepository _repository;

  OpenChatWhatsappImpl(this._repository);

  @override
  Future<Either<OpenChatWhatsappError, bool>> call(
      int ddd, int telefone, String mensagem) async {
    if (ddd == null || telefone == null || mensagem == null) {
      return Left(NullError());
    }
    if (ddd.isNegative || telefone.isNegative) {
      return Left(NegativeNumberError());
    }
    if (ddd.isNaN || telefone.isNaN) {
      return Left(NotNumberError());
    }
    if (mensagem.isEmpty) {
      return Left(StringEmptyError());
    }
    return await _repository.setNecessaryDDDAndTelefoneAndMessageToOpenWhatsapp(
        ddd, telefone, mensagem);
  }
}
