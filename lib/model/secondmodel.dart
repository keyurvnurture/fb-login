// To parse this JSON data, do
//
//     final secondmodel = secondmodelFromJson(jsonString);

import 'dart:convert';

Secondmodel secondmodelFromJson(String str) => Secondmodel.fromJson(json.decode(str));

String secondmodelToJson(Secondmodel data) => json.encode(data.toJson());

class Secondmodel {
  String message;
  Response response;

  Secondmodel({
    this.message,
    this.response,
  });

  factory Secondmodel.fromJson(Map<String, dynamic> json) => Secondmodel(
    message: json["message"],
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "response": response.toJson(),
  };
}

class Response {
  int currentPage;
  int pageLimit;
  int totalRecords;
  int totalPages;
  List<ListElement> list;

  Response({
    this.currentPage,
    this.pageLimit,
    this.totalRecords,
    this.totalPages,
    this.list,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    currentPage: json["currentPage"],
    pageLimit: json["pageLimit"],
    totalRecords: json["totalRecords"],
    totalPages: json["totalPages"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "pageLimit": pageLimit,
    "totalRecords": totalRecords,
    "totalPages": totalPages,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  int logId;
  int loginId;
  Status postStatus;
  String createdOn;
  String errorMsg;
  Is isBoostPost;
  String returnId;
  String postDate;
  String accountUrl;
  String accountUsername;
  Status systemBaseStatus;
  Is isPaused;
  Is isDeleted;
  String profilePicture;
  String uniqueId;
  Is isLocked;
  String color;
  int accountId;
  String scenario;
  CompanyName companyName;
  int logDataId;
  String postTitle;
  String postDesc;
  List<String> postImage;
  String postUrl;
  String postExtraParams;
  String postVideo;
  PostType postType;
  Via via;
  String longPostDesc;
  AccessType accessType;
  String redirectUrl;
  ForamtedPostDate foramtedPostDate;
  List<String> thumbImage;
  bool isAdvancePost;

  ListElement({
    this.logId,
    this.loginId,
    this.postStatus,
    this.createdOn,
    this.errorMsg,
    this.isBoostPost,
    this.returnId,
    this.postDate,
    this.accountUrl,
    this.accountUsername,
    this.systemBaseStatus,
    this.isPaused,
    this.isDeleted,
    this.profilePicture,
    this.uniqueId,
    this.isLocked,
    this.color,
    this.accountId,
    this.scenario,
    this.companyName,
    this.logDataId,
    this.postTitle,
    this.postDesc,
    this.postImage,
    this.postUrl,
    this.postExtraParams,
    this.postVideo,
    this.postType,
    this.via,
    this.longPostDesc,
    this.accessType,
    this.redirectUrl,
    this.foramtedPostDate,
    this.thumbImage,
    this.isAdvancePost,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    logId: json["logId"],
    loginId: json["loginId"],
    postStatus: statusValues.map[json["postStatus"]],
    createdOn: json["createdOn"],
    errorMsg: json["errorMsg"],
    isBoostPost: isValues.map[json["isBoostPost"]],
    returnId: json["returnId"],
    postDate: json["postDate"],
    accountUrl: json["accountUrl"],
    accountUsername: json["accountUsername"],
    systemBaseStatus: statusValues.map[json["systemBaseStatus"]],
    isPaused: isValues.map[json["isPaused"]],
    isDeleted: isValues.map[json["isDeleted"]],
    profilePicture: json["profilePicture"],
    uniqueId: json["uniqueId"],
    isLocked: isValues.map[json["isLocked"]],
    color: json["color"],
    accountId: json["accountId"],
    scenario: json["scenario"],
    companyName: companyNameValues.map[json["companyName"]],
    logDataId: json["logDataId"],
    postTitle: json["postTitle"],
    postDesc: json["postDesc"],
    postImage: List<String>.from(json["postImage"].map((x) => x)),
    postUrl: json["postUrl"],
    postExtraParams: json["postExtraParams"],
    postVideo: json["postVideo"],
    postType: postTypeValues.map[json["postType"]],
    via: viaValues.map[json["via"]],
    longPostDesc: json["longPostDesc"],
    accessType: accessTypeValues.map[json["accessType"]],
    redirectUrl: json["redirectUrl"],
    foramtedPostDate: foramtedPostDateValues.map[json["foramtedPostDate"]],
    thumbImage: List<String>.from(json["thumbImage"].map((x) => x)),
    isAdvancePost: json["isAdvancePost"],
  );

  Map<String, dynamic> toJson() => {
    "logId": logId,
    "loginId": loginId,
    "postStatus": statusValues.reverse[postStatus],
    "createdOn": createdOn,
    "errorMsg": errorMsg,
    "isBoostPost": isValues.reverse[isBoostPost],
    "returnId": returnId,
    "postDate": postDate,
    "accountUrl": accountUrl,
    "accountUsername": accountUsername,
    "systemBaseStatus": statusValues.reverse[systemBaseStatus],
    "isPaused": isValues.reverse[isPaused],
    "isDeleted": isValues.reverse[isDeleted],
    "profilePicture": profilePicture,
    "uniqueId": uniqueId,
    "isLocked": isValues.reverse[isLocked],
    "color": color,
    "accountId": accountId,
    "scenario": scenario,
    "companyName": companyNameValues.reverse[companyName],
    "logDataId": logDataId,
    "postTitle": postTitle,
    "postDesc": postDesc,
    "postImage": List<dynamic>.from(postImage.map((x) => x)),
    "postUrl": postUrl,
    "postExtraParams": postExtraParams,
    "postVideo": postVideo,
    "postType": postTypeValues.reverse[postType],
    "via": viaValues.reverse[via],
    "longPostDesc": longPostDesc,
    "accessType": accessTypeValues.reverse[accessType],
    "redirectUrl": redirectUrl,
    "foramtedPostDate": foramtedPostDateValues.reverse[foramtedPostDate],
    "thumbImage": List<dynamic>.from(thumbImage.map((x) => x)),
    "isAdvancePost": isAdvancePost,
  };
}

enum AccessType { O }

final accessTypeValues = EnumValues({
  "O": AccessType.O
});

enum CompanyName { AARON, NEHALKUMAR_PATE1 }

final companyNameValues = EnumValues({
  "Aaron": CompanyName.AARON,
  "NehalkumarPate1": CompanyName.NEHALKUMAR_PATE1
});

enum ForamtedPostDate { INVALID_DATE }

final foramtedPostDateValues = EnumValues({
  "Invalid Date": ForamtedPostDate.INVALID_DATE
});

enum Is { N }

final isValues = EnumValues({
  "N": Is.N
});

enum Status { Y }

final statusValues = EnumValues({
  "Y": Status.Y
});

enum PostType { V, T, I }

final postTypeValues = EnumValues({
  "I": PostType.I,
  "T": PostType.T,
  "V": PostType.V
});

enum Via { WEB, CSV, MOBILE_APP }

final viaValues = EnumValues({
  "Csv": Via.CSV,
  "Mobile App": Via.MOBILE_APP,
  "Web": Via.WEB
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
