```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Incorrect handling of JSON response.  Assuming it's always a List<Map<String, dynamic>>.
      final jsonData = jsonDecode(response.body) as List<Map<String, dynamic>>;
      // ... process jsonData ...
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    // No rethrow; silently fails.
  }
}
```