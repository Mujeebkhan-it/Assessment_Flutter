import 'package:crochet/screens/Login/loginScreen.dart';
import 'package:crochet/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  String? profilepic = "";
  String? gender;

  // Future<void> registerUser(
  //     String? userName, String? email, String? password) async {
  //   UserCredential userCredential = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email!, password: password!);

  //   User? user = userCredential.user;

  //   print("---------->>>>${user!.uid}");

  //   await FirebaseFirestore.instance.collection("Person").doc(user.uid).set({
  //     "username": userName,
  //     "email": email,
  //     "profilepic": profilepic,
  //     "city": ""
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 209, 11, 11),
                    const Color.fromARGB(255, 0, 0, 0)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/Lottie/Register.json',
                      height: 250,
                    ),
                    const Text(
                      "Welcome Dear",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(174, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: _nameController,
                        style: const TextStyle(
                          color: Color.fromARGB(174, 255, 255, 255),
                        ),
                        decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(174, 255, 255, 255),
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(0, 235, 233, 233),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(174, 255, 255, 255),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: _emailController,
                        style: const TextStyle(
                          color: Color.fromARGB(174, 255, 255, 255),
                        ),
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(174, 255, 255, 255),
                          ),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(174, 255, 255, 255),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: const TextStyle(
                          color: Color.fromARGB(174, 255, 255, 255),
                        ),
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(174, 255, 255, 255),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 246, 245, 243),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(0, 247, 244, 244),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 239, 239, 239),
                                width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(174, 255, 255, 255),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: _cityController,
                        style: const TextStyle(
                          color: Color.fromARGB(174, 255, 255, 255),
                        ),
                        decoration: InputDecoration(
                          labelText: "City",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(174, 255, 255, 255),
                          ),
                          prefixIcon: const Icon(
                            Icons.location_city,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(255, 255, 255, 0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 243, 242, 241),
                                width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(174, 255, 255, 255),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          Expanded(
                            child: RadioListTile(
                              activeColor:  const Color.fromARGB(255, 232, 197, 23),
                              title: const Text(
                                "Male",
                                style: TextStyle(
                                  color: Color.fromARGB(174, 255, 255, 255),
                                ),
                              ),
                              value: "Male",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                  profilepic =
                                      "https://img.freepik.com/premium-photo/cute-handsome-anime-boy-wear-yellow-hoodie_675932-371.jpg";
                                });
                              },
                              visualDensity: VisualDensity.compact,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              activeColor: const Color.fromARGB(255, 232, 197, 23),
                              title: const Text(
                                "Female",
                                style: TextStyle(
                                  color: Color.fromARGB(174, 255, 255, 255),
                                ),
                              ),
                              value: "Female",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                  profilepic =
                                      "https://img.freepik.com/premium-photo/cute-handsome-anime-boy-wear-yellow-hoodie_675932-371.jpg";
                                });
                              },
                              visualDensity: VisualDensity.compact,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // registerUser(_nameController.text,
                            //     _emailController.text, _passwordController.text);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomescreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 92, 49, 6),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already a member?",
                          style: TextStyle(
                            color: Color.fromARGB(174, 255, 255, 255),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 246, 245, 245),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
