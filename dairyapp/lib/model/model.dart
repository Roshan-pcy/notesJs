// ignore_for_file: public_member_api_docs, sort_constructors_first
class Model {
  String? id;
  String? userid;
  String? title;
  String? content;
  DateTime? dateadded;
  Model({
    this.id,
    this.userid,
    this.title,
    this.content,
    this.dateadded,
  });
  factory Model.fromMAp(Map<String, dynamic> map) {
    return Model(
        id: map['id'],
        userid: map['userid'],
        title: map['title'],
        content: map['content'],
        dateadded: DateTime.tryParse(map['dateadded']));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userid': userid,
      'title': title,
      'content': content,
      'dateadded': dateadded!.toIso8601String(),
    };
  }
}
