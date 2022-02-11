// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
//Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

//String welcomeToJson(Welcome data) => json.encode(data.toJson());

class CustomeDetails {
    CustomeDetails({
        required this.response,
        required this.status,
    });

    Response response;
    Status status;

    factory CustomeDetails.fromJson(Map<String, dynamic> json) => CustomeDetails(
        response: Response.fromJson(json["response"]),
        status: Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "status": status.toJson(),
    };
}

class Response {
    Response({
        this.address,
        this.documents,
       // this.customerMfDetails,
       // this.customerLogin,
      //  this.nominee,
        this.fatca,
        this.bankDetailsArray,
        required this.customer,
    });

    Address? address;
    List<Document>? documents;
   // CustomerMfDetails? customerMfDetails;
  //  CustomerLogin? customerLogin;
   // Nominee? nominee;
    Fatca? fatca;
    List<BankDetailsArray>? bankDetailsArray;
    Customer customer;

    factory Response.fromJson(Map<String, dynamic>? json) => Response(
        address: Address.fromJson(json?["address"]),
        documents: List<Document>.from(json?["documents"].map((x) => Document.fromJson(x))),
      //  customerMfDetails: CustomerMfDetails.fromJson(json["customerMfDetails"]),
      //  customerLogin: CustomerLogin.fromJson(json["customerLogin"]),
        //nominee: Nominee.fromJson(json["nominee"]),
        fatca: Fatca.fromJson(json?["fatca"]),
        bankDetailsArray: List<BankDetailsArray>.from(json?["bankDetailsArray"].map((x) => BankDetailsArray.fromJson(x))),
        customer: Customer.fromJson(json?["customer"]),
    );

    Map<String, dynamic> toJson() => {
        "address": address?.toJson(),
        "documents": List<dynamic>.from(documents!.map((x) => x.toJson())),
       // "customerMfDetails": customerMfDetails?.toJson(),
        //"customerLogin": customerLogin?.toJson(),
       // "nominee": nominee?.toJson(),
        "fatca": fatca?.toJson(),
        "bankDetailsArray": List<dynamic>.from(bankDetailsArray!.map((x) => x.toJson())),
        "customer": customer.toJson(),
    };
}

class Address {
    Address({
        required this.custAddressId,
        this.residenceAddress,
        this.residenceCity,
        this.residenceState,
        this.residenceCountry,
        this.residencePincode,
        this.communicationAddress,
        this.communicationCity,
        this.communicationState,
        this.communicationCountry,
        this.communicationPincode,
        this.addressStatus,
        this.customer,
        this.updatedTimestamp,
        this.createdTimestamp,
        this.communcatinStateName,
    });

    int? custAddressId;
    String? residenceAddress;
    String? residenceCity;
    CommunicationCountry? residenceState;
    CommunicationCountry? residenceCountry;
    String? residencePincode;
    String? communicationAddress;
    String? communicationCity;
    CommunicationCountry? communicationState;
    CommunicationCountry? communicationCountry;
    String? communicationPincode;
    int? addressStatus;
    dynamic customer;
    int? updatedTimestamp;
    int? createdTimestamp;
    String? communcatinStateName;

    factory Address.fromJson(Map<String, dynamic>? json) => Address(
        custAddressId: json?["custAddressId"],
        residenceAddress: json?["residenceAddress"],
        residenceCity: json?["residenceCity"],
        residenceState: CommunicationCountry.fromJson(json?["residenceState"]),
        residenceCountry: CommunicationCountry.fromJson(json?["residenceCountry"]),
        residencePincode: json?["residencePincode"],
        communicationAddress: json?["communicationAddress"],
        communicationCity: json?["communicationCity"],
        communicationState: CommunicationCountry.fromJson(json?["communicationState"]),
        communicationCountry: CommunicationCountry.fromJson(json?["communicationCountry"]),
        communicationPincode: json?["communicationPincode"],
        addressStatus: json?["addressStatus"],
        customer: json?["customer"],
        updatedTimestamp: json?["updatedTimestamp"],
        createdTimestamp: json?["createdTimestamp"],
        communcatinStateName: json?["communcatinStateName"],
    );

    Map<String, dynamic> toJson() => {
        "custAddressId": custAddressId,
        "residenceAddress": residenceAddress,
        "residenceCity": residenceCity,
        "residenceState": residenceState?.toJson(),
        "residenceCountry": residenceCountry?.toJson(),
        "residencePincode": residencePincode,
        "communicationAddress": communicationAddress,
        "communicationCity": communicationCity,
        "communicationState": communicationState?.toJson(),
        "communicationCountry": communicationCountry?.toJson(),
        "communicationPincode": communicationPincode,
        "addressStatus": addressStatus,
        "customer": customer,
        "updatedTimestamp": updatedTimestamp,
        "createdTimestamp": createdTimestamp,
        "communcatinStateName": communcatinStateName,
    };
}

class CommunicationCountry {
    CommunicationCountry({
        required this.keyId,
        this.keyValue,
        this.keyType,
        this.addInfo,
    });

    int? keyId;
    String? keyValue;
    String? keyType;
    String? addInfo;

    factory CommunicationCountry.fromJson(Map<String, dynamic>? json) => CommunicationCountry(
        keyId: json?["keyId"],
        keyValue: json?["keyValue"],
        keyType: json?["keyType"],
        addInfo: json?["addInfo"],
    );

    Map<String, dynamic> toJson() => {
        "keyId": keyId,
        "keyValue": keyValue,
        "keyType": keyType,
        "addInfo": addInfo,
    };
}

class BankDetailsArray {
    BankDetailsArray({
        this.bankDetails,
        this.bank,
    });

    BankDetails? bankDetails;
    Bank? bank;

    factory BankDetailsArray.fromJson(Map<String, dynamic> json) => BankDetailsArray(
        bankDetails: BankDetails.fromJson(json["bankDetails"]),
        bank: Bank.fromJson(json["bank"]),
    );

    Map<String, dynamic> toJson() => {
        "bankDetails": bankDetails?.toJson(),
        "bank": bank?.toJson(),
    };
}

class Bank {
    Bank({
        required this.custBankId,
        required this.bankAcctNo,
        required this.bankAcctType,
        required this.bankMicr,
        required this.bankIfsc,
        required this.bankKeyValue,
        required this.customerDocument,
        required this.bankDetailStatus,
        required this.isDefault,
        required this.customer,
        required  this.validationCode,
        required this.updatedTimestamp,
        required this.createdTimestamp,
        this.signzyOnboardingId,
        this.signzyMerchantId,
        this.signzyUserLoginToken,
        this.tokenValidTill,
        this.nameInBank,
        this.signzyReferenceId,
    });

    int? custBankId;
    String? bankAcctNo;
    int? bankAcctType;
    String? bankMicr;
    String? bankIfsc;
    CommunicationCountry? bankKeyValue;
    dynamic customerDocument;
    int? bankDetailStatus;
    bool? isDefault;
    Customer? customer;
    CommunicationCountry? validationCode;
    int? updatedTimestamp;
    int? createdTimestamp;
    dynamic signzyOnboardingId;
    dynamic signzyMerchantId;
    dynamic signzyUserLoginToken;
    dynamic tokenValidTill;
    dynamic nameInBank;
    dynamic signzyReferenceId;

    factory Bank.fromJson(Map<String, dynamic>? json) => Bank(
        custBankId: json?["custBankId"],
        bankAcctNo: json?["bankAcctNo"],
        bankAcctType: json?["bankAcctType"],
        bankMicr: json?["bankMicr"],
        bankIfsc: json?["bankIfsc"],
        bankKeyValue: CommunicationCountry.fromJson(json?["bankKeyValue"]),
        customerDocument: json?["customerDocument"],
        bankDetailStatus: json?["bankDetailStatus"],
        isDefault: json?["isDefault"],
        customer: Customer.fromJson(json?["customer"]),
        validationCode: CommunicationCountry.fromJson(json?["validationCode"]),
        updatedTimestamp: json?["updatedTimestamp"],
        createdTimestamp: json?["createdTimestamp"],
        signzyOnboardingId: json?["signzyOnboardingId"],
        signzyMerchantId: json?["signzyMerchantId"],
        signzyUserLoginToken: json?["signzyUserLoginToken"],
        tokenValidTill: json?["tokenValidTill"],
        nameInBank: json?["nameInBank"],
        signzyReferenceId: json?["signzyReferenceId"],
    );

    Map<String, dynamic> toJson() => {
        "custBankId": custBankId,
        "bankAcctNo": bankAcctNo,
        "bankAcctType": bankAcctType,
        "bankMicr": bankMicr,
        "bankIfsc": bankIfsc,
        "bankKeyValue": bankKeyValue?.toJson(),
        "customerDocument": customerDocument,
        "bankDetailStatus": bankDetailStatus,
        "isDefault": isDefault,
        "customer": customer?.toJson(),
        "validationCode": validationCode?.toJson(),
        "updatedTimestamp": updatedTimestamp,
        "createdTimestamp": createdTimestamp,
        "signzyOnboardingId": signzyOnboardingId,
        "signzyMerchantId": signzyMerchantId,
        "signzyUserLoginToken": signzyUserLoginToken,
        "tokenValidTill": tokenValidTill,
        "nameInBank": nameInBank,
        "signzyReferenceId": signzyReferenceId,
    };
}

class Customer {
    Customer({
         this.customerId,
         this.firstName,
         this.lastName,
         this.dateOfBirth,
         this.emailId,
        this.lattitude,
        this.longitude,
         this.countryCode,
         this.mobileNo,
        this.customerMobileOs,
        this.mobileImsi,
        this.mobileImei,
        this.status,
        this.deviceInfo,
         this.gender,
        this.pan,
         this.nameOnPanCard,
        this.aadharNo,
        this.maritalStatus,
        this.fatherSpouseName,
        this.motherName,
        this.isEmailVerified,
        this.isMobileVerified,
        this.customerCity,
        this.referrerMobileNo,
        this.gcmRegId,
        this.remarks,
         this.apkVersion,
        this.crmId,
        this.chatRestoreId,
        this.kycProcessingStatus,
         this.kycType,
        this.yotiApplicationId,
        this.leadScore,
        this.onboardingId,
        this.kycLink,
        this.kycStatusRemark,
       // this.schemeBucket,
        this.updatedTimestamp,
        this.createdTimestamp,
        this.accountActivatedTime,
        //this.rmManagerDto,
         this.optedForWhatsApp,
        this.indianMobileNumber,
         this.fullName,
         this.nri,
        this.androidCustomer,
        this.iosUser,
    });

    int? customerId;
    String? firstName;
    String? lastName;
    int? dateOfBirth;
    String? emailId;
    double? lattitude;
    double? longitude;
    String? countryCode;
    String? mobileNo;
    int? customerMobileOs;
    String? mobileImsi;
    String ?mobileImei;
    int? status;
    String? deviceInfo;
    int? gender;
    String? pan;
    String? nameOnPanCard;
    String? aadharNo;
    dynamic maritalStatus;
    dynamic fatherSpouseName;
    dynamic motherName;
    bool? isEmailVerified;
    bool? isMobileVerified;
    String? customerCity;
    String? referrerMobileNo;
    String? gcmRegId;
    dynamic remarks;
    int? apkVersion;
    dynamic crmId;
    dynamic chatRestoreId;
    dynamic kycProcessingStatus;
    int? kycType;
    dynamic yotiApplicationId;
    dynamic leadScore;
    dynamic onboardingId;
    dynamic kycLink;
    dynamic kycStatusRemark;
   // SchemeBucket? schemeBucket;
    int? updatedTimestamp;
    int? createdTimestamp;
    int? accountActivatedTime;
    //RmManagerDto? rmManagerDto;
    bool? optedForWhatsApp;
    String? indianMobileNumber;
    String? fullName;
    bool? nri;
    bool? androidCustomer;
    bool? iosUser;

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerId: json["customerId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        dateOfBirth: json["dateOfBirth"],
        emailId: json["emailId"],
        lattitude: json["lattitude"],
        longitude: json["longitude"],
        countryCode: json["countryCode"],
        mobileNo: json["mobileNo"],
        customerMobileOs: json["customerMobileOS"],
        mobileImsi: json["mobileImsi"],
        mobileImei: json["mobileImei"],
        status: json["status"],
        deviceInfo: json["deviceInfo"],
        gender: json["gender"],
        pan: json["pan"],
        nameOnPanCard: json["nameOnPanCard"],
        aadharNo: json["aadharNo"],
        maritalStatus: json["maritalStatus"],
        fatherSpouseName: json["fatherSpouseName"],
        motherName: json["motherName"],
        isEmailVerified: json["isEmailVerified"],
        isMobileVerified: json["isMobileVerified"],
        customerCity: json["customerCity"],
        referrerMobileNo: json["referrerMobileNo"],
        gcmRegId: json["gcmRegId"],
        remarks: json["remarks"],
        apkVersion: json["apkVersion"],
        crmId: json["crmId"],
        chatRestoreId: json["chatRestoreId"],
        kycProcessingStatus: json["kycProcessingStatus"],
        kycType: json["kycType"],
        yotiApplicationId: json["yotiApplicationId"],
        leadScore: json["leadScore"],
        onboardingId: json["onboardingId"],
        kycLink: json["kycLink"],
        kycStatusRemark: json["kycStatusRemark"],
       // schemeBucket: SchemeBucket.fromJson(json["schemeBucket"]),
        updatedTimestamp: json["updatedTimestamp"],
        createdTimestamp: json["createdTimestamp"],
        accountActivatedTime: json["accountActivatedTime"],
      //  rmManagerDto: RmManagerDto.fromJson(json["rmManagerDto"]),
        optedForWhatsApp: json["optedForWhatsApp"],
        indianMobileNumber: json["indianMobileNumber"],
        fullName: json["fullName"],
        nri: json["nri"],
        androidCustomer: json["androidCustomer"],
        iosUser: json["iosUser"],
    );

    Map<String, dynamic> toJson() => {
        "customerId": customerId,
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth,
        "emailId": emailId,
        "lattitude": lattitude,
        "longitude": longitude,
        "countryCode": countryCode,
        "mobileNo": mobileNo,
        "customerMobileOS": customerMobileOs,
        "mobileImsi": mobileImsi,
        "mobileImei": mobileImei,
        "status": status,
        "deviceInfo": deviceInfo,
        "gender": gender,
        "pan": pan,
        "nameOnPanCard": nameOnPanCard,
        "aadharNo": aadharNo,
        "maritalStatus": maritalStatus,
        "fatherSpouseName": fatherSpouseName,
        "motherName": motherName,
        "isEmailVerified": isEmailVerified,
        "isMobileVerified": isMobileVerified,
        "customerCity": customerCity,
        "referrerMobileNo": referrerMobileNo,
        "gcmRegId": gcmRegId,
        "remarks": remarks,
        "apkVersion": apkVersion,
        "crmId": crmId,
        "chatRestoreId": chatRestoreId,
        "kycProcessingStatus": kycProcessingStatus,
        "kycType": kycType,
        "yotiApplicationId": yotiApplicationId,
        "leadScore": leadScore,
        "onboardingId": onboardingId,
        "kycLink": kycLink,
        "kycStatusRemark": kycStatusRemark,
       // "schemeBucket": schemeBucket?.toJson(),
        "updatedTimestamp": updatedTimestamp,
        "createdTimestamp": createdTimestamp,
        "accountActivatedTime": accountActivatedTime,
       // "rmManagerDto": rmManagerDto?.toJson(),
        "optedForWhatsApp": optedForWhatsApp,
        "indianMobileNumber": indianMobileNumber,
        "fullName": fullName,
        "nri": nri,
        "androidCustomer": androidCustomer,
        "iosUser": iosUser,
    };
}
/*
class RmManagerDto {
    RmManagerDto({
        this.rmManagerId,
        this.name,
        this.emailId,
        this.contactNo,
        this.accessId,
        this.allowedRm,
        this.status,
        this.createdTime,
        this.updatedTime,
        this.profilePicUrl,
        this.address,
    });

    int rmManagerId;
    String name;
    String emailId;
    String contactNo;
    String accessId;
    String allowedRm;
    int status;
    int createdTime;
    int updatedTime;
    dynamic profilePicUrl;
    dynamic address;

    factory RmManagerDto.fromJson(Map<String, dynamic> json) => RmManagerDto(
        rmManagerId: json["rmManagerId"],
        name: json["name"],
        emailId: json["emailId"],
        contactNo: json["contactNo"],
        accessId: json["accessId"],
        allowedRm: json["allowedRm"],
        status: json["status"],
        createdTime: json["createdTime"],
        updatedTime: json["updatedTime"],
        profilePicUrl: json["profilePicURL"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "rmManagerId": rmManagerId,
        "name": name,
        "emailId": emailId,
        "contactNo": contactNo,
        "accessId": accessId,
        "allowedRm": allowedRm,
        "status": status,
        "createdTime": createdTime,
        "updatedTime": updatedTime,
        "profilePicURL": profilePicUrl,
        "address": address,
    };
}

class SchemeBucket {
    SchemeBucket({
        this.schemeBucketId,
        this.schemeList,
        this.sipSchemeList,
        this.dynamicSipSchemeList,
        this.status,
        this.updatedTimestamp,
        this.createdTimestamp,
    });

    int schemeBucketId;
    String schemeList;
    String sipSchemeList;
    String dynamicSipSchemeList;
    int status;
    int updatedTimestamp;
    int createdTimestamp;

    factory SchemeBucket.fromJson(Map<String, dynamic> json) => SchemeBucket(
        schemeBucketId: json["schemeBucketId"],
        schemeList: json["schemeList"],
        sipSchemeList: json["sipSchemeList"],
        dynamicSipSchemeList: json["dynamicSipSchemeList"],
        status: json["status"],
        updatedTimestamp: json["updatedTimestamp"],
        createdTimestamp: json["createdTimestamp"],
    );

    Map<String, dynamic> toJson() => {
        "schemeBucketId": schemeBucketId,
        "schemeList": schemeList,
        "sipSchemeList": sipSchemeList,
        "dynamicSipSchemeList": dynamicSipSchemeList,
        "status": status,
        "updatedTimestamp": updatedTimestamp,
        "createdTimestamp": createdTimestamp,
    };
}
*/
class BankDetails {
    BankDetails({
        required this.bankName,
        this.clearingType,
        this.isNbSupported,
        this.isUpiSupported,
        this.iseNachNbSupported,
        this.iseNachDcSupported,
    });

    String bankName;
    String? clearingType;
    String? isNbSupported;
    String? isUpiSupported;
    String? iseNachNbSupported;
    String? iseNachDcSupported;

    factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
        bankName: json["bankName"],
        clearingType: json["clearingType"],
        isNbSupported: json["isNBSupported"],
        isUpiSupported: json["isUPISupported"],
        iseNachNbSupported: json["iseNachNBSupported"],
        iseNachDcSupported: json["iseNachDCSupported"],
    );

    Map<String, dynamic> toJson() => {
        "bankName": bankName,
        "clearingType": clearingType,
        "isNBSupported": isNbSupported,
        "isUPISupported": isUpiSupported,
        "iseNachNBSupported": iseNachNbSupported,
        "iseNachDCSupported": iseNachDcSupported,
    };
}
/*
class CustomerLogin {
    CustomerLogin({
        this.password,
        this.loginStatus,
        this.customer,
        this.lockedTillTime,
        this.noOfConsecutiveFailedLogin,
        this.updatedTimestamp,
        this.createdTimestamp,
        this.decryptedPassword,
    });

    String password;
    int loginStatus;
    dynamic customer;
    dynamic lockedTillTime;
    dynamic noOfConsecutiveFailedLogin;
    int updatedTimestamp;
    int createdTimestamp;
    String decryptedPassword;

    factory CustomerLogin.fromJson(Map<String, dynamic> json) => CustomerLogin(
        password: json["password"],
        loginStatus: json["loginStatus"],
        customer: json["customer"],
        lockedTillTime: json["lockedTillTime"],
        noOfConsecutiveFailedLogin: json["noOfConsecutiveFailedLogin"],
        updatedTimestamp: json["updatedTimestamp"],
        createdTimestamp: json["createdTimestamp"],
        decryptedPassword: json["decryptedPassword"],
    );

    Map<String, dynamic> toJson() => {
        "password": password,
        "loginStatus": loginStatus,
        "customer": customer,
        "lockedTillTime": lockedTillTime,
        "noOfConsecutiveFailedLogin": noOfConsecutiveFailedLogin,
        "updatedTimestamp": updatedTimestamp,
        "createdTimestamp": createdTimestamp,
        "decryptedPassword": decryptedPassword,
    };
}

class CustomerMfDetails {
    CustomerMfDetails({
        this.custMfPlatformDetailsId,
        this.clientCode,
        this.mfPlatformId,
        this.mfPlatformStatus,
        this.customer,
        this.updatedTimestamp,
        this.createdTimestamp,
    });

    int custMfPlatformDetailsId;
    String clientCode;
    int mfPlatformId;
    int mfPlatformStatus;
    Customer customer;
    int updatedTimestamp;
    int createdTimestamp;

    factory CustomerMfDetails.fromJson(Map<String, dynamic> json) => CustomerMfDetails(
        custMfPlatformDetailsId: json["custMFPlatformDetailsId"],
        clientCode: json["clientCode"],
        mfPlatformId: json["mfPlatformId"],
        mfPlatformStatus: json["mfPlatformStatus"],
        customer: Customer.fromJson(json["customer"]),
        updatedTimestamp: json["updatedTimestamp"],
        createdTimestamp: json["createdTimestamp"],
    );

    Map<String, dynamic> toJson() => {
        "custMFPlatformDetailsId": custMfPlatformDetailsId,
        "clientCode": clientCode,
        "mfPlatformId": mfPlatformId,
        "mfPlatformStatus": mfPlatformStatus,
        "customer": customer.toJson(),
        "updatedTimestamp": updatedTimestamp,
        "createdTimestamp": createdTimestamp,
    };
}
*/
class Document {
    Document({
        required this.custDocId,
        required this.docType,
        this.docStatus,
        this.docPath,
        this.customer,
        this.validationCode,
        this.updatedTimestamp,
        this.createdTimestamp,
    });

    int custDocId;
    int docType;
    int? docStatus;
    String? docPath;
    Customer? customer;
    dynamic validationCode;
    int? updatedTimestamp;
    int? createdTimestamp;

    factory Document.fromJson(Map<String, dynamic> json) => Document(
        custDocId: json["custDocId"],
        docType: json["docType"],
        docStatus: json["docStatus"],
        docPath: json["docPath"],
        customer: Customer.fromJson(json["customer"]),
        validationCode: json["validationCode"],
        updatedTimestamp: json["updatedTimestamp"],
        createdTimestamp: json["createdTimestamp"],
    );

    Map<String, dynamic> toJson() => {
        "custDocId": custDocId,
        "docType": docType,
        "docStatus": docStatus,
        "docPath": docPath,
        "customer": customer?.toJson(),
        "validationCode": validationCode,
        "updatedTimestamp": updatedTimestamp,
        "createdTimestamp": createdTimestamp,
    };
}

class Fatca {
    Fatca({
        required this.customerFatcaId,
        this.customer,
        this.taxStatus,
        this.annualIncome,
        this.politicallyExposed,
        this.nationality,
        this.taxResidentCountry,
        this.taxReferenceNo,
        this.fatcaCompliant,
        this.status,
        this.updatedTimestamp,
        this.createdTimestamp,
    });

    int customerFatcaId;
    Customer? customer;
    CommunicationCountry? taxStatus;
    CommunicationCountry? annualIncome;
    bool? politicallyExposed;
    CommunicationCountry? nationality;
    CommunicationCountry? taxResidentCountry;
    String? taxReferenceNo;
    bool? fatcaCompliant;
    int? status;
    int? updatedTimestamp;
    int? createdTimestamp;

    factory Fatca.fromJson(Map<String, dynamic> json) => Fatca(
        customerFatcaId: json["customerFatcaId"],
        customer: Customer.fromJson(json["customer"]),
        taxStatus: CommunicationCountry.fromJson(json["taxStatus"]),
        annualIncome: CommunicationCountry.fromJson(json["annualIncome"]),
        politicallyExposed: json["politicallyExposed"],
        nationality: CommunicationCountry.fromJson(json["nationality"]),
        taxResidentCountry: CommunicationCountry.fromJson(json["taxResidentCountry"]),
        taxReferenceNo: json["taxReferenceNo"],
        fatcaCompliant: json["fatcaCompliant"],
        status: json["status"],
        updatedTimestamp: json["updatedTimestamp"],
        createdTimestamp: json["createdTimestamp"],
    );

    Map<String, dynamic> toJson() => {
        "customerFatcaId": customerFatcaId,
        "customer": customer?.toJson(),
        "taxStatus": taxStatus?.toJson(),
        "annualIncome": annualIncome?.toJson(),
        "politicallyExposed": politicallyExposed,
        "nationality": nationality?.toJson(),
        "taxResidentCountry": taxResidentCountry?.toJson(),
        "taxReferenceNo": taxReferenceNo,
        "fatcaCompliant": fatcaCompliant,
        "status": status,
        "updatedTimestamp": updatedTimestamp,
        "createdTimestamp": createdTimestamp,
    };
}
/*
class Nominee {
    Nominee({
        this.custNomineeDtlsId,
        this.customer,
        this.nomineeName,
        this.nomineeRelationship,
        this.isMinor,
        this.guardianName,
        this.status,
        this.updatedTimestamp,
        this.createdTimestamp,
    });

    int custNomineeDtlsId;
    Customer customer;
    String nomineeName;
    int nomineeRelationship;
    bool isMinor;
    dynamic guardianName;
    int status;
    int updatedTimestamp;
    int createdTimestamp;

    factory Nominee.fromJson(Map<String, dynamic> json) => Nominee(
        custNomineeDtlsId: json["custNomineeDtlsId"],
        customer: Customer.fromJson(json["customer"]),
        nomineeName: json["nomineeName"],
        nomineeRelationship: json["nomineeRelationship"],
        isMinor: json["isMinor"],
        guardianName: json["guardianName"],
        status: json["status"],
        updatedTimestamp: json["updatedTimestamp"],
        createdTimestamp: json["createdTimestamp"],
    );

    Map<String, dynamic> toJson() => {
        "custNomineeDtlsId": custNomineeDtlsId,
        "customer": customer.toJson(),
        "nomineeName": nomineeName,
        "nomineeRelationship": nomineeRelationship,
        "isMinor": isMinor,
        "guardianName": guardianName,
        "status": status,
        "updatedTimestamp": updatedTimestamp,
        "createdTimestamp": createdTimestamp,
    };
}
*/
class Status {
    Status({
        required this.code,
        this.messages,
    });

    String code;
    List<dynamic>? messages;

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "messages": List<dynamic>.from(messages!.map((x) => x)),
    };
}
