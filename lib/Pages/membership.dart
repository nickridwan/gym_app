import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_app/services/theme.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
            child: Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                Text(
                  "Member",
                  style: titleColor1,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Premium",
                  style: titleColor2,
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "Choose Premium : ",
                  style: GoogleFonts.lato(fontSize: 25, color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: boxColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "personal",
                        style: GoogleFonts.bebasNeue(
                            fontSize: 32, color: Colors.red),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "trainer",
                        style: titleColor1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: boxColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "member",
                        style: GoogleFonts.bebasNeue(
                            fontSize: 32, color: Colors.red),
                      ),
                      Text(
                        "ship",
                        style: titleColor1,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
