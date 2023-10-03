import '../../../../common/constants/consts_api.dart';
import '../model/user_auth_model.dart';
import '../model/user_data_model.dart';
import '../../../../core/httpClient/http_client.dart';

abstract class IUserAuthenticationDataSource {
  Future<UserAuthModel> authenticate(
    UserDataModel userDataModel,
    String userAction,
  );
}

class UserAuthenticationDataSource implements IUserAuthenticationDataSource {
  final IHttpClient httpClient;

  UserAuthenticationDataSource({required this.httpClient});

  @override
  Future<UserAuthModel> authenticate(
    UserDataModel userDataModel,
    String userAction,
  ) async {
    final response = await httpClient.post(
      '${ConstsApi.baseUrl}/collections/users/auth-with-password',
      body: {
        "identity": userDataModel.user,
        "password": userDataModel.password,
      },
    );

    // if (response.statusCode == 200) {
    //   return UserAuthModel.fromJson(jsonDecode(response.data));
    // } else {
    //   throw ServerException(message: '');
    // }

    return UserAuthModel.fromJson(response.data);
  }
}
