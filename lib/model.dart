class MatchesModel {
  String? id;
  String? venue;
  String? location;
  String? status;
  String? stageName;
  String? time;
  TimeExtraInfo? timeExtraInfo;
  HomeTeam? homeTeam;
  HomeTeam? awayTeam;
  List<Officials>? officials;
  String? createdAt;
  String? date;
  String? updatedAt;
  String? winner;

  MatchesModel(
      {this.id,
      this.venue,
      this.location,
      this.status,
      this.stageName,
      this.time,
      this.timeExtraInfo,
      this.homeTeam,
      this.awayTeam,
      this.officials,
      this.createdAt,
      this.date,
      this.updatedAt,
      this.winner});

  MatchesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venue = json['venue'];
    location = json['location'];
    status = json['status'];
    stageName = json['stageName'];
    time = json['time'];
    timeExtraInfo = json['timeExtraInfo'] != null
        ? new TimeExtraInfo.fromJson(json['timeExtraInfo'])
        : null;
    homeTeam = json['homeTeam'] != null
        ? new HomeTeam.fromJson(json['homeTeam'])
        : null;
    awayTeam = json['awayTeam'] != null
        ? new HomeTeam.fromJson(json['awayTeam'])
        : null;
    if (json['officials'] != null) {
      officials = <Officials>[];
      json['officials'].forEach((v) {
        officials!.add(new Officials.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    date = json['date'];
    updatedAt = json['updatedAt'];
    winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['venue'] = this.venue;
    data['location'] = this.location;
    data['status'] = this.status;
    data['stageName'] = this.stageName;
    data['time'] = this.time;
    if (this.timeExtraInfo != null) {
      data['timeExtraInfo'] = this.timeExtraInfo!.toJson();
    }
    if (this.homeTeam != null) {
      data['homeTeam'] = this.homeTeam!.toJson();
    }
    if (this.awayTeam != null) {
      data['awayTeam'] = this.awayTeam!.toJson();
    }
    if (this.officials != null) {
      data['officials'] = this.officials!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['date'] = this.date;
    data['updatedAt'] = this.updatedAt;
    data['winner'] = this.winner;
    return data;
  }
}

class TimeExtraInfo {
  String? current;
  Null? firstHalfTime;
  Null? firstHalfExtraTime;
  Null? secondHalfTime;
  Null? secondHalfExtraTime;

  TimeExtraInfo(
      {this.current,
      this.firstHalfTime,
      this.firstHalfExtraTime,
      this.secondHalfTime,
      this.secondHalfExtraTime});

  TimeExtraInfo.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    firstHalfTime = json['firstHalfTime'];
    firstHalfExtraTime = json['firstHalfExtraTime'];
    secondHalfTime = json['secondHalfTime'];
    secondHalfExtraTime = json['secondHalfExtraTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['firstHalfTime'] = this.firstHalfTime;
    data['firstHalfExtraTime'] = this.firstHalfExtraTime;
    data['secondHalfTime'] = this.secondHalfTime;
    data['secondHalfExtraTime'] = this.secondHalfExtraTime;
    return data;
  }
}

class HomeTeam {
  String? country;
  int? goals;
  String? name;
  int? penalties;

  HomeTeam({this.country, this.goals, this.name, this.penalties});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    goals = json['goals'];
    name = json['name'];
    penalties = json['penalties'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['goals'] = this.goals;
    data['name'] = this.name;
    data['penalties'] = this.penalties;
    return data;
  }
}

class Officials {
  String? name;
  String? role;
  String? country;

  Officials({this.name, this.role, this.country});

  Officials.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    role = json['role'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['role'] = this.role;
    data['country'] = this.country;
    return data;
  }
}
