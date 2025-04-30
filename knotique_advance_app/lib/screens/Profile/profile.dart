import 'package:crochet/screens/Profile/components/profile_widget.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  // User user;
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  String? profilePic = "";

  // Future<void> getUserInfo() async {
  //   var result = await FirebaseFirestore.instance
  //       .collection("Person")
  //       .doc(widget.user.uid)
  //       .get();

  //   setState(() {
  //     _nameController.text = result["username"];
  //     _emailController.text = result["email"];
  //     _cityController.text = result["city"];
  //     profilePic = result["profilepic"];
  //   });
  // }

  // Future<void> updateInfo() async {
  //   await FirebaseFirestore.instance
  //       .collection("Person")
  //       .doc(widget.user.uid)
  //       .update({
  //     "username": _nameController.text.toString(),
  //     "city": _cityController.text.toString()
  //   });

  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       backgroundColor: Colors.green.shade400,
  //       content: Text("Signed Up Succesfully"),
  //     ),
  //   );

  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => MyHomeScreen(
  //         user: widget.user,
  //       ),
  //     ),
  //   );
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getUserInfo();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 216, 36, 16),
                    const Color.fromARGB(255, 0, 0, 0)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                    "P r o f i l e",
                    style: TextStyle(
                     color: Color.fromARGB(239, 255, 255, 255),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(223, 241, 232, 224).withOpacity(0.5),
                    width: 5.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage("$profilePic"),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * .4,
                child: Row(
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      _nameController.text.toString(),
                      style: TextStyle(
                        color: Color.fromARGB(234, 255, 255, 255),
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: Icon(
                        Icons.done_all_rounded,
                        color: const Color.fromARGB(255, 81, 255, 90),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                _emailController.text.toString(),
                style: TextStyle(
                  color: Color.fromARGB(233, 247, 243, 243),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.height * 0.47,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: TextField(
                        controller: _nameController,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 242, 239, 239),
                        ),
                        decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(174, 255, 255, 255),
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 254, 253, 252),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(0, 240, 237, 237),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 252, 251, 251),
                                width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(173, 255, 255, 255),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
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
                            color: Color.fromARGB(255, 255, 253, 252),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(0, 243, 242, 242),
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
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
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
                            color: Color.fromARGB(255, 248, 247, 246),
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
                                color: Color.fromARGB(255, 238, 237, 236),
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
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        // FirebaseAuth.instance.signOut();
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MyWelcomeScreen()));
                      },
                      child: profile_widget(
                        icon: Icons.logout,
                        title: "Log Out",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 92, 49, 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {

                    // updateInfo();
                    // Navigator.pop(context);
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
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
