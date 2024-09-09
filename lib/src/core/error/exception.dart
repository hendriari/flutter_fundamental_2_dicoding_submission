class GeneralException implements Exception {
  final String message;

  const GeneralException({required this.message});

  @override
  String toString() => message;
}

class ServerException implements Exception {
  final String message;

  const ServerException({required this.message});

  @override
  String toString() => message;
}

class ConnectionException implements Exception {
  final String message;

  const ConnectionException({required this.message});

  @override
  String toString() => message;
}
