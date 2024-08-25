import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> login(String email, String password) async {
  final url = Uri.parse('https://yourapi.com/login');

  final body = json.encode({
    'email': email,
    'password': password,
  });

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      // Success, handle the response
      final data = json.decode(response.body);
      print('Login successful: $data');
    } else if (response.statusCode == 401) {
      // Unauthorized, handle incorrect password
      print('Incorrect password.');
      // Optionally, you could parse the response body for a more detailed error message
      final error = json.decode(response.body);
      print('Error: ${error['message']}');
    } else {
      // Other errors
      print('Login failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}

Future<void> register(
    String email, String password, String name, int age) async {
  final url = Uri.parse('https://yourapi.com/register');

  final body = json.encode(
    {
      'email': email,
      'password': password,
      'name': name,
      'age': age,
    },
  );

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 201) {
      // Registration success
      final data = json.decode(response.body);
      print('Registration successful: $data');
    } else {
      // Error handling
      print('Registration failed: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
