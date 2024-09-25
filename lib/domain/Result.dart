
sealed class Result<T>{}

class Success<T> extends Result<T>{
  T data;
  Success({ required this.data});
}
class ServerError<T> extends Result<T>{
  ServerErrorException exception;
  ServerError(this.exception);
}
class Error<T> extends Result<T>{
  Exception exception;
  Error(this.exception);
}
class ServerErrorException implements Exception {
  String? statusMsg;
  String? serverMessage;
  ServerErrorException(this.statusMsg,this.serverMessage);
}
