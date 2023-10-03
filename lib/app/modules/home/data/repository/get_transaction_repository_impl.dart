import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../datasource/get_transaction_datasource.dart';
import '../../domain/repository/get_transaction_respository.dart';

class TransactionRepository implements IGetListTransactionRepository {
  final ITransactionDataSource _datasource;

  TransactionRepository(
    this._datasource,
  );

  @override
  Future<Either<Failure, dynamic>> getTransactions() async {
    try {
      final response = await _datasource.getTransactions();
      return Right(response);
    } on ServerFailure catch (error) {
      return Left(error);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
