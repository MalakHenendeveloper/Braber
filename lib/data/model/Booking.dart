class Booking {
  String ?id;
  String nameservice;
  String name;
  String date;
  String time;
  Booking(
      {required this.name,
      required this.date,
      required this.time,
        required this.nameservice,
       this.id
      });
  Booking.fromjson(Map<String, dynamic> json)
      : this(
            name: json['name'] as String,
            date: json['date'] as String,
            id: json['id'] as String,
      nameservice:json['nameservice'] as String,
            time: json['time'] as String);
  Map<String, dynamic> tojson() {
    return {'name': name, 'date': date, 'time': time, 'id': id,
      'nameservice':nameservice
    };
  }
}
