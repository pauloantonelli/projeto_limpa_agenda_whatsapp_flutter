import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/whatsapp/domain/error/error.dart';

abstract class OpenChatWhatsapp {
  Future<Either<Failure, bool>> call(int ddd, int telefone, String mensagem);
}
