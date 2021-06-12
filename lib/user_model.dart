// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) {
  return List<UserModel>.from(json.decode(str).map((x) {
    return UserModel.fromJson(x as Map<String,dynamic>);
  }) as List);
}

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    UserModel({
        this.telecom,
        this.extension,
        this.timestamp,
        this.gender,
        this.birthdate,
        this.name,
        this.resourceType,
        this.phrId,
        this.address,
    });

    Telecom? telecom;
    Extension? extension;
    DateTime? timestamp;
    Gender? gender;
    DateTime? birthdate;
    Address? name;
    String? resourceType;
    String? phrId;
    Address? address;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        telecom: Telecom.fromJson(json["telecom"] as Map<String, dynamic>),
        extension: Extension.fromJson(json["extension"] as Map<String,dynamic>),
        timestamp: DateTime.parse(json["timestamp"].toString()),
        gender: Gender.fromJson(json["gender"] as Map<String, dynamic>),
        birthdate: DateTime.parse(json["birthdate"].toString()),
        name: Address.fromJson(json["name"] as Map<String, dynamic>),
        resourceType: json["resourceType"].toString(),
        phrId: json["phr_id"].toString(),
        address: Address.fromJson(json["address"] as Map<String, dynamic>),
    );

    Map<String, dynamic> toJson() => {
        "telecom": telecom?.toJson(),
        // ignore: cast_nullable_to_non_nullable
        "extension": extension?.toJson(),
        "gender": gender?.toJson(),
        "birthdate": "${birthdate!.year.toString().padLeft(4, '0')}-${birthdate!.month.toString().padLeft(2, '0')}-${birthdate!.day.toString().padLeft(2, '0')}",
        "name": name?.toJson(),
        "resourceType": resourceType,
        "address": address?.toJson(),
    };
}

class Address {
    Address({
        this.text,
    });

    String? text;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        text: json["text"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "text": text,
    };
}

class Extension {
    Extension({
        this.nik,
        this.bpjs,
    });

    Nik? nik;
    Bpjs? bpjs;

    factory Extension.fromJson(Map<String, dynamic> json) => Extension(
        nik: Nik.fromJson(json["nik"] as Map<String,dynamic>),
        bpjs: Bpjs.fromJson(json["bpjs"] as Map<String,dynamic>),
    );

    Map<String, dynamic> toJson() => {
        "nik": nik!.toJson(),
        "bpjs": bpjs!.toJson(),
    };
}

class Bpjs {
    Bpjs({
        this.valueString,
        this.system,
    });

    String? valueString;
    String? system;

    factory Bpjs.fromJson(Map<String, dynamic> json) => Bpjs(
        valueString: json["valueStringbpjs"].toString(),
        system: json["systembpjs"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "valueString": valueString,
        "system": system,
    };
}

class Nik {
    Nik({
        this.system,
        this.valueString,
    });

    String? system;
    String? valueString;

    factory Nik.fromJson(Map<String, dynamic> json) => Nik(
        system: json["system"].toString(),
        valueString: json["valueString"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "system": system,
        "valueString": valueString,
    };
}


class Gender {
    Gender({
        this.display,
        this.system,
        this.code,
    });

    String? display;
    String? system;
    String? code;

    factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        display: json["display"].toString(),
        system: json["system"].toString(),
        code: json["code"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "display": display,
        "system": system,
        "code": code,
    };
}

class Telecom {
    Telecom({
        this.value,
    });

    String? value;

    factory Telecom.fromJson(Map<String, dynamic> json) => Telecom(
        value: json["value"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "value": value,
    };
}
