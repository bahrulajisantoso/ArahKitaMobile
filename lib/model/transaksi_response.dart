class TransaksiResponse {
  final int kode;
  final String pesan, kodeTransaksi;

  TransaksiResponse({
    required this.kode,
    required this.pesan,
    required this.kodeTransaksi,
  });

  factory TransaksiResponse.fromJson(Map<String, dynamic> json) {
    return TransaksiResponse(
      kode: json["kode"],
      pesan: json["pesan"],
      kodeTransaksi: json["kode_transaksi"],
    );
  }
}
