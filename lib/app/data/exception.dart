class HttpStatusCodeException<T> implements Exception {
  HttpStatusCodeException({required this.statusCode, this.data});

  final int statusCode;
  final T? data;

  @override
  String toString() {
    return 'HttpStatusCodeException: $statusCode $data';
  }
}

class ConnectionTimeoutException implements Exception {
  ConnectionTimeoutException();

  @override
  String toString() {
    return 'ConnectionTimeoutException';
  }
}

class SessionExpiredException implements Exception {
  SessionExpiredException();

  @override
  String toString() {
    return 'SessionExpiredException';
  }
}
