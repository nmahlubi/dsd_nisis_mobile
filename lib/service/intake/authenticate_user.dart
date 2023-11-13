import 'dart:convert';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../../domain/repository/authenticate/authenticate_repository.dart';
import '../../model/intake/auth_token.dart';
import '../../shared/apierror.dart';
import '../../shared/apiresponse.dart';
import '../../util/app_url.dart';

class AuthenticateUser {
  final authenticateRepository = AuthenticateRepository();
  Future<ApiResponse> login(String username, String password, String deviceId,
      String deviceName) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final Map<String, dynamic> loginData = {
        'username': username,
        'password': password,
        'deviceId': deviceId,
        'deviceName': deviceName,
        'module': 'nisismobile'
      };
      final response = await http.post(
        Uri.parse("${AppUrl.intakeURL}/Login/Mobile"),
        body: json.encode(loginData),
        headers: {'Content-Type': 'application/json'},
      );

      switch (response.statusCode) {
        case 200:
          AuthToken tokenResponse =
              AuthToken.fromJson(json.decode(response.body));
          apiResponse.data = tokenResponse;
          authenticateRepository.saveAuthToken(tokenResponse, password);
          break;
        default:
          apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
          break;
      }
    } on SocketException {
      var authTokenResponse =
          authenticateRepository.getAuthTokenByUsername(username, password);
      if (authTokenResponse != null) {
        apiResponse.data = authTokenResponse;
      } else {
        apiResponse.apiError = ApiError(error: "Offline-Invalid Credentials.");
      }
    }
    return apiResponse;
  }
}
