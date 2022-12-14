final List PopulerPlaces = [
  "Jakarta Utara",
  "Jakarta Selatan",
  "Jakarta Barat",
  "Jakarta Timur",
  "Tangerang",
  "Depok"
];

final List StandartPlaces = [
  "Bandung",
  "Bali",
  "Cirebon",
  "Yogyakarta",
  "Semarang",
  "Palembang",
];

class clubDummy {
  String? club_id;
  clubDummy({
    this.club_id,
  });
}

class foodCalory {
  String? food;
  int? protein;
  int? lemak;
  int? karbohidrat;
  int? kalori;
  foodCalory(
      {this.protein, this.lemak, this.karbohidrat, this.kalori, this.food});
}
