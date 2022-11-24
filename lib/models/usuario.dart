import 'dart:convert';

class Usuario {
  Usuario({
    required this.estado,
    required this.nombre,
    required this.email,
    required this.uid,
  });

  bool estado;
  String nombre;
  String email;
  String uid;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        estado: json["estado"],
        nombre: json["nombre"],
        email: json["email"],
        uid: json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "nombre": nombre,
        "email": email,
        "uid": uid,
      };
}
