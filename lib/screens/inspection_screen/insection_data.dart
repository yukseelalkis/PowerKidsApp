class InspectionData {
  final String absence;
  final String absenteeismWithReport;
  final String absenceWithoutReport;
  final String total;

  InspectionData(this.absence, this.absenteeismWithReport,
      this.absenceWithoutReport, this.total);
}

List<InspectionData> InspectionDatas = [
  InspectionData('DEVAMSIZLIK', '10', '1O', '20'),
];
