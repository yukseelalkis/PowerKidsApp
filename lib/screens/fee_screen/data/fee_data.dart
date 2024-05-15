class FeeData {
  final String receiptNo;
  final String month;
  final String date;
  final String paymentStatus;
  final String totalAmount;
  final String btnStatus;

  FeeData(this.receiptNo, this.month, this.date, this.paymentStatus,
      this.totalAmount, this.btnStatus);
}

List<FeeData> fee = [
  FeeData('90871', 'OCAK', '8 OCAK 2023', 'Askıda olması', '1980\₺', 'Ödeme'),
  FeeData(
      '90870', 'Şubat', '8 ŞUBAT 2023', 'Paid', '1080\₺', 'Ödeme Yapılmadı'),
  FeeData('908869', 'MART', '8 MART 2023', 'Paid', '1950\₺', 'Ödeme Yapılmadı'),
];
