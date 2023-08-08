class RidesResponse {
  final String? name;
  final DateTime? date;
  bool showTime;

  RidesResponse({
    this.name,
    this.date,
  }) : showTime = false;
}
