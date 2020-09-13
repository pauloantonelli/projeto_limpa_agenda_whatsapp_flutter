abstract class Failure implements Exception {}

class HistoricError extends Failure {
  final String message;
  HistoricError({this.message});
}

class GetHistoricDataBaseError implements HistoricError {
  final String message;
  GetHistoricDataBaseError({this.message});
}

class InsertHistoricDataBaseError implements HistoricError {
  final String message;
  InsertHistoricDataBaseError({this.message});
}

class UpdateHistoricDataBaseError implements HistoricError {
  final String message;
  UpdateHistoricDataBaseError({this.message});
}

class DeleteHistoricDataBaseError implements HistoricError {
  final String message;
  DeleteHistoricDataBaseError({this.message});
}

class HistoricRepositoryError extends Failure {
  final String message;
  HistoricRepositoryError({this.message});
}

class HistoricDataSourceError implements HistoricError {
  final String message;
  HistoricDataSourceError({this.message});
}
