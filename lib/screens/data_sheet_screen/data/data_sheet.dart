class DataSheet {
  final int date;
  final String monthName;
  final String subjectName;
  final String dayName;
  final String time;

  DataSheet(
      this.date, this.monthName, this.subjectName, this.dayName, this.time);
}

List<DataSheet> dateSheet = [
  DataSheet(11, 'Mayıs', 'Boyama', 'Pazartesi', '9:00am'),
  DataSheet(12, 'Mayıs', 'El - göz becerisi', 'Salı', '10:00am'),
  DataSheet(13, 'Mayıs', 'Harfleri Tanıma', 'Çarşamba', '9:30am'),
  DataSheet(14, 'Mayıs', 'Oyun', 'Perşembe', '11:00am'),
  DataSheet(15, 'Mayıs', 'Matematik', 'Cuma', '9:00am'),
  DataSheet(16, 'Mayıs', 'Şekilleri Tanıma', 'Cuma', '11:00am'),
];
