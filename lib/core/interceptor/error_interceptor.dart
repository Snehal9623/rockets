import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Logger(printer: PrettyPrinter()).e(err);
    if (err.response?.statusCode == 400) {
      err.response?.data = err.response?.data['message'];
    }
    super.onError(err, handler);
  }
}
