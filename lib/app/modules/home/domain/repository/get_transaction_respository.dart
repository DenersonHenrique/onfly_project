import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class IGetListTransactionRepository {
  Future<Either<Failure, dynamic>> getTransactions();
}
