import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      // addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  // static void addDioHeaders() async {
  //   dio?.options.headers = {
  //     'Accept': 'application/json',
  //     'Authorization':
  //         'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}',
  //   };
  // }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      CustomDioLogger(),
    );
  }
}

class CustomDioLogger extends PrettyDioLogger {
  final bool requestHeader, requestBody, responseBody, error, compact;
  final int maxWidth;
  CustomDioLogger({
    this.requestHeader = false,
    this.requestBody = false,
    this.responseBody = true,
    this.error = true,
    this.compact = true,
    this.maxWidth = 90,
  }) : super(
          requestHeader: requestHeader,
          requestBody: requestBody,
          responseBody: responseBody,
          error: error,
          compact: compact,
          maxWidth: maxWidth,
        );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      logPrint('🔴 Response Data: ${err.response?.data}');
      logPrint('🔴 Status Code: ${err.response?.statusCode}');
      logPrint('🔴 Headers: ${err.response?.headers}');
    } else if (err.message != null) {
      logPrint('🔴 Error Message: ${err.message}');
    } else {
      logPrint('🔴 Error Details: ${err.error}');
    }
    super.onError(err, handler);
  }
}
