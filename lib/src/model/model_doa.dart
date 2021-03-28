class ModelDoa {
  int id;
  String doaName;
  String image;
  String namaUstad;
  String arabic;
  String read;

  ModelDoa(
      {this.id,
        this.doaName,
        this.image,
        this.namaUstad,
        this.arabic,
        this.read});

  ModelDoa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doaName = json['doa_name'];
    image = json['image'];
    namaUstad = json['nama_ustad'];
    arabic = json['arabic'];
    read = json['read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doa_name'] = this.doaName;
    data['image'] = this.image;
    data['nama_ustad'] = this.namaUstad;
    data['arabic'] = this.arabic;
    data['read'] = this.read;
    return data;
  }
}