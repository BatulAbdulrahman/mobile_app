class DoctorsData {
  final String? name, phone, specialty, evaluate, id;

  DoctorsData({this.specialty, this.name, this.phone, this.evaluate, this.id});
}

List<DoctorsData> demoDoctorsData = [
  DoctorsData(
    id: '123',
    name: 'رؤى',
    phone: '01032021',
    specialty: 'عيون',
    evaluate: '5',
  ),
  DoctorsData(
    id: '123',
    name: 'بتول',
    phone: '27022021',
    specialty: 'أطفال',
    evaluate: '5',
  ),
  DoctorsData(
    id: '1234',
    name: 'بتول',
    phone: '23022021',
    specialty: 'جراحة',
    evaluate: '5',
  ),
  DoctorsData(
    id: '12345',
    name: 'رؤى',
    phone: '21022021',
    specialty: 'عظام',
    evaluate: '5',
  ),
  DoctorsData(
    id: '123456',
    name: 'رؤى',
    phone: '23022021',
    specialty: 'أعصاب',
    evaluate: '5',
  ),
  DoctorsData(
    id: '1234567',
    name: 'بتول',
    phone: '25022021',
    specialty: 'جلدية',
    evaluate: '5',
  ),
  DoctorsData(
    id: '12345678',
    name: 'بتول',
    phone: '25022021',
    specialty: 'نساء وولادة',
    evaluate: '5',
  ),
];
