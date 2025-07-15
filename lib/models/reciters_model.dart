class RecitersModel {
  List<Reciter>? reciters;

  RecitersModel({this.reciters});

  RecitersModel.fromJson(Map<String, dynamic> json) {
    if (json['reciters'] != null) {
      reciters = <Reciter>[];
      json['reciters'].forEach((v) {
        reciters!.add(Reciter.fromJson(v));
      });
    }
  }
}

class Reciter {
  int? id;
  String? name;
  String? letter;
  String? date;
  List<Moshaf>? moshaf;

  Reciter({this.id, this.name, this.letter, this.date, this.moshaf});

  Reciter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    letter = json['letter'];
    date = json['date'];
    if (json['moshaf'] != null) {
      moshaf = <Moshaf>[];
      json['moshaf'].forEach((v) {
        moshaf!.add(Moshaf.fromJson(v));
      });
    }
  }
}

class Moshaf {
  int? id;
  String? name;
  String? server;
  int? surahTotal;
  int? moshafType;
  String? surahList;

  Moshaf({
    this.id,
    this.name,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  Moshaf.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    server = json['server'];
    surahTotal = json['surah_total'];
    moshafType = json['moshaf_type'];
    surahList = json['surah_list'];
  }

  // Extract first Surah audio file
  String getFirstAudioUrl() {
    return server != null ? "$server/001.mp3" : "";
  }
}
