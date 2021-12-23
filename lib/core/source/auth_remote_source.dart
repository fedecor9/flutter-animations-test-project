import 'package:flutter_template/core/model/service/auth_models.dart';
import 'package:flutter_template/core/model/service/service_response.dart';
import 'package:flutter_template/core/source/common/http_service.dart';

class AuthRemoteSource {
  final HttpServiceDio _httpService;

  static const _URL_LOGIN = 'authaccount/login';

  AuthRemoteSource({required HttpServiceDio httpService})
      : _httpService = httpService;

  Future<SignInResponse> signIn(String email, String password) async {
    final response = await _httpService.post(_URL_LOGIN,
        data: SignInRequest(email, password).toJson());

    return ServiceResponse<SignInResponse>.fromJson(
            response.data, (data) => SignInResponse.fromJson(data))
        .getDataOrThrow();
  }
}
