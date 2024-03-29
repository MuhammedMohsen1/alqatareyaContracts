import 'package:alqatareyacontracts/features/create_contract/models/form_model/steps_details.dart';

class FormDetails {
  String? contractNo;
  String? voucherNo;
  String? clientName;
  String? phoneNumber;
  String? address;

  DateTime? createDate;
  List<StepsDetails>? roofSteps;
  bool? isThereBaths;
  List<StepsDetails>? bathsSteps;
  String? noBaths;
  String? bathsDetails;
  String? noCement;
  String? noTarbal;
  String? tarbalDetails;
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
  List<StepsDetails>? additionalWorkSteps;
  String? mandoobName;

  FormDetails({
    this.contractNo,
    this.voucherNo,
    this.clientName,
    this.phoneNumber,
    this.address,
    this.createDate,
    this.roofSteps,
    this.bathsSteps,
    this.isThereBaths,
    this.noBaths,
    this.bathsDetails,
    this.noCement,
    this.noTarbal,
    this.tarbalDetails,
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
    this.additionalWorkSteps,
    this.mandoobName,
  });

  factory FormDetails.initial() {
    return FormDetails(
      contractNo: null,
      voucherNo: null,
      clientName: null,
      phoneNumber: null,
      address: null,
      createDate: null,
      roofSteps: null,
      bathsSteps: null,
      isThereBaths: null,
      noBaths: null,
      bathsDetails: null,
      noCement: null,
      noTarbal: null,
      tarbalDetails: null,
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
      additionalWorkSteps: [],
      mandoobName: null,
    );
  }
  factory FormDetails.fromMap(Map<String, dynamic> map) {
    return FormDetails(
      contractNo: map['contractNo'],
      voucherNo: map['voucherNo'],
      clientName: map['clientName'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
      createDate:
          map['createDate'] != null ? map['createDate'].toDate() : null,
      roofSteps: (map['roofSteps'] as List<dynamic>?)
          ?.map((stepDetail) => StepsDetails.fromMap(stepDetail))
          .toList(),
      bathsSteps: (map['bathsSteps'] as List<dynamic>?)
          ?.map((stepDetail) => StepsDetails.fromMap(stepDetail))
          .toList(),
      isThereBaths: map['isThereBaths'],
      noBaths: map['noBaths'],
      bathsDetails: map['bathsDetails'],
      noCement: map['noCement'],
      noTarbal: map['noTarbal'],
      tarbalDetails: map['tarbalDetails'],
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
   

      
      additionalWorkSteps: (map['additionalWork'] as List<dynamic>?)
          ?.map((stepDetail) => StepsDetails.fromMap(stepDetail))
          .toList(),
      mandoobName: map['mandoobName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'contractNo': contractNo,
      'voucherNo': voucherNo,
      'clientName': clientName,
      'phoneNumber': phoneNumber,
      'address': address,
      'createDate': createDate,
      'roofSteps': roofSteps?.map((step) => step.toMap()).toList(),
      'bathsSteps': bathsSteps?.map((step) => step.toMap()).toList(),
      'isThereBaths': isThereBaths,
      'noBaths': noBaths,
      'bathsDetails': bathsDetails,
      'noCement': noCement,
      'noTarbal': noTarbal,
      'tarbalDetails': tarbalDetails,
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
      
      'additionalWork':
          additionalWorkSteps?.map((step) => step?.toMap()).toList(),
      'mandoobName': mandoobName,
    };
  }
}

class TypeContract {
  String title;
  List<String> steps;

  TypeContract(this.title, this.steps);

  factory TypeContract.fromMap(Map<String, dynamic> map) {
    return TypeContract(
      map['name'],
      List<String>.from(map['steps']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      title: steps,
    };
  }
}
