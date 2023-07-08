//* Constants For Api Service
enum ApiMessage {
  success,
  internalServerError,
  somethingWantWrongError,
  apiError,
  permissionError
}

extension ApiMessageExtension on ApiMessage {
  String get asString {
    switch (this) {
      case ApiMessage.apiError:
        return 'Api Error';
      case ApiMessage.internalServerError:
        return 'Internal Server Error';
      case ApiMessage.somethingWantWrongError:
        return 'Something Want Wrong';
      case ApiMessage.success:
        return 'Success';
      case ApiMessage.permissionError:
        return 'Permission Denied';
      default:
        return 'Something Want Wrong';
    }
  }
}

class ApiResponse {
  dynamic data;
  int? dataCount;
  ApiMessage? message;

  ApiResponse({this.data, this.message, this.dataCount});
}
