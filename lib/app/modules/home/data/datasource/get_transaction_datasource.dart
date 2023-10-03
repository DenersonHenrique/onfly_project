import 'dart:convert';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/httpClient/http_client.dart';
import '../../../../common/constants/consts_api.dart';

abstract class ITransactionDataSource {
  Future<dynamic> getTransactions();
}

// class TransactionDataSource extends ITransactionDataSource {
//   final IHttpClient client;

//   TransactionDataSource(this.client);

//   @override
//   Future<dynamic> getTransactions() async {
//     final response = await client.get(
//         '${ConstsApi.baseUrl}/collections/expense_7iGwvf/records');
//     if (response.statusCode == 200) {
//       return dynamic.fromJson(jsonDecode(response.data));
//     } else {
//       throw ServerException();
//     }
//   }
// }
