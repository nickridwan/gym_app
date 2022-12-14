import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

void LoginSheet(context) {
  showModalBottomSheet(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    context: context,
    builder: ((context) {
      return Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Masuk",
                style: GoogleFonts.actor(fontSize: 20, color: Colors.white),
              ),
              Text(
                "(Mohon untuk tidak masuk jika belum memiliki akun)",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.green),
                child: Center(
                  child: Text(
                    "Email atau Nama Anggota",
                    style: GoogleFonts.abel(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }),
  );
}
