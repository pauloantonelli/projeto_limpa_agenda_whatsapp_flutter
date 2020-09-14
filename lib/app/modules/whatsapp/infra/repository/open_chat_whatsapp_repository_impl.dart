import 'package:whatsapp_agenda/app/modules/whatsapp/domain/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/repository/open_chat_whatsapp_repository.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/infra/datasource/open_chat_whatsapp_datasource.dart';

class OpenChatWhatsappRepositoryImpl implements OpenChatWhatsappRepository {
  final OpenChatWhatsappDatasource _datasource;

  OpenChatWhatsappRepositoryImpl(this._datasource);

  @override
  Future<Either<OpenChatWhatsappError, bool>>
      setNecessaryDDDAndTelefoneAndMessageToOpenWhatsapp(
          int ddd, int telefone, String mensagem) async {
    return _datasource
        .openChat(ddd, telefone, mensagem)
        .then((value) => Right(value));
  }
}
