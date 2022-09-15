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
    this.userid,
    this.company,
    this.vat,
    this.phonenumber,
    this.country,
    this.city,
    this.zip,
    this.state,
    this.address,
    this.website,
    this.datecreated,
    this.active,
    this.leadid,
    this.billingStreet,
    this.billingCity,
    this.billingState,
    this.billingZip,
    this.billingCountry,
    this.shippingStreet,
    this.shippingCity,
    this.shippingState,
    this.shippingZip,
    this.shippingCountry,
    this.longitude,
    this.latitude,
    this.defaultLanguage,
    this.defaultCurrency,
    this.showPrimaryContact,
    this.stripeId,
    this.registrationConfirmed,
    this.addedfrom,
    this.customfields,
  });

  String? userid;
  String? company;
  String? vat;
  Phonenumber? phonenumber;
  String? country;
  City? city;
  String? zip;
  States? state;
  String? address;
  String? website;
  DateTime? datecreated;
  String? active;
  String? leadid;
  String? billingStreet;
  City? billingCity;
  States? billingState;
  String? billingZip;
  String? billingCountry;
  String? shippingStreet;
  String? shippingCity;
  String? shippingState;
  String? shippingZip;
  String? shippingCountry;
  dynamic longitude;
  dynamic latitude;
  String? defaultLanguage;
  String? defaultCurrency;
  String? showPrimaryContact;
  dynamic stripeId;
  String? registrationConfirmed;
  String? addedfrom;
  List<Customfield>? customfields;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        userid: json["userid"],
        company: json["company"],
        vat: json["vat"],
        phonenumber: json["phonenumber"] == null
            ? null
            : phonenumberValues.map[json["phonenumber"]],
        country: json["country"],
        city: json["city"] == null ? null : cityValues.map[json["city"]],
        zip: json["zip"],
        state: json["state"] == null ? null : stateValues.map[json["state"]],
        address: json["address"],
        website: json["website"],
        datecreated: json["datecreated"] == null
            ? null
            : DateTime.parse(json["datecreated"]),
        active: json["active"],
        leadid: json["leadid"],
        billingStreet: json["billing_street"],
        billingCity: json["billing_city"] == null
            ? null
            : cityValues.map[json["billing_city"]],
        billingState: json["billing_state"] == null
            ? null
            : stateValues.map[json["billing_state"]],
        billingZip: json["billing_zip"],
        billingCountry: json["billing_country"],
        shippingStreet: json["shipping_street"],
        shippingCity: json["shipping_city"],
        shippingState: json["shipping_state"],
        shippingZip: json["shipping_zip"],
        shippingCountry: json["shipping_country"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        defaultLanguage: json["default_language"],
        defaultCurrency: json["default_currency"],
        showPrimaryContact: json["show_primary_contact"],
        stripeId: json["stripe_id"],
        registrationConfirmed: json["registration_confirmed"],
        addedfrom: json["addedfrom"],
        customfields: json["customfields"] == null
            ? null
            : List<Customfield>.from(
                json["customfields"].map((x) => Customfield.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "company": company,
        "vat": vat,
        "phonenumber": phonenumber == null
            ? null
            : phonenumberValues.reverse![phonenumber],
        "country": country,
        "city": city == null ? null : cityValues.reverse![city],
        "zip": zip,
        "state": state == null ? null : stateValues.reverse![state],
        "address": address,
        "website": website,
        "datecreated":
            datecreated == null ? null : datecreated!.toIso8601String(),
        "active": active,
        "leadid": leadid,
        "billing_street": billingStreet,
        "billing_city":
            billingCity == null ? null : cityValues.reverse![billingCity],
        "billing_state":
            billingState == null ? null : stateValues.reverse![billingState],
        "billing_zip": billingZip,
        "billing_country": billingCountry,
        "shipping_street": shippingStreet,
        "shipping_city": shippingCity,
        "shipping_state": shippingState,
        "shipping_zip": shippingZip,
        "shipping_country": shippingCountry,
        "longitude": longitude,
        "latitude": latitude,
        "default_language": defaultLanguage,
        "default_currency": defaultCurrency,
        "show_primary_contact": showPrimaryContact,
        "stripe_id": stripeId,
        "registration_confirmed": registrationConfirmed,
        "addedfrom": addedfrom,
        "customfields": customfields == null
            ? null
            : List<dynamic>.from(customfields!.map((x) => x.toJson())),
      };
}

enum City { MUMBAI, EMPTY, CITY_MUMBAI, PUNE }

final cityValues = EnumValues({
  "Mumbai": City.CITY_MUMBAI,
  "": City.EMPTY,
  "MUMBAI": City.MUMBAI,
  "Pune": City.PUNE
});

enum States { MAHARASHTRA, EMPTY, STATE_MAHARASHTRA, MAHARASTRA }

final stateValues = EnumValues({
  "": States.EMPTY,
  "MAHARASHTRA": States.MAHARASHTRA,
  "Maharastra": States.MAHARASTRA,
  "Maharashtra": States.STATE_MAHARASHTRA
});

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
        "label": label == null ? null : labelValues.reverse?[label],
        "value": value == null ? null : valueValues.reverse?[value],
      };
}

enum Label {
  CATEGORY,
  SUB_CATEGORY,
  ASSIGNED_TO_DESIGN_PARTNER,
  CURRENT_STAGE,
  CAMPAIGNS
}

final labelValues = EnumValues({
  "Assigned to Design Partner": Label.ASSIGNED_TO_DESIGN_PARTNER,
  "Campaigns": Label.CAMPAIGNS,
  "Category": Label.CATEGORY,
  "Current Stage": Label.CURRENT_STAGE,
  "Sub Category": Label.SUB_CATEGORY
});

enum Value {
  HOME,
  EMPTY,
  NONE,
  NORMAL_CAMPAIGN,
  OFFICE,
  THE_1_BHK,
  THE_2_BHK,
  COMMERCIAL,
  THE_3_BHK,
  LIVE
}

final valueValues = EnumValues({
  "Commercial": Value.COMMERCIAL,
  "": Value.EMPTY,
  "Home": Value.HOME,
  "Live": Value.LIVE,
  "None": Value.NONE,
  "Normal_Campaign": Value.NORMAL_CAMPAIGN,
  "Office": Value.OFFICE,
  "1BHK": Value.THE_1_BHK,
  "2BHK": Value.THE_2_BHK,
  "3BHK": Value.THE_3_BHK
});

enum Phonenumber { THE_9004878040, EMPTY, THE_8369780517, THE_7982751866 }

final phonenumberValues = EnumValues({
  "": Phonenumber.EMPTY,
  "7982751866": Phonenumber.THE_7982751866,
  "8369780517": Phonenumber.THE_8369780517,
  "9004878040": Phonenumber.THE_9004878040
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap;
    return reverseMap;
  }
}
