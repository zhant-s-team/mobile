// To parse this JSON data, do
//
//     final empresaModel = empresaModelFromJson(jsonString);

import 'dart:convert';

List<EmpresaModel> empresaModelFromJson(String str) => List<EmpresaModel>.from(json.decode(str).map((x) => EmpresaModel.fromJson(x)));

String empresaModelToJson(List<EmpresaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmpresaModel {
    int id;
    DateTime createdAt;
    DateTime updatedAt;
    int empresaId;
    int userId;
    String titulo;
    String descricao;
    String cidadeOrigem;
    String cidadeDestino;
    String tipoVeiculo;
    String carga;
    int percurso;
    String status;
    Empresa empresa;
    User user;

    EmpresaModel({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.empresaId,
        required this.userId,
        required this.titulo,
        required this.descricao,
        required this.cidadeOrigem,
        required this.cidadeDestino,
        required this.tipoVeiculo,
        required this.carga,
        required this.percurso,
        required this.status,
        required this.empresa,
        required this.user,
    });

    factory EmpresaModel.fromJson(Map<String, dynamic> json) => EmpresaModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        empresaId: json["empresa_id"],
        userId: json["user_id"],
        titulo: json["titulo"],
        descricao: json["descricao"],
        cidadeOrigem: json["cidade_origem"],
        cidadeDestino: json["cidade_destino"],
        tipoVeiculo: json["tipo_veiculo"],
        carga: json["carga"],
        percurso: json["percurso"],
        status: json["status"],
        empresa: Empresa.fromJson(json["empresa"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "empresa_id": empresaId,
        "user_id": userId,
        "titulo": titulo,
        "descricao": descricao,
        "cidade_origem": cidadeOrigem,
        "cidade_destino": cidadeDestino,
        "tipo_veiculo": tipoVeiculo,
        "carga": carga,
        "percurso": percurso,
        "status": status,
        "empresa": empresa.toJson(),
        "user": user.toJson(),
    };
}

class Empresa {
    int id;
    int userId;
    String cnpj;
    String nome;
    String rua;
    String bairro;
    String numero;
    String? logo;
    DateTime createdAt;
    DateTime updatedAt;

    Empresa({
        required this.id,
        required this.userId,
        required this.cnpj,
        required this.nome,
        required this.rua,
        required this.bairro,
        required this.numero,
        required this.logo,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
        id: json["id"],
        userId: json["user_id"],
        cnpj: json["cnpj"],
        nome: json["nome"],
        rua: json["rua"],
        bairro: json["bairro"],
        numero: json["numero"],
        logo: json["logo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "cnpj": cnpj,
        "nome": nome,
        "rua": rua,
        "bairro": bairro,
        "numero": numero,
        "logo": logo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class User {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    dynamic cnh;
    int isActive;
    DateTime createdAt;
    DateTime updatedAt;
    int isAdmin;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.cnh,
        required this.isActive,
        required this.createdAt,
        required this.updatedAt,
        required this.isAdmin,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        cnh: json["cnh"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isAdmin: json["is_admin"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "cnh": cnh,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_admin": isAdmin,
    };
}
