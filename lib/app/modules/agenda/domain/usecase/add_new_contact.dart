import 'package:dartz/dartz.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/entity/entity-contact.dart';
import 'package:whatsapp_agenda/app/modules/agenda/domain/error/error.dart';

abstract class AddNewContact {
  Future<Either<AgendaFailure, bool>> call(ContactEntity contact);
}
