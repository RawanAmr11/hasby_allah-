import 'package:flutter/material.dart';
import 'package:test3/login.dart';

class Register extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.label_important_outlined,
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          "Register",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: NetworkImage(
                    "https://th.bing.com/th/id/OIP.F977i9e7dMrznvOT8q8azgHaEf?rs=1&pid=ImgDetMain"),
                // width: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 50,
                child: TextFormField(
                  controller: name,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 50,
                child: TextFormField(
                  controller: age,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Age",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 50,
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 50,
                child: TextFormField(
                  controller: password,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text("Register"),
                ),
              ),
              Container(
                width: 200,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
