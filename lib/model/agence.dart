class Agence {
  final String title;
  final String ville;
  final String contact;
  final String horaire;
  final String lat;
  final String lng;

  Agence(this.title, this.ville, this.contact, this.horaire, this.lat, this.lng);

// factory Bank.fromJson(Map<String, dynamic> json) {
//   return Bank(
//     index: json['id'],
//     title: json['student_name'],
//     image: json['student_phone_number'],
//   );
// }
}