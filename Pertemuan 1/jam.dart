import 'dart:math';

// Kelas untuk menghitung sudut antara jarum jam dan menit
class ClockAngle {
  int hour;
  int minute;

  ClockAngle(this.hour, this.minute);

  // Fungsi untuk menghitung sudut jarum jam dan menit
  Future<double> calculateAngle() async {
    return await Future.delayed(Duration(seconds: 1), () {
      // Pastikan jam berada dalam format 12-jam
      if (hour >= 12) {
        hour = hour - 12;
      }

      // Menghitung posisi jarum jam dan menit dalam derajat
      double minuteAngle = minute * 6; // 1 menit = 6 derajat
      double hourAngle =
          (hour * 30) + (minute * 0.5); // 1 jam = 30 derajat + pengaruh menit

      // Menghitung selisih sudut antara jarum jam dan menit
      double angle = (hourAngle - minuteAngle).abs();

      // Memastikan sudut terkecil antara keduanya (<= 180 derajat)
      return min(360 - angle, angle);
    });
  }
}

// Fungsi utama untuk menjalankan program
void main() async {
  // Membuat objek ClockAngle
  var clock = ClockAngle(9, 00);

  // Menghitung sudut antara jarum jam dan menit
  double angle = await clock.calculateAngle();

  // Menampilkan hasil
  print('Sudut antara jarum jam dan menit adalah: $angle derajat');
}
