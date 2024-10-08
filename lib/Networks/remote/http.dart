import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

abstract class Authenticator {
  Future<void> login(String email, String password) {
    throw UnimplementedError();
  }

  Future<void> register(String email, String password, String name) {
    throw UnimplementedError();
  }
}

class AuthenticationService implements Authenticator {
  static AuthenticationService? _service;

  AuthenticationService._();

  static AuthenticationService? getService() {
    _service ??= AuthenticationService._();
    return _service;
  }

  @override
  Future<void> login(String email, String password) async {
    final url = Uri.parse('http://192.168.159.66:5000/api/User/login');
    final body = json.encode({'email': email, 'password': password});

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        // Success, handle the response
        Fluttertoast.showToast(
          msg: "Login successful!",
          backgroundColor: Colors.green,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Login successful, but no data returned.",
          backgroundColor: Colors.green,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } else if (response.statusCode == 401) {
      // Unauthorized, handle incorrect password
      final error = json.decode(response.body);
      Fluttertoast.showToast(
        msg: "Incorrect password: ${error['message']}",
        backgroundColor: Colors.red,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Login failed with status: ${response.statusCode}",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  @override
  Future<void> register(String email, String password, String name) async {
    final url = Uri.parse('http://192.168.10.115:5000/api/User/Register');

    final body =
        json.encode({'email': email, 'password': password, 'name': name});

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        // Success, handle the response
        Fluttertoast.showToast(
          msg: "Register successful!",
          backgroundColor: Colors.green,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Register successful, but no data returned.",
          backgroundColor: Colors.green,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } else {
      // Unauthorized, handle incorrect password
      final error = json.decode(response.body);
      Fluttertoast.showToast(
        msg: "Something went wrong: ${error['message']}",
        backgroundColor: Colors.red,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
