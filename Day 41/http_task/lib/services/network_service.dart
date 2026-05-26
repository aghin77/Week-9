import 'package:http/http.dart' as http;

class NetworkService {
  // Using JSONPlaceholder as a placeholder API for 'Tasks' (todos)
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<void> fetchTasks() async {
    try {
      // 1. HTTP Method: GET request to fetch data
      final url = Uri.parse(_baseUrl);
      final response = await http.get(url);

      // 2. Status Codes: Check if the request was successful (200 OK)
      if (response.statusCode == 200) {
        // 3. Response Body: Print the raw JSON to the console
        print('--- SUCCESS: Status Code ${response.statusCode} ---');
        print('--- RAW JSON RESPONSE ---');
        print(response.body);
      } else {
        print('Failed to fetch tasks. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred during the network request: $e');
    }
  }
}