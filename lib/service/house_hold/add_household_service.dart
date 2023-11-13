// import 'dart:convert';
// import 'dart:io';
//
// import 'package:http_interceptor/http/intercepted_client.dart';
//
// import '../../auth_intercept/authorization_interceptor.dart';
// import '../../domain/repository/household/add_household_repository.dart';
// import '../../model/household/add_household_model.dart';
// import '../../shared/apierror.dart';
// import '../../shared/apiresponse.dart';
// import '../../shared/apiresults.dart';
// import '../../util/app_url.dart';
// import '../../util/http_client_service.dart';
//
// class HouseholdService {
//   final client =
//   InterceptedClient.build(interceptors: [AuthorizationInterceptor()]);
//   final _addHouseholdRepository = AddHouseholdRepository();
//   final _httpClientService = HttpClientService();
//
//
//   Future<void> saveHousehold(AddHousehold addHousehold, int? householdId) async {
//
//   }
//
//   Future<ApiResponse> addPerson(AddHousehold addHousehold) async {
//     ApiResponse apiResponse = ApiResponse();
//     try {
//       final response = await client.post(
//           Uri.parse("${AppUrl.intakeURL}/Person/Add"),
//           body: json.encode(addHousehold),
//           headers: {'Content-Type': 'application/json'});
//       switch (response.statusCode) {
//         case 200:
//           ApiResults apiResults =
//           ApiResults.fromJson(json.decode(response.body));
//           apiResponse.data = apiResults;
//           AddHousehold addHousehold = AddHousehold.fromJson(json.decode(response.body));
//           apiResponse.data = addHousehold;
//           _addHouseholdRepository.saveHousehold(addHousehold, 8);
//           break;
//         default:
//           apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
//           break;
//       }
//     } on SocketException {
//       apiResponse.data = _addHouseholdRepository.getPersonById(addHousehold.description!);
//     }
//     return apiResponse;
//   }
// }