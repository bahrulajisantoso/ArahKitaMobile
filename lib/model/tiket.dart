class Tiket {
  String idTiket,
      idUser,
      idWisata,
      idtransaksi,
      kodeTiket,
      tglTiket,
      namaPembeli,
      namaWisata,
      jumlahTiket,
      totalHarga,
      status;

  Tiket(
      {required this.idTiket,
      required this.idUser,
      required this.idWisata,
      required this.idtransaksi,
      required this.kodeTiket,
      required this.tglTiket,
      required this.namaPembeli,
      required this.namaWisata,
      required this.jumlahTiket,
      required this.totalHarga,
      required this.status});

  factory Tiket.fromJson(Map<String, dynamic> json) {
    return Tiket(
      idTiket: json["id"],
      idUser: json["user_mobile_id"],
      idWisata: json["wisata_id"],
      idtransaksi: json["transaksi_id"],
      kodeTiket: json["kode_tiket"],
      tglTiket: json["tgl_tiket"],
      namaPembeli: json["nama_pembeli"],
      namaWisata: json["nama_wisata"],
      jumlahTiket: json["jumlah_tiket"],
      totalHarga: json["total_harga"],
      status: json["status"],
    );
  }
}
