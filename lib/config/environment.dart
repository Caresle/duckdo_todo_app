import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(fileName: '.env');
  }

  // Supabase
  static String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  static String supabaseAnon = dotenv.env['SUPABASE_ANON'] ?? '';
  static String supabaseServiceRole = dotenv.env['SUPABASE_SERVICE_ROLE'] ?? '';
}
