import 'package:flutter/material.dart';
import 'package:workout_app/Widget/login_sheet.dart';
import 'package:workout_app/services/theme.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            heightFactor: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () => print("berhasil"),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStatePropertyAll(boxColor)),
                          onPressed: () {},
                          child: Text(
                            "Saya Pengguna Baru",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      LoginSheet(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border(
                              top: BorderSide(
                                  color: Colors.green,
                                  style: BorderStyle.solid),
                              bottom: BorderSide(
                                  color: Colors.green,
                                  style: BorderStyle.solid),
                              left: BorderSide(
                                  color: Colors.green,
                                  style: BorderStyle.solid),
                              right: BorderSide(
                                  color: Colors.green,
                                  style: BorderStyle.solid))),
                      child: Center(
                        child: Text(
                          "Saya sudah punya akun",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
