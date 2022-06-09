class Wisata {
  final String? id,
      namaWisata,
      kategori,
      lokasi,
      hargaTiket,
      deskripsi,
      gambar1,
      gambar2,
      gambar3;

  Wisata({
    this.id,
    this.namaWisata,
    this.kategori,
    this.deskripsi,
    this.lokasi,
    this.hargaTiket,
    this.gambar1,
    this.gambar2,
    this.gambar3,
  });

  factory Wisata.fromJson(Map<String, dynamic> json) {
    return Wisata(
      id: json["id"].toString(),
      namaWisata: json["nama_wisata"],
      kategori: json["kategori"],
      deskripsi: json["deskripsi"],
      lokasi: json["lokasi"],
      hargaTiket: json["harga_tiket"],
      gambar1: json["gambar_1"],
      gambar2: json["gambar_2"],
      gambar3: json["gambar_3"],
    );
  }
}
