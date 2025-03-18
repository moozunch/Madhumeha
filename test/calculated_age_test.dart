import 'package:flutter_test/flutter_test.dart';

int calculateAge(DateTime birthDate) {
  DateTime today = DateTime.now();
  int age = today.year - birthDate.year;
  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }
  return age;
}

void main() {
  test('Calculate age correctly', () {
    expect(calculateAge(DateTime(2000, 3, 18)), equals(DateTime.now().year - 2000));
    expect(calculateAge(DateTime(1990, 12, 31)), equals(DateTime.now().year - 1990 - 1));
  });
}
