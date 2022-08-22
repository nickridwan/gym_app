import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_app/Widget/dropdown.dart';
import 'package:workout_app/services/theme.dart';

class PageCalculate extends StatefulWidget {
  const PageCalculate({Key? key}) : super(key: key);

  @override
  State<PageCalculate> createState() => PageCalculateState();
}

class PageCalculateState extends State<PageCalculate> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController manySportController = TextEditingController();
  TextEditingController manyEatController = TextEditingController();
  TextEditingController manController = TextEditingController();
  TextEditingController womanController = TextEditingController();
  bool manGender = false;
  bool womanGender = false;
  MethodModel? AgeValue;
  ManyActivity? ActivityValue;
  ManyEating? EatValue;

  void genderValue() {
    setState(() {
      !manGender
          ? womanGender
          : !womanGender
              ? manGender
              : !manGender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: boxColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kalorimeter",
                    style: titleColor1,
                  ),
                  IconButton(
                    onPressed: () {
                      print("light mode");
                    },
                    icon: Icon(
                      Icons.light_mode,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Checkbox(
                                activeColor: Colors.green,
                                value: manGender,
                                onChanged: (bool? value) {
                                  setState(() {
                                    manGender = value!;
                                    genderValue();
                                    print("Pria");
                                  });
                                }),
                            Text(
                              "Pria",
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 20, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 1,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Checkbox(
                                activeColor: Colors.green,
                                value: womanGender,
                                onChanged: (bool? value) {
                                  setState(() {
                                    womanGender = value!;
                                    genderValue();
  
                                    print("Wanita");
                                  });
                                }),
                            Text(
                              "Wanita",
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 20, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: DropdownButtonFormField<MethodModel>(
                      decoration: InputDecoration.collapsed(
                          hintText: "Masukan Umur",
                          hintStyle: TextStyle(color: Colors.white)),
                      value: AgeValue,
                      dropdownColor: boxColor,
                      iconEnabledColor: Colors.white,
                      items: methodData
                          .map((e) => DropdownMenuItem<MethodModel>(
                                child: Text(
                                  e.age ?? "-",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          AgeValue = val!;
                          print("Umur ${val.age}");
                        });
                      }),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  child: TextFormField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration.collapsed(
                      hintText: "Tinggi Badan (meters)",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    onFieldSubmitted: (value) {
                      setState(() {
                        print("Tinggi badan ${heightController.text}");
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  child: TextFormField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration.collapsed(
                      hintText: "Berat Badan  (kilograms)",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    onFieldSubmitted: (value) {
                      setState(() {
                        print("Berat badan ${weightController.text}");
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: DropdownButtonFormField<ManyActivity>(
                      decoration: InputDecoration.collapsed(
                          hintText: "Seberapa Sering Berolah Raga",
                          hintStyle: TextStyle(color: Colors.white)),
                      value: ActivityValue,
                      dropdownColor: boxColor,
                      iconEnabledColor: Colors.white,
                      items: manySportData
                          .map((e) => DropdownMenuItem<ManyActivity>(
                                child: Text(
                                  e.many ?? "-",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          ActivityValue = value!;
                          print("${value.many} Berolah raga");
                        });
                      }),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: DropdownButtonFormField<ManyEating>(
                      decoration: InputDecoration.collapsed(
                          hintText: "Berapa kali Makan sehari",
                          hintStyle: TextStyle(color: Colors.white)),
                      value: EatValue,
                      dropdownColor: boxColor,
                      iconEnabledColor: Colors.white,
                      items: manyEatData
                          .map((e) => DropdownMenuItem<ManyEating>(
                                child: Text(
                                  e.Eat ?? "-",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          EatValue = value!;
                          print("makan ${value.Eat} sehari");
                        });
                      }),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  print("All result");
                },
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Text(
                      "Hitung",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<MethodModel> methodData = [
    MethodModel(
      '18',
    ),
    MethodModel(
      "19",
    ),
    MethodModel(
      '20',
    ),
    MethodModel(
      '21',
    ),
    MethodModel(
      '22',
    ),
    MethodModel(
      '23',
    ),
    MethodModel(
      '24',
    ),
    MethodModel(
      '25',
    ),
    MethodModel(
      '26',
    ),
    MethodModel(
      '27',
    ),
    MethodModel(
      '28',
    ),
    MethodModel(
      '29',
    ),
    MethodModel(
      '30',
    ),
  ];
  List<ManyActivity> manySportData = [
    ManyActivity("Sangat Jarang"),
    ManyActivity("Jarang"),
    ManyActivity("Normal"),
    ManyActivity("Sering"),
    ManyActivity("Sangat Sering"),
  ];
  List<ManyEating> manyEatData = [
    ManyEating("1X"),
    ManyEating("2X"),
    ManyEating("3X"),
    ManyEating("4X"),
    ManyEating("5X"),
  ];
}
