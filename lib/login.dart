import 'package:flutter/material.dart';
import 'package:test3/register.dart';

class Login extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.label_important_outlined,
            color: Colors.white,
          ),
          title: const Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          //spaces
          child: SingleChildScrollView(
            //scrollview
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    //space
                    height: 20,
                  ),
                  const Image(
                    image: NetworkImage(
                        "https://th.bing.com/th/id/OIP.F977i9e7dMrznvOT8q8azgHaEf?rs=1&pid=ImgDetMain"),
                    // width: 300,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
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
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                        ),
                      ),
                      obscureText: true, // dots password
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.blue,
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
