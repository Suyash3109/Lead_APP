class usermodel {
  String? firstname;
  String? email;
  String? secondname;
  String? uid;
  String? mobileNO;

  usermodel(
      {this.email, this.firstname, this.secondname, this.uid, this.mobileNO});

  factory usermodel.fromMap(map) {
    return usermodel(
        firstname: map['firstname'],
        secondname: map['secondname'],
        email: map['email'],
        mobileNO: map['mobileNo'],
        uid: map['uid']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstname': firstname,
      'secondname': secondname,
      'email': email,
      'mobileNO': mobileNO,
    };
  }
}
