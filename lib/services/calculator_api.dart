import 'package:dio/dio.dart';

class CalculatorApi {
  final Dio _dio = Dio();

  Future<String> calculate(String expression) async {
    try {
      final encoded = Uri.encodeComponent(expression);
      final response = await _dio.get(
        'https://api.mathjs.org/v4/',
        queryParameters: {'expr': encoded},
      );
      return response.data.toString();
    } catch (e) {
      return 'Ошибка';
    }
  }
}