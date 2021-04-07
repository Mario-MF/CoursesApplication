class TeacherModel {
  dynamic status;
  Result result;

  TeacherModel({this.status, this.result});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  dynamic currentPage;
  List<Teacher> data;
  dynamic firstPageUrl;
  dynamic from;
  dynamic lastPage;
  dynamic lastPageUrl;
  dynamic nextPageUrl;
  dynamic path;
  dynamic perPage;
  dynamic prevPageUrl;
  dynamic to;
  dynamic total;

  Result(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Result.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<Teacher>();
      json['data'].forEach((v) {
        data.add(new Teacher.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Teacher {
  dynamic id;
  dynamic uuid;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  dynamic dob;
  dynamic phone;
  dynamic gender;
  dynamic address;
  dynamic city;
  dynamic pincode;
  dynamic state;
  dynamic country;
  dynamic avatarType;
  dynamic avatarLocation;
  dynamic passwordChangedAt;
  dynamic active;
  dynamic confirmationCode;
  dynamic confirmed;
  dynamic timezone;
  dynamic lastLoginAt;
  dynamic lastLoginIp;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  dynamic fullName;
  dynamic image;
  dynamic teacherProfile;

  Teacher(
      {this.id,
        this.uuid,
        this.firstName,
        this.lastName,
        this.email,
        this.dob,
        this.phone,
        this.gender,
        this.address,
        this.city,
        this.pincode,
        this.state,
        this.country,
        this.avatarType,
        this.avatarLocation,
        this.passwordChangedAt,
        this.active,
        this.confirmationCode,
        this.confirmed,
        this.timezone,
        this.lastLoginAt,
        this.lastLoginIp,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.fullName,
        this.image,
        this.teacherProfile});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    dob = json['dob'];
    phone = json['phone'];
    gender = json['gender'];
    address = json['address'];
    city = json['city'];
    pincode = json['pincode'];
    state = json['state'];
    country = json['country'];
    avatarType = json['avatar_type'];
    avatarLocation = json['avatar_location'];
    passwordChangedAt = json['password_changed_at'];
    active = json['active'];
    confirmationCode = json['confirmation_code'];
    confirmed = json['confirmed'];
    timezone = json['timezone'];
    lastLoginAt = json['last_login_at'];
    lastLoginIp = json['last_login_ip'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    fullName = json['full_name'];
    image = json['image'];
    teacherProfile = json['teacher_profile'] != null
        ? new TeacherProfile.fromJson(json['teacher_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['state'] = this.state;
    data['country'] = this.country;
    data['avatar_type'] = this.avatarType;
    data['avatar_location'] = this.avatarLocation;
    data['password_changed_at'] = this.passwordChangedAt;
    data['active'] = this.active;
    data['confirmation_code'] = this.confirmationCode;
    data['confirmed'] = this.confirmed;
    data['timezone'] = this.timezone;
    data['last_login_at'] = this.lastLoginAt;
    data['last_login_ip'] = this.lastLoginIp;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['full_name'] = this.fullName;
    data['image'] = this.image;
    if (this.teacherProfile != null) {
      data['teacher_profile'] = this.teacherProfile.toJson();
    }
    return data;
  }
}

class TeacherProfile {
  dynamic id;
  dynamic userId;
  dynamic facebookLink;
  dynamic twitterLink;
  dynamic linkedinLink;
  dynamic paymentMethod;
  dynamic paymentDetails;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  TeacherProfile(
      {this.id,
        this.userId,
        this.facebookLink,
        this.twitterLink,
        this.linkedinLink,
        this.paymentMethod,
        this.paymentDetails,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  TeacherProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    facebookLink = json['facebook_link'];
    twitterLink = json['twitter_link'];
    linkedinLink = json['linkedin_link'];
    paymentMethod = json['payment_method'];
    paymentDetails = json['payment_details'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['facebook_link'] = this.facebookLink;
    data['twitter_link'] = this.twitterLink;
    data['linkedin_link'] = this.linkedinLink;
    data['payment_method'] = this.paymentMethod;
    data['payment_details'] = this.paymentDetails;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
