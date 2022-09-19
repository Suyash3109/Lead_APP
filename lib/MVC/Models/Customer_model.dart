// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

List<CustomerModel> customerModelFromJson(String str) =>
    List<CustomerModel>.from(
        json.decode(str).map((x) => CustomerModel.fromJson(x)));

String customerModelToJson(List<CustomerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerModel {
  CustomerModel({
    this.id,
    this.hash,
    this.name,
    this.title,
    this.company,
    this.description,
    this.country,
    this.zip,
    this.city,
    this.state,
    this.address,
    this.assigned,
    this.dateadded,
    this.fromFormId,
    this.status,
    this.source,
    this.lastcontact,
    this.dateassigned,
    this.lastStatusChange,
    this.addedfrom,
    this.email,
    this.website,
    this.leadorder,
    this.phonenumber,
    this.dateConverted,
    this.lost,
    this.junk,
    this.lastLeadStatus,
    this.isImportedFromEmailIntegration,
    this.emailIntegrationUid,
    this.isPublic,
    this.defaultLanguage,
    this.clientId,
    this.leadValue,
    this.statusorder,
    this.color,
    this.isdefault,
    this.statusName,
    this.sourceName,
    this.customfields,
  });

  String? id;
  String? hash;
  String? name;
  Title? title;
  Company? company;
  String? description;
  String? country;
  String? zip;
  City? city;
  States? state;
  String? address;
  String? assigned;
  DateTime? dateadded;
  String? fromFormId;
  String? status;
  String? source;
  DateTime? lastcontact;
  DateTime? dateassigned;
  DateTime? lastStatusChange;
  String? addedfrom;
  String? email;
  Website? website;
  String? leadorder;
  String? phonenumber;
  DateTime? dateConverted;
  String? lost;
  String? junk;
  String? lastLeadStatus;
  String? isImportedFromEmailIntegration;
  dynamic emailIntegrationUid;
  String? isPublic;
  String? defaultLanguage;
  String? clientId;
  String? leadValue;
  String? statusorder;
  Color? color;
  String? isdefault;
  StatusName? statusName;
  SourceName? sourceName;
  List<Customfield>? customfields;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"] == null ? null : json["id"],
        hash: json["hash"] == null ? null : json["hash"],
        name: json["name"] == null ? null : json["name"],
        title: json["title"] == null ? null : titleValues.map[json["title"]],
        company:
            json["company"] == null ? null : companyValues.map[json["company"]],
        description: json["description"] == null ? null : json["description"],
        country: json["country"] == null ? null : json["country"],
        zip: json["zip"] == null ? null : json["zip"],
        city: json["city"] == null ? null : cityValues.map[json["city"]],
        state: json["state"] == null ? null : stateValues.map[json["state"]],
        address: json["address"] == null ? null : json["address"],
        assigned: json["assigned"] == null ? null : json["assigned"],
        dateadded: json["dateadded"] == null
            ? null
            : DateTime.parse(json["dateadded"]),
        fromFormId: json["from_form_id"] == null ? null : json["from_form_id"],
        status: json["status"] == null ? null : json["status"],
        source: json["source"] == null ? null : json["source"],
        lastcontact: json["lastcontact"] == null
            ? null
            : DateTime.parse(json["lastcontact"]),
        dateassigned: json["dateassigned"] == null
            ? null
            : DateTime.parse(json["dateassigned"]),
        lastStatusChange: json["last_status_change"] == null
            ? null
            : DateTime.parse(json["last_status_change"]),
        addedfrom: json["addedfrom"] == null ? null : json["addedfrom"],
        email: json["email"] == null ? null : json["email"],
        website:
            json["website"] == null ? null : websiteValues.map[json["website"]],
        leadorder: json["leadorder"] == null ? null : json["leadorder"],
        phonenumber: json["phonenumber"] == null ? null : json["phonenumber"],
        dateConverted: json["date_converted"] == null
            ? null
            : DateTime.parse(json["date_converted"]),
        lost: json["lost"] == null ? null : json["lost"],
        junk: json["junk"] == null ? null : json["junk"],
        lastLeadStatus:
            json["last_lead_status"] == null ? null : json["last_lead_status"],
        isImportedFromEmailIntegration:
            json["is_imported_from_email_integration"] == null
                ? null
                : json["is_imported_from_email_integration"],
        emailIntegrationUid: json["email_integration_uid"],
        isPublic: json["is_public"] == null ? null : json["is_public"],
        defaultLanguage:
            json["default_language"] == null ? null : json["default_language"],
        clientId: json["client_id"] == null ? null : json["client_id"],
        leadValue: json["lead_value"] == null ? null : json["lead_value"],
        statusorder: json["statusorder"] == null ? null : json["statusorder"],
        color: json["color"] == null ? null : colorValues.map[json["color"]],
        isdefault: json["isdefault"] == null ? null : json["isdefault"],
        statusName: json["status_name"] == null
            ? null
            : statusNameValues.map[json["status_name"]],
        sourceName: json["source_name"] == null
            ? null
            : sourceNameValues.map[json["source_name"]],
        customfields: json["customfields"] == null
            ? null
            : List<Customfield>.from(
                json["customfields"].map((x) => Customfield.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "hash": hash == null ? null : hash,
        "name": name == null ? null : name,
        "title": title == null ? null : titleValues.reverse![title],
        "company": company == null ? null : companyValues.reverse![company],
        "description": description == null ? null : description,
        "country": country == null ? null : country,
        "zip": zip == null ? null : zip,
        "city": city == null ? null : cityValues.reverse![city],
        "state": state == null ? null : stateValues.reverse![state],
        "address": address == null ? null : address,
        "assigned": assigned == null ? null : assigned,
        "dateadded": dateadded == null ? null : dateadded!.toIso8601String(),
        "from_form_id": fromFormId == null ? null : fromFormId,
        "status": status == null ? null : status,
        "source": source == null ? null : source,
        "lastcontact":
            lastcontact == null ? null : lastcontact!.toIso8601String(),
        "dateassigned": dateassigned == null
            ? null
            : "${dateassigned!.year.toString().padLeft(4, '0')}-${dateassigned!.month.toString().padLeft(2, '0')}-${dateassigned!.day.toString().padLeft(2, '0')}",
        "last_status_change": lastStatusChange == null
            ? null
            : lastStatusChange!.toIso8601String(),
        "addedfrom": addedfrom == null ? null : addedfrom,
        "email": email == null ? null : email,
        "website": website == null ? null : websiteValues.reverse![website],
        "leadorder": leadorder == null ? null : leadorder,
        "phonenumber": phonenumber == null ? null : phonenumber,
        "date_converted":
            dateConverted == null ? null : dateConverted!.toIso8601String(),
        "lost": lost == null ? null : lost,
        "junk": junk == null ? null : junk,
        "last_lead_status": lastLeadStatus == null ? null : lastLeadStatus,
        "is_imported_from_email_integration":
            isImportedFromEmailIntegration == null
                ? null
                : isImportedFromEmailIntegration,
        "email_integration_uid": emailIntegrationUid,
        "is_public": isPublic == null ? null : isPublic,
        "default_language": defaultLanguage == null ? null : defaultLanguage,
        "client_id": clientId == null ? null : clientId,
        "lead_value": leadValue == null ? null : leadValue,
        "statusorder": statusorder == null ? null : statusorder,
        "color": color == null ? null : colorValues.reverse![color],
        "isdefault": isdefault == null ? null : isdefault,
        "status_name":
            statusName == null ? null : statusNameValues.reverse![statusName],
        "source_name":
            sourceName == null ? null : sourceNameValues.reverse![sourceName],
        "customfields": customfields == null
            ? null
            : List<dynamic>.from(customfields!.map((x) => x.toJson())),
      };
}

enum City { THANE, MUMBAI, CITY_MUMBAI, EMPTY, NAVI_MUMBAI, NOIDA, DSADASD }

final cityValues = EnumValues({
  "Mumbai": City.CITY_MUMBAI,
  "dsadasd": City.DSADASD,
  "": City.EMPTY,
  "MUMBAI": City.MUMBAI,
  "Navi Mumbai": City.NAVI_MUMBAI,
  "Noida": City.NOIDA,
  "Thane": City.THANE
});

enum Color { THE_28_B8_DA, COLOR_28_B8_DA, THE_7_CB342 }

final colorValues = EnumValues({
  "#28b8da": Color.COLOR_28_B8_DA,
  "#28B8DA": Color.THE_28_B8_DA,
  "#7cb342": Color.THE_7_CB342
});

enum Company { EMPTY, MEDIA_101 }

final companyValues =
    EnumValues({"": Company.EMPTY, "Media 101": Company.MEDIA_101});

class Customfield {
  Customfield({
    this.label,
    this.value,
  });

  Label? label;
  Value? value;

  factory Customfield.fromJson(Map<String, dynamic> json) => Customfield(
        label: json["label"] == null ? null : labelValues.map[json["label"]],
        value: json["value"] == null ? null : valueValues.map[json["value"]],
      );

  Map<String, dynamic> toJson() => {
        "label": label == null ? null : labelValues.reverse![label],
        "value": value == null ? null : valueValues.reverse![value],
      };
}

enum Label { BUDGET, CATEGORY, SUB_CATEGORY, CURRENT_STAGE, CAMPAIGNS }

final labelValues = EnumValues({
  "Budget": Label.BUDGET,
  "Campaigns": Label.CAMPAIGNS,
  "Category": Label.CATEGORY,
  "Current Stage": Label.CURRENT_STAGE,
  "Sub Category": Label.SUB_CATEGORY
});

enum Value {
  EMPTY,
  HOME,
  LIVE,
  NAVRATRI_DIWALI2019,
  NONE,
  NORMAL_CAMPAIGN,
  THE_3_BHK,
  THE_2_BHK,
  THE_4_BHK,
  UNDER_10_L,
  BETWEEN_1020_L,
  THE_1315_L,
  OTHER,
  THE_2628_L,
  THE_4145_L,
  THE_1_BHK,
  OFFICE,
  THE_2931_L,
  THE_1921_L,
  THE_2225_L
}

final valueValues = EnumValues({
  "Between 10 - 20 L": Value.BETWEEN_1020_L,
  "": Value.EMPTY,
  "Home": Value.HOME,
  "Live": Value.LIVE,
  "Navratri_Diwali2019": Value.NAVRATRI_DIWALI2019,
  "None": Value.NONE,
  "Normal_Campaign": Value.NORMAL_CAMPAIGN,
  "Office": Value.OFFICE,
  "Other": Value.OTHER,
  "13 - 15L": Value.THE_1315_L,
  "19-21L": Value.THE_1921_L,
  "1BHK": Value.THE_1_BHK,
  "22 - 25L": Value.THE_2225_L,
  "26 - 28L": Value.THE_2628_L,
  "29 - 31L": Value.THE_2931_L,
  "2BHK": Value.THE_2_BHK,
  "3BHK": Value.THE_3_BHK,
  "41 - 45L": Value.THE_4145_L,
  "4BHK": Value.THE_4_BHK,
  "Under 10 L": Value.UNDER_10_L
});

enum SourceName {
  NEW_SIGN_UP_WEBSITE,
  ONLINE_CAMPAIGN,
  OTHER,
  OFFLINE_BD,
  ROHIT_MALHOTRA
}

final sourceNameValues = EnumValues({
  "New SignUp Website": SourceName.NEW_SIGN_UP_WEBSITE,
  "Offline - BD": SourceName.OFFLINE_BD,
  "Online Campaign": SourceName.ONLINE_CAMPAIGN,
  "Other": SourceName.OTHER,
  "Rohit Malhotra": SourceName.ROHIT_MALHOTRA
});

enum States {
  MAHARASHTRA,
  STATE_MAHARASHTRA,
  MH,
  EMPTY,
  UP,
  ASDASD,
  UTTAR_PRADESH
}

final stateValues = EnumValues({
  "asdasd": States.ASDASD,
  "": States.EMPTY,
  "Maharashtra": States.MAHARASHTRA,
  "MH": States.MH,
  "MAHARASHTRA": States.STATE_MAHARASHTRA,
  "UP": States.UP,
  "Uttar Pradesh": States.UTTAR_PRADESH
});

enum StatusName {
  ASSIGNED_TO_KSHITIJ_MUMBAI,
  NOT_CONNECTED,
  CUSTOMER,
  GET_LAYOUT,
  REQUESTED_FOR_QUOTE,
  FUTURE_LEAD,
  UNDER_7_LACS
}

final statusNameValues = EnumValues({
  "Assigned TO kshitij - Mumbai": StatusName.ASSIGNED_TO_KSHITIJ_MUMBAI,
  "Customer": StatusName.CUSTOMER,
  "Future Lead": StatusName.FUTURE_LEAD,
  "Get Layout": StatusName.GET_LAYOUT,
  "Not Connected": StatusName.NOT_CONNECTED,
  "Requested For Quote": StatusName.REQUESTED_FOR_QUOTE,
  "Under 7 Lacs": StatusName.UNDER_7_LACS
});

enum Title {
  THE_2_BHK_NEW,
  DIRECTOR,
  EMPTY,
  RENOVATION,
  THE_3_BHK,
  THE_2_BHK,
  HOD,
  JFJFJFJF,
  POSITION_A
}

final titleValues = EnumValues({
  "DIRECTOR": Title.DIRECTOR,
  "": Title.EMPTY,
  "HOD": Title.HOD,
  "jfjfjfjf": Title.JFJFJFJF,
  "Position A": Title.POSITION_A,
  "Renovation": Title.RENOVATION,
  "2BHK": Title.THE_2_BHK,
  "2BHK - New": Title.THE_2_BHK_NEW,
  "3BHK": Title.THE_3_BHK
});

enum Website { EMPTY, WWW_TEST_COM }

final websiteValues =
    EnumValues({"": Website.EMPTY, "www.test.com": Website.WWW_TEST_COM});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
