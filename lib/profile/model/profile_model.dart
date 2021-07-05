
class Profile {
  Profile({
    this.id,
    this.category,
    this.ctype,
    this.code,
    this.nameEn,
    this.nameAr,
    this.tenantName,
    this.subscriberName,
    this.commercialName,
    this.email,
    this.phone,
    this.mobile,
    this.status,
    this.groupId,
    this.notes,
    this.balance,
    this.disconnectLimit,
    this.contractTermination,
    this.notificationsCount,
    this.commercialRecord,
    this.projectId,
    this.taxRecord,
  });

  int id;
  dynamic category;
  dynamic ctype;
  dynamic code;
  dynamic nameEn;
  dynamic nameAr;
  dynamic tenantName;
  dynamic subscriberName;
  dynamic commercialName;
  dynamic email;
  dynamic phone;
  dynamic mobile;
  dynamic status;
  dynamic groupId;
  dynamic notes;
  dynamic balance;
  dynamic disconnectLimit;
  dynamic contractTermination;
  dynamic notificationsCount;
  dynamic commercialRecord;
  dynamic projectId;
  dynamic taxRecord;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    category: json["category"],
    ctype: json["ctype"],
    code: json["code"],
    nameEn: json["nameEN"],
    nameAr: json["nameAR"],
    tenantName: json["tenantName"],
    subscriberName: json["subscriberName"],
    commercialName: json["commercialName"],
    email: json["email"],
    phone: json["phone"],
    mobile: json["mobile"],
    status: json["status"],
    groupId: json["groupId"],
    notes: json["notes"],
    balance: json["balance"],
    disconnectLimit: json["disconnectLimit"],
    contractTermination: json["contractTermination"],
    notificationsCount: json["notificationsCount"],
    commercialRecord: json["commercialRecord"],
    projectId: json["projectId"],
    taxRecord: json["taxRecord"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "ctype": ctype,
    "code": code,
    "nameEN": nameEn,
    "nameAR": nameAr,
    "tenantName": tenantName,
    "subscriberName": subscriberName,
    "commercialName": commercialName,
    "email": email,
    "phone": phone,
    "mobile": mobile,
    "status": status,
    "groupId": groupId,
    "notes": notes,
    "balance": balance,
    "disconnectLimit": disconnectLimit,
    "contractTermination": contractTermination,
    "notificationsCount": notificationsCount,
    "commercialRecord": commercialRecord,
    "projectId": projectId,
    "taxRecord": taxRecord,
  };
}

class Account {
  Account({
    this.id,
    this.login,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
    this.activated,
    this.langKey,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.authorities,
  });

  int id;
  String login;
  String firstName;
  String lastName;
  String email;
  dynamic imageUrl;
  bool activated;
  String langKey;
  String createdBy;
  DateTime createdDate;
  String lastModifiedBy;
  DateTime lastModifiedDate;
  List<String> authorities;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    id: json["id"],
    login: json["login"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    imageUrl: json["imageUrl"],
    activated: json["activated"],
    langKey: json["langKey"],
    createdBy: json["createdBy"],
    createdDate: DateTime.parse(json["createdDate"]),
    lastModifiedBy: json["lastModifiedBy"],
    lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
    authorities: List<String>.from(json["authorities"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "login": login,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "imageUrl": imageUrl,
    "activated": activated,
    "langKey": langKey,
    "createdBy": createdBy,
    "createdDate": createdDate.toIso8601String(),
    "lastModifiedBy": lastModifiedBy,
    "lastModifiedDate": lastModifiedDate.toIso8601String(),
    "authorities": List<dynamic>.from(authorities.map((x) => x)),
  };
}
