class Tiket {
  String? idTiket,
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
      {this.idTiket,
      this.idUser,
      this.idWisata,
      this.idtransaksi,
      this.kodeTiket,
      this.tglTiket,
      this.namaPembeli,
      this.namaWisata,
      this.jumlahTiket,
      this.totalHarga,
      this.status});

  factory Tiket.fromJson(Map<String, dynamic> json) {
    return Tiket(
      idTiket: json["id"].toString(),
      idUser: json["user_mobile_id"].toString(),
      idWisata: json["wisata_id"].toString(),
      idtransaksi: json["transaksi_id"].toString(),
      kodeTiket: json["transaksi_id"],
      tglTiket: json["transaksi_id"],
      namaPembeli: json["lokasi"],
      namaWisata: json["harga_tiket"],
      jumlahTiket: json["gambar_1"],
      totalHarga: json["gambar_1"],
      status: json["gambar_1"],
    );
  }
}
