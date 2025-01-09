```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        if (jsonData is List) {
          return jsonData.cast<Map<String, dynamic>>();
        } else {
          print('Unexpected JSON response structure. Expected a List.');
          return null; // or throw an exception
        }
      } catch (e) {
        print('Error decoding JSON: $e');
        return null; // or throw an exception
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    rethrow; // Re-throw the exception to be handled higher up.
  }
}
```