class ApiResponse {
  // _data will hold any response converted into
  // its own object. For example user.
  late Object? data;
  // _apiError will hold the error object
  Object? _apiError;

  Object? get apiError => _apiError != null ? _apiError as Object : null;

  set apiError(Object? error) => _apiError = error;
}
