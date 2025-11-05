import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndPoint {
  static final String baseURL = dotenv.env['BASE_URL']!;
}
