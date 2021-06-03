class VideoModel {
  int id = 0;
  String title = '';
  String videoStreaming = '';
  String thumbnail = '';
  String description = '';

  VideoModel({this.id = 0, this.title = '', this.videoStreaming = ''});

  VideoModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.videoStreaming = json['video_streaming'];
    this.thumbnail = json['thumbnail'];
    this.description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['video_streaming'] = this.videoStreaming;
    data['thumbnail'] = this.thumbnail;
    data['description'] = this.thumbnail;
    return data;
  }
}
