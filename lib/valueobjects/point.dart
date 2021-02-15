class Point {
  int value;

  Point({this.value});

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      value: json['value']
    );
  }
}