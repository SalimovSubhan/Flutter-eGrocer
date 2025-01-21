import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:test_relise_app/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double wid(double cnt) {
    return MediaQuery.of(context).size.width * cnt;
  }

  double hei(double cnt) {
    return MediaQuery.of(context).size.height * cnt;
  }

  final _fromKey = GlobalKey<FormState>();
  var phoneNamber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _fromKey,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
            ),
            Container(
              width: double.infinity,
              height: hei(0.45),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/2deLUm2TFJU7h97XWryh.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: hei(0.63),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 46, 44, 44),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Welcome!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "eGrocer!",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: hei(0.027)),
                      TextFormField(
                        controller: phoneNamber,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 35,
                                  height: 25,
                                  child: Image.asset(
                                    "images/Без названия (1).png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "+992",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Заполните это поля";
                          }
                        },
                      ),
                      SizedBox(height: hei(0.035)),
                      SizedBox(
                        height: hei(0.07),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[300],
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            if (_fromKey.currentState!.validate()) {
                            } else {
                            }
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: hei(0.02)),
                      Row(
                        children: [
                          SizedBox(
                            width: wid(0.4),
                            child: DottedLine(
                              dashColor: Colors.grey,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text(
                              "OR",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: wid(0.39),
                            child: DottedLine(
                              dashColor: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: hei(0.02)),
                      SizedBox(
                        height: hei(0.05),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.white),
                              backgroundColor: Color.fromARGB(255, 46, 44, 44),
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                        "images/Google_Icons-09-512.webp"),
                                  )),
                                ),
                                Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                      ),
                      SizedBox(height: hei(0.01)),
                      SizedBox(
                        height: hei(0.05),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.white),
                              backgroundColor: Color.fromARGB(255, 46, 44, 44),
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: Colors.green,
                                    size: 35,
                                  ),
                                ),
                                Text(
                                  "Continue with Email",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                      ),
                      SizedBox(height: hei(0.022)),
                      Divider(),
                      SizedBox(height: hei(0.01)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "By continuing, you agree to  eGrocer`s",
                                  style: TextStyle(color: Colors.grey),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  " Terms of",
                                  style: TextStyle(color: Colors.green),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Servise",
                                  style: TextStyle(color: Colors.green),
                                ),
                                Text(
                                  " and ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "Privacy Policy",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: hei(0.04),
              right: wid(0.04),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BotomNavigattionBar()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
