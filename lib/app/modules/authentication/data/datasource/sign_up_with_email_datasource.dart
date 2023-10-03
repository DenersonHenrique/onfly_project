import '../model/user_auth_model.dart';
import '../model/user_data_model.dart';
import '../../../../common/constants/app_keys.dart';
import '../../../../common/constants/consts_api.dart';
import '../../../../core/httpClient/http_client.dart';

abstract class ISignUpWithEmailDataSource {
  Future<UserAuthModel> signUp(
    UserDataModel userDataModel,
    String userAction,
  );
}

class SignUpWithEmailDataSource implements ISignUpWithEmailDataSource {
  final IHttpClient httpClient;

  SignUpWithEmailDataSource({required this.httpClient});

  @override
  Future<UserAuthModel> signUp(
    UserDataModel userDataModel,
    String userAction,
  ) async {
    final response = await httpClient.post(
      ConstsApi.authenticationUrl(userAction, AppKey.AUTH_API_KEY),
      body: {
        "email": userDataModel.user,
        "password": userDataModel.password,
        "returnSecureToken": true,
      },
    );

    return UserAuthModel.fromJson(response.data);
  }
}
