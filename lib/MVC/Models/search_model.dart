// To parse this JSON data, do
//
//     final searchDetails = searchDetailsFromJson(jsonString);

import 'dart:convert';

List<SearchDetails> searchDetailsFromJson(String str) =>
    List<SearchDetails>.from(
        json.decode(str).map((x) => SearchDetails.fromJson(x)));

String searchDetailsToJson(List<SearchDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchDetails {
  SearchDetails({
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
    this.customfields,
  });

  String? id;
  String? hash;
  String? name;
  String? title;
  dynamic company;
  String? description;
  String? country;
  String? zip;
  String? city;
  String? state;
  String? address;
  String? assigned;
  DateTime? dateadded;
  String? fromFormId;
  String? status;
  String? source;
  DateTime? lastcontact;
  dynamic dateassigned;
  dynamic lastStatusChange;
  String? addedfrom;
  String? email;
  dynamic website;
  String? leadorder;
  String? phonenumber;
  DateTime? dateConverted;
  String? lost;
  String? junk;
  String? lastLeadStatus;
  String? isImportedFromEmailIntegration;
  dynamic emailIntegrationUid;
  String? isPublic;
  dynamic defaultLanguage;
  String? clientId;
  String? leadValue;
  List<Customfield>? customfields;

  factory SearchDetails.fromJson(Map<String, dynamic> json) => SearchDetails(
        id: json["id"] == null ? null : json["id"],
        hash: json["hash"] == null ? null : json["hash"],
        name: json["name"] == null ? null : json["name"],
        title: json["title"] == null ? null : json["title"],
        company: json["company"],
        description: json["description"] == null ? null : json["description"],
        country: json["country"] == null ? null : json["country"],
        zip: json["zip"] == null ? null : json["zip"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
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
        dateassigned: json["dateassigned"],
        lastStatusChange: json["last_status_change"],
        addedfrom: json["addedfrom"] == null ? null : json["addedfrom"],
        email: json["email"] == null ? null : json["email"],
        website: json["website"],
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
        defaultLanguage: json["default_language"],
        clientId: json["client_id"] == null ? null : json["client_id"],
        leadValue: json["lead_value"] == null ? null : json["lead_value"],
        customfields: json["customfields"] == null
            ? null
            : List<Customfield>.from(
                json["customfields"].map((x) => Customfield.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "hash": hash == null ? null : hash,
        "name": name == null ? null : name,
        "title": title == null ? null : title,
        "company": company,
        "description": description == null ? null : description,
        "country": country == null ? null : country,
        "zip": zip == null ? null : zip,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "address": address == null ? null : address,
        "assigned": assigned == null ? null : assigned,
        "dateadded": dateadded == null ? null : dateadded!.toIso8601String(),
        "from_form_id": fromFormId == null ? null : fromFormId,
        "status": status == null ? null : status,
        "source": source == null ? null : source,
        "lastcontact":
            lastcontact == null ? null : lastcontact!.toIso8601String(),
        "dateassigned": dateassigned,
        "last_status_change": lastStatusChange,
        "addedfrom": addedfrom == null ? null : addedfrom,
        "email": email == null ? null : email,
        "website": website,
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
        "default_language": defaultLanguage,
        "client_id": clientId == null ? null : clientId,
        "lead_value": leadValue == null ? null : leadValue,
        "customfields": customfields == null
            ? null
            : List<dynamic>.from(customfields!.map((x) => x.toJson())),
      };
}

class Customfield {
  Customfield({
    this.label,
    this.value,
  });

  String? label;
  String? value;

  factory Customfield.fromJson(Map<String, dynamic> json) => Customfield(
        label: json["label"] == null ? null : json["label"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label == null ? null : label,
        "value": value == null ? null : value,
      };
}
