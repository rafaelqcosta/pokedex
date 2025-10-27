class Failure implements Exception {
  Failure(this.message);
  final String message;
}

class ServerFailure extends Failure {
  ServerFailure() : super('Erro do servidor. Tente novamente mais tarde.');
}

class InvalidOrMissingFieldFailure extends Failure {
  InvalidOrMissingFieldFailure({
    String message =
        'Parece que algo deu errado com sua solicitação. Verifique os dados e tente novamente.',
  }) : super(message);
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure({String message = 'Erro inesperado'}) : super(message);
}

class TimeOutFailure extends Failure {
  TimeOutFailure() : super('Tempo de requisição excedido. Tente novamente mais tarde.');
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure() : super('Sua sessão expirou. Faca login novamente.');
}

class NoConnectionFailure extends Failure {
  NoConnectionFailure() : super('Você está sem conexão. Verifique a sua internet.');
}

class JsonParsingFailure extends Failure {
  JsonParsingFailure() : super('Erro ao tentar converter os dados json.');
}

class TooManyRequests extends Failure {
  TooManyRequests({String message = 'Muitas solicitações simultâneas. Tente novamente mais tarde.'})
    : super(message);
}
