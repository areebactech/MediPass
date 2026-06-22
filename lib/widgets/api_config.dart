import 'package:shared_preferences/shared_preferences.dart';

class ApiConfig {
  static const String _geminiApiKey = 'gemini_api_key';

  /// Get the saved Gemini API key from local storage.
  static Future<String?> getApiKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_geminiApiKey);
  }

  /// Save a new Gemini API key to local storage.
  static Future<bool> setApiKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_geminiApiKey, key.trim());
  }

  /// Clear the saved Gemini API key from local storage.
  static Future<bool> clearApiKey() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(_geminiApiKey);
  }
}
