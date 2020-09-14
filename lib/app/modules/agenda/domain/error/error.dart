abstract class AgendaFailure implements Exception {}

class AddNewContactError extends AgendaFailure {
  final String message;
  AddNewContactError({this.message});
}

class AgendaNullError extends AgendaFailure {
  final String message;
  AgendaNullError({this.message});
}

class AddNewContactRepositoryError extends AgendaFailure {
  final String message;
  AddNewContactRepositoryError({this.message});
}

class NameEmptyError extends AgendaFailure {
  final String message;
  NameEmptyError({this.message});
}

class PhonesEmptyError extends AgendaFailure {
  final String message;
  PhonesEmptyError({this.message});
}

class DatasourceError implements AgendaFailure {
  final String message;
  DatasourceError({this.message});
}
