class Dosen {
  int id;
  String dosenid;
  String nama;
  String fakultas;
  String prodi;
  String email;
  Dosen({
    required this.id,
    required this.dosenid,
    required this.nama,
    required this.fakultas,
    required this.prodi,
    required this.email,
  });

  Dosen copyWith({
    int? id,
    String? dosenid,
    String? name,
    String? fakultas,
    String? prodi,
    String? email,
  }) {
    return Dosen(
      id: id ?? this.id,
      dosenid: dosenid ?? this.dosenid,
      nama: name ?? nama,
      fakultas: fakultas ?? this.fakultas,
      prodi: prodi ?? this.prodi,
      email: email ?? this.email,
    );
  }

  factory Dosen.fromJson1(Map<String, dynamic> json) => Dosen(
        id: json["id"],
        dosenid: json["dosenid"],
        nama: json["nama"],
        fakultas: json["fakultas"],
        prodi: json["prodi"],
        email: json["email"],
      );

  Map<String, dynamic> toJson1() => {
        "id": id,
        "dosenid": dosenid,
        "nama": nama,
        "fakultas": fakultas,
        "prodi": prodi,
        "email": email,
      };

  @override
  String toString() {
    return 'Dosen(id: $id, dosenid: $dosenid, name: $nama, fakultas: $fakultas, prodi: $prodi, email: $email)';
  }
}
