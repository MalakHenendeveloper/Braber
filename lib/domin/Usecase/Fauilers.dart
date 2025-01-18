abstract class Fauilers{
  String errormassage;
  Fauilers({required this.errormassage});
}
class ServerError extends Fauilers{
  ServerError({required super.errormassage});
}
class NetworkError extends Fauilers{
  NetworkError({required super.errormassage});
}