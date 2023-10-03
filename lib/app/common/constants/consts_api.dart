class ConstsApi {
  static String baseUrl = 'https://go-bd-api-3iyuzyysfa-uc.a.run.app/api';
  static String authenticationUrl(String urlSegment, String authKey) =>
      'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=$authKey';
}
