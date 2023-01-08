class School {
  String? schoolName;
  String? location;
  String? tell;
  String? fax;
  String? urlHome;
  String? urlStudyRoom;
  String? urlShuttle;
  String? urlNotice;
  String? urlCalendar;
  String? urlLibrary;

  School(
      {this.schoolName,
      this.location,
      this.tell,
      this.fax,
      this.urlHome,
      this.urlStudyRoom,
      this.urlShuttle,
      this.urlNotice,
      this.urlCalendar,
      this.urlLibrary});

  School.fromJson(Map<String, dynamic> json) {
    schoolName = json['schoolName'];
    location = json['location'];
    tell = json['tell'];
    fax = json['fax'];
    urlHome = json['urlHome'];
    urlStudyRoom = json['urlStudyRoom'];
    urlShuttle = json['urlShuttle'];
    urlNotice = json['urlNotice'];
    urlCalendar = json['urlCalendar'];
    urlLibrary = json['urlLibrary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['schoolName'] = schoolName;
    data['location'] = location;
    data['tell'] = tell;
    data['fax'] = fax;
    data['urlHome'] = urlHome;
    data['urlStudyRoom'] = urlStudyRoom;
    data['urlShuttle'] = urlShuttle;
    data['urlNotice'] = urlNotice;
    data['urlCalendar'] = urlCalendar;
    data['urlLibrary'] = urlLibrary;
    return data;
  }
}
