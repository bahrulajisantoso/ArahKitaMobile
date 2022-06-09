class Gambar {
  final String gambar1, gambar2, gambar3;

  Gambar({
    required this.gambar1,
    required this.gambar2,
    required this.gambar3,
  });

  factory Gambar.fromJson(Map<String, dynamic> json) {
    return Gambar(
      gambar1: json["gambar_1"],
      gambar2: json["gambar_2"],
      gambar3: json["gambar_3"],
    );
  }
}
