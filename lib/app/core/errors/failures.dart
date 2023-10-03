import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  get message => null;
}

class ServerFailure extends Failure {
  @override
  List<Object> get props => [];
}
