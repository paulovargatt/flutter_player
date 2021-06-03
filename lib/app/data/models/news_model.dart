class NewsModel {
  int id = 0;
  int idPlaylist = 0;
  String idBand = '';
  String title = '';
  late String duration;
  late String description;
  late int views;
  late String thumbnailSmall;
  late String thumbnailMedium;
  late String thumbnailLarge;
  late int status;
  late int featured;
  late String createdAt;
  late String updatedAt;
  late String publishedAt;
  late bool notificationAt = false;
  late String playlistTitle;

  NewsModel({
    this.id = 0,
    this.idPlaylist = 0,
    this.idBand = '',
    this.title = '',
    this.duration = '',
    this.description = '',
    this.views = 0,
    this.thumbnailSmall = '',
    this.thumbnailMedium = '',
    this.thumbnailLarge = '',
    this.status = 0,
    this.featured = 0,
    this.createdAt = '',
    this.updatedAt = '',
    this.publishedAt = '',
    this.notificationAt = false,
    this.playlistTitle = '',
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPlaylist = json['id_playlist'];
    idBand = json['id_band'];
    title = json['title'];
    duration = json['duration'];
    description = json['description'];
    views = json['views'];
    thumbnailSmall = json['thumbnail_small'];
    thumbnailMedium = json['thumbnail_medium'];
    thumbnailLarge = json['thumbnail_large'];
    status = json['status'];
    featured = json['featured'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    publishedAt = json['published_at'];
    notificationAt = json['notification_at'];
    playlistTitle = json['playlist_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_playlist'] = this.idPlaylist;
    data['id_band'] = this.idBand;
    data['title'] = this.title;
    data['duration'] = this.duration;
    data['description'] = this.description;
    data['views'] = this.views;
    data['thumbnail_small'] = this.thumbnailSmall;
    data['thumbnail_medium'] = this.thumbnailMedium;
    data['thumbnail_large'] = this.thumbnailLarge;
    data['status'] = this.status;
    data['featured'] = this.featured;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['published_at'] = this.publishedAt;
    data['notification_at'] = this.notificationAt;
    data['playlist_title'] = this.playlistTitle;
    return data;
  }
}
