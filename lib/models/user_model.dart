class UserModel {
  final int id;
  final String nome;
  final String email;
  final String? telefone;

  UserModel({
    required this.id,
    required this.nome,
    required this.email,
    this.telefone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? json['id_usuario'],
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      telefone: json['telefone'],
    );
  }
}