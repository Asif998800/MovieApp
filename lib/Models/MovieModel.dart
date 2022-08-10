class MovieModel {
  String? status;
  List<Data>? data;

  MovieModel({this.status, this.data});

  MovieModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Ratings? ratings;
  String? description;
  bool? live;
  String? thumbnail;
  String? cloudinaryBannerId;
  String? launchDate;
  String? cloudinaryThumbnailId;
  String? cloudinaryVideoId;
  bool? launchFlag;
  String? video;
  int? views;
  String? id;
  String? directors;
  String? type;
  String? year;
  String? image;
  String? genres;
  String? languages;
  String? runtimeStr;
  String? plot;
  String? writers;
  String? sId;
  String? title;
  String? madeBy;
  String? studioId;
  List<ActorsList>? actorsList;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? banner;
  String? category;

  Data(
      {this.ratings,
        this.description,
        this.live,
        this.thumbnail,
        this.cloudinaryBannerId,
        this.launchDate,
        this.cloudinaryThumbnailId,
        this.cloudinaryVideoId,
        this.launchFlag,
        this.video,
        this.views,
        this.id,
        this.directors,
        this.type,
        this.year,
        this.image,
        this.genres,
        this.languages,
        this.runtimeStr,
        this.plot,
        this.writers,
        this.sId,
        this.title,
        this.madeBy,
        this.studioId,
        this.actorsList,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.banner,
        this.category});

  Data.fromJson(Map<String, dynamic> json) {
    ratings =
    json['Ratings'] != null ? new Ratings.fromJson(json['Ratings']) : null;
    description = json['description'];
    live = json['live'];
    thumbnail = json['thumbnail'];
    cloudinaryBannerId = json['cloudinaryBanner_id'];
    launchDate = json['launchDate'];
    cloudinaryThumbnailId = json['cloudinaryThumbnail_id'];
    cloudinaryVideoId = json['cloudinaryVideo_id'];
    launchFlag = json['launch_flag'];
    video = json['video'];
    views = json['views'];
    id = json['Id'];
    directors = json['directors'];
    type = json['type'];
    year = json['year'];
    image = json['image'];
    genres = json['genres'];
    languages = json['Languages'];
    runtimeStr = json['RuntimeStr'];
    plot = json['Plot'];
    writers = json['Writers'];
    sId = json['_id'];
    title = json['title'];
    madeBy = json['madeBy'];
    studioId = json['studio_id'];
    if (json['Actors_list'] != null) {
      actorsList = <ActorsList>[];
      json['Actors_list'].forEach((v) {
        actorsList!.add(new ActorsList.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    banner = json['banner'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ratings != null) {
      data['Ratings'] = this.ratings!.toJson();
    }
    data['description'] = this.description;
    data['live'] = this.live;
    data['thumbnail'] = this.thumbnail;
    data['cloudinaryBanner_id'] = this.cloudinaryBannerId;
    data['launchDate'] = this.launchDate;
    data['cloudinaryThumbnail_id'] = this.cloudinaryThumbnailId;
    data['cloudinaryVideo_id'] = this.cloudinaryVideoId;
    data['launch_flag'] = this.launchFlag;
    data['video'] = this.video;
    data['views'] = this.views;
    data['Id'] = this.id;
    data['directors'] = this.directors;
    data['type'] = this.type;
    data['year'] = this.year;
    data['image'] = this.image;
    data['genres'] = this.genres;
    data['Languages'] = this.languages;
    data['RuntimeStr'] = this.runtimeStr;
    data['Plot'] = this.plot;
    data['Writers'] = this.writers;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['madeBy'] = this.madeBy;
    data['studio_id'] = this.studioId;
    if (this.actorsList != null) {
      data['Actors_list'] = this.actorsList!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['banner'] = this.banner;
    data['category'] = this.category;
    return data;
  }
}

class Ratings {
  String? imDb;
  String? metacritic;
  String? theMovieDb;
  String? rottenTomatoes;
  String? tVCom;
  String? filmAffinity;

  Ratings(
      {this.imDb,
        this.metacritic,
        this.theMovieDb,
        this.rottenTomatoes,
        this.tVCom,
        this.filmAffinity});

  Ratings.fromJson(Map<String, dynamic> json) {
    imDb = json['imDb'];
    metacritic = json['metacritic'];
    theMovieDb = json['theMovieDb'];
    rottenTomatoes = json['rottenTomatoes'];
    tVCom = json['tV_com'];
    filmAffinity = json['filmAffinity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imDb'] = this.imDb;
    data['metacritic'] = this.metacritic;
    data['theMovieDb'] = this.theMovieDb;
    data['rottenTomatoes'] = this.rottenTomatoes;
    data['tV_com'] = this.tVCom;
    data['filmAffinity'] = this.filmAffinity;
    return data;
  }
}

class ActorsList {
  String? sId;
  String? id;
  String? image;
  String? name;
  String? asCharacter;

  ActorsList({this.sId, this.id, this.image, this.name, this.asCharacter});

  ActorsList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    asCharacter = json['asCharacter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['asCharacter'] = this.asCharacter;
    return data;
  }
}