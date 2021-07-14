class pageresponse {

  String id;
  int number;
  int start;
  int end;

  pageresponse ({this.id, this.number, this.start, this.end});
  factory pageresponse.fromJson(Map<String, dynamic> json) =>
      pageresponse( id :json['id'], number : json['number'], start : json['start'], end : json['end']
      );
}