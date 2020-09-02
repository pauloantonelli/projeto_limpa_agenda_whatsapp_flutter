import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/error/error.dart';

abstract class OpenChatWhatsappRepository {
  Future<Either<OpenChatWhatsappError, bool>>
      setNecessaryDDDAndTelefoneAndMessageToOpenWhatsapp(
          int ddd, int telefone, String mensagem);
}
