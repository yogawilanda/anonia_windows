import 'package:anonia_windows/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey.shade800,
          primaryColor: Colors.white),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://static.vecteezy.com/system/resources/thumbnails/002/027/488/small/illustration-of-sign-in-page-login-website-page-and-form-people-with-smartphone-screen-vector.jpg'),
            ),
            LoginInterface(),
          ],
        ),
      ),
    );
  }
}

class LoginInterface extends StatelessWidget {
  const LoginInterface({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey.shade400;
      }
      return Colors.white;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: const Text(
              'Login',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Container(
            color: Colors.grey.shade200,
            child: const TextField(
              decoration: InputDecoration(),
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Container(
            color: Colors.grey.shade200,
            child: const TextField(
              decoration: InputDecoration(),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 36),
            child: ButtonBar(
              buttonPadding: EdgeInsetsDirectional.only(top: 15),
              alignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                  width: 70,
                  child: TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.resolveWith(getColor)),
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                ),
                SizedBox(
                  width: 36,
                ),
                SizedBox(
                  height: 35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith(getColor)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    child: const Text('Register',
                        style:
                            TextStyle(color: Color.fromARGB(255, 48, 47, 47))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
