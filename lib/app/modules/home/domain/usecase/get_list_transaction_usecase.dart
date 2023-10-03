import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repository/get_transaction_respository.dart';

abstract class IGetListTransactionUsecase {
  Future<Either<Failure, dynamic>> getTransactions();
}

class GetListTransactionUsecase implements IGetListTransactionUsecase {
  final IGetListTransactionRepository _repository;

  GetListTransactionUsecase(this._repository);

  @override
  Future<Either<Failure, dynamic>> getTransactions() async =>
      await _repository.getTransactions();
}
