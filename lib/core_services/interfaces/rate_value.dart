class RateValue {
  final int best;
  final int count;
  final double value;

  RateValue({required this.best, required this.count, required this.value});

  factory RateValue.fromJson(Map<String, dynamic> json) {
    return RateValue(
      best: json['best'],
      count: json['count'],
      value: json['value'].toDouble(),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {'best': best, 'count': count, 'value': value};
  }
}
