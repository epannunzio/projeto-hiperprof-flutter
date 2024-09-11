class Professor {
  String nome, descricao, email;
  double valorAula;
  int? id;
  int idade;
  String? fotoPerfil;

  Professor({
    required this.nome,
    required this.descricao,
    required this.email,
    required this.valorAula,
    required this.idade,
    this.id,
    this.fotoPerfil,
  });

  factory Professor.fromJson(Map<String, dynamic> json) {
    return Professor(
      nome: json['nome'],
      descricao: json['descricao'],
      email: json['email'],
      valorAula: (json['valor_aula'] is String)
          ? double.parse(json['valor_aula'])
          : json['valor_aula']?.toDouble(),
      idade: json['idade'],
      id: json['id'],
      fotoPerfil: json['foto_perfil'],
    );
  }
}
