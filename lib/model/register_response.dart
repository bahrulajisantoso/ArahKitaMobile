class ResponseRegister {
  int? kode;
  String? pesan;

  ResponseRegister({
    this.kode,
    this.pesan,
  });

  factory ResponseRegister.fromJson(Map<String, dynamic> json) {
    return ResponseRegister(
      kode: json["kode"],
      pesan: json["pesan"],
    );
  }
}
