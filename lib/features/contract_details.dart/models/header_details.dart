class HeaderDetails {
  String? contractNo;
  String? voucherNo;
  String? clientName;
  String? phoneNumber;
  String? address;

  String? noBaths;

  String? noCement;
  String? noTarbal;
  String? noSecred;
  String? areaRoofs;
  String? na3latRoof;
  String? areaBaths;
  String? na3latBaths;
  String? areaMamarat;
  String? na3latMamarat;
  String? areaSanader;
  String? na3latSanader;
  String? so2otFoom;
  // List<String?>? additionalWorkSteps;

  HeaderDetails({
    this.contractNo,
    this.voucherNo,
    this.clientName,
    this.phoneNumber,
    this.address,
    this.noBaths,
    this.noCement,
    this.noTarbal,
    this.noSecred,
    this.areaRoofs,
    this.na3latRoof,
    this.areaBaths,
    this.na3latBaths,
    this.areaMamarat,
    this.na3latMamarat,
    this.areaSanader,
    this.na3latSanader,
    this.so2otFoom,
  });

  factory HeaderDetails.initial() {
    return HeaderDetails(
      contractNo: null,
      voucherNo: null,
      clientName: null,
      phoneNumber: null,
      address: null,
      noBaths: null,
      noCement: null,
      noTarbal: null,
      noSecred: null,
      areaRoofs: null,
      na3latRoof: null,
      areaBaths: null,
      na3latBaths: null,
      areaMamarat: null,
      na3latMamarat: null,
      areaSanader: null,
      na3latSanader: null,
      so2otFoom: null,
    );
  }
  factory HeaderDetails.fromMap(Map<String, dynamic> map) {
    return HeaderDetails(
      contractNo: map['contractNo'],
      voucherNo: map['voucherNo'],
      clientName: map['clientName'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
      noBaths: map['noBaths'],
      noCement: map['noCement'],
      noTarbal: map['noTarbal'],
      noSecred: map['noSecred'],
      areaRoofs: map['areaRoofs'],
      na3latRoof: map['na3latRoof'],
      areaBaths: map['areaBaths'],
      na3latBaths: map['na3latBaths'],
      areaMamarat: map['areaMamarat'],
      na3latMamarat: map['na3latMamarat'],
      areaSanader: map['areaSanader'],
      na3latSanader: map['na3latSanader'],
      so2otFoom: map['so2otFoom'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'contractNo': contractNo,
      'voucherNo': voucherNo,
      'clientName': clientName,
      'phoneNumber': phoneNumber,
      'address': address,
      'noBaths': noBaths,
      'noCement': noCement,
      'noTarbal': noTarbal,
      'noSecred': noSecred,
      'areaRoofs': areaRoofs,
      'na3latRoof': na3latRoof,
      'areaBaths': areaBaths,
      'na3latBaths': na3latBaths,
      'areaMamarat': areaMamarat,
      'na3latMamarat': na3latMamarat,
      'areaSanader': areaSanader,
      'na3latSanader': na3latSanader,
      'so2otFoom': so2otFoom,
    };
  }

  Map<String, dynamic> toUI() {
    return {
      'اسم العقد': contractNo,
      'رقم القسيمة': voucherNo,
      'اسم العميل': clientName,
      'التلفون': phoneNumber,
      'العنوان': address,
      'عدد الحمامات': noBaths,
      'عدد الاسمنت': noCement,
      'عدد الطربال': noTarbal,
      'كمية السكريد': noSecred,
      'مساحة الاسطج': areaRoofs,
      'نعلات الاسطج': na3latRoof,
      'مساحة الحمامات': areaBaths,
      'نعلات الحمامات': na3latBaths,
      'مساحة الممرات': areaMamarat,
      'نعلات الممرات': na3latMamarat,
      'مساحة السنادر': areaSanader,
      'نعلات السنادر': na3latSanader,
      'سقوط الفوم': so2otFoom,
    };
  }
}
