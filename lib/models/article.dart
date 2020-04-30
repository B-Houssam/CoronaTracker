class Article {
  final int confirmed;
  final int deaths;
  final int recovered;
  final String date;

  Article({
    this.confirmed,
    this.deaths,
    this.recovered,
    this.date,
  });

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      confirmed: map['Confirmed'],
      deaths: map['Deaths'],
      recovered: map['Recovered'],
      date: map['Date'],
    );
  }
}
