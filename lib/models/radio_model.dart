class RadioModel {
  List<Radios>? radios;

  RadioModel({this.radios});

  RadioModel.fromJson(Map<String, dynamic> json) {
    if (json['radios'] != null) {
      radios = <Radios>[];
      json['radios'].forEach((v) {
        radios!.add(new Radios.fromJson(v));
      });
    }
  }
}

class Radios {
  int? id;
  String? name;
  String? url;
  String? recentDate;

  Radios({this.id, this.name, this.url, this.recentDate});

  Radios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }
}
