class Created {
  String? date;
  int? timezoneType;
  String? timezone;

  Created({this.date, this.timezoneType, this.timezone});

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        date: json['date'] as String?,
        timezoneType: json['timezone_type'] as int?,
        timezone: json['timezone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'timezone_type': timezoneType,
        'timezone': timezone,
      };
}
