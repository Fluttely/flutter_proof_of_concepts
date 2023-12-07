import 'package:flutter/widgets.dart';
import 'package:updown_app/app/networking/api_service.dart';
import 'package:updown_app/app/services/local_storage_service.dart';
import 'package:updown_app/bootstrap/helpers.dart';

import 'package:updown_app/app/controllers/controller.dart';
import 'package:nylo_framework/nylo_framework.dart';

// final Map<String, dynamic> equipmentParametersSettingsMapMock = {
//   "equipmentId": "string",
//   "equipmentSerialNumber": "string",
//   "productParameterSettingsId": "string",
//   "identificationHash": "string",
//   "configuredValue": "string",
//   "startByAccountUserId": "string",
//   "endByAccountUserId": "string",
//   "endSettingsDate": "2023-12-02T15:43:22.317Z",
//   "isActiveParameter": true,
//   "parameterLanguage": {},
//   "isActive": true
// };

class DeviceSettingsController extends Controller {
  construct(BuildContext context) {
    super.construct(context);
  }

  // Future<bool> getHumidity() async {
  //   // call api
  //   // https://dev.core-api.cmosdrake.com.br/api#/EquipmentParameterSettings/EquipmentParameterSettingsController_findOneById
  //   // put into local storage
  //   // get from local storage
  //   await Future.delayed(Duration(milliseconds: 200));
  //   return await LocalStorageService.getMao(
  //           key: StorageKey.widgetCounterExample) ??
  //       0;
  // }
  late EquipmentParametersSettingsModel rampAdjustmentStateModel;

  final String id = "2";
  final String rampAdjustmentId = "2";
  Future<bool> getRampAdjustmentState() async {
    try {
      // await Future.delayed(Duration(milliseconds: 200));
      // call api
      // https://dev.core-api.cmosdrake.com.br/api#/EquipmentParameterSettings/EquipmentParameterSettingsController_findOneById
      final List<Map<String, dynamic>> jsonList =
          await api<ApiService>((request) => request.getMapList(
              // "http://localhost:8080/products/1"));
              // "/equipment_parameter_settings?productParameterSettingsId=$rampAdjustmentId"));
              "/equipment_parameter_settings/$id"));

      // Treat the response data
      rampAdjustmentStateModel =
          EquipmentParametersSettingsModel.fromJson(jsonList.first);

      // put into local storage
      await LocalStorageService.setJson(
          key: rampAdjustmentStateModel.productParameterSettingsId,
          value: rampAdjustmentStateModel.toJson());
      // get from local storage
      final Map<String, dynamic>? map = await LocalStorageService.getJson(
          key: rampAdjustmentStateModel.productParameterSettingsId);
      rampAdjustmentStateModel =
          EquipmentParametersSettingsModel.fromJson(map ?? {});
      return rampAdjustmentStateModel.isActiveParameter;
    } catch (e) {
      return false; // TODO: NOW
    }
  }

  Future<void> setRampAdjustmentState(bool value) async {
    // final String rampAdjustmentId = "2";
    // await Future.delayed(Duration(milliseconds: 200));
    // call api
    // final json =
    rampAdjustmentStateModel.isActiveParameter = value;
    await api<ApiService>((request) => request.postMap(
          "/equipment_parameter_settings/$id",
          data: rampAdjustmentStateModel.toJson(),
        ));

    //    'http://localhost:8080/auth/refresh',
    // headers: {'authorization': "$type $token"},
    // body: jsonEncode({
    //   "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NjI0MjI3NTIsImlhdCI6MTY2MTgxNzk1MiwiaXNzIjoiZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmxlSEFpT2pFMk5qRTRNVGM1T0RJc0ltbGhkQ0k2TVRZMk1UZ3hOemsxTWl3aWFYTnpJam9pYW5OdmJsOXlaWE4wWDNObGNuWmxjaUlzSW01aVppSTZNVFkyTVRneE56azFNaXdpYzNWaUlqb2lNU0o5LkROV0MwalVQSnc5OExWNGpnREJTTU5CbWFqQnlQYTh2RWNMSXBXSTYybVEiLCJuYmYiOjE2NjE4MTc5ODIsInN1YiI6IlJlZnJlc2hUb2tlbiJ9.2oUEvmJWAiM_jbBGtwsRB-PasgU1R1e6c5aefH98Xrk",
    // })

    // final jsonEncoded = await ApiService().get(
    //         "http://localhost:8080/equipment_parameter_settings?productParameterSettingsId=1")
    //     as String;
    // https://dev.core-api.cmosdrake.com.br/api#/EquipmentParameterSettings/EquipmentParameterSettingsController_update
    // final modelFromRemote =
    //     EquipmentParametersSettingsModel.fromJson(jsonDecode(json));
    // put into local storage
    await LocalStorageService.setJson(
        key: rampAdjustmentStateModel.productParameterSettingsId,
        value: rampAdjustmentStateModel.toJson());
    // if error return and error to the client
    return;
  }
}

class EquipmentParametersSettingsModel {
  String id;
  String equipmentId;
  String equipmentSerialNumber;
  String productParameterSettingsId;
  String identificationHash;
  String configuredValue;
  String startByAccountUserId;
  String endByAccountUserId;
  DateTime endSettingsDate;
  bool isActiveParameter;
  Map<String, dynamic> parameterLanguage;
  bool isActive;

  EquipmentParametersSettingsModel({
    required this.id,
    required this.equipmentId,
    required this.equipmentSerialNumber,
    required this.productParameterSettingsId,
    required this.identificationHash,
    required this.configuredValue,
    required this.startByAccountUserId,
    required this.endByAccountUserId,
    required this.endSettingsDate,
    required this.isActiveParameter,
    required this.parameterLanguage,
    required this.isActive,
  });

  factory EquipmentParametersSettingsModel.fromJson(Map<String, dynamic> json) {
    return EquipmentParametersSettingsModel(
      id: json['id'],
      equipmentId: json['equipmentId'],
      equipmentSerialNumber: json['equipmentSerialNumber'],
      productParameterSettingsId: json['productParameterSettingsId'],
      identificationHash: json['identificationHash'],
      configuredValue: json['configuredValue'],
      startByAccountUserId: json['startByAccountUserId'],
      endByAccountUserId: json['endByAccountUserId'],
      endSettingsDate: DateTime.parse(json['endSettingsDate']),
      isActiveParameter: json['isActiveParameter'],
      parameterLanguage: json['parameterLanguage'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'equipmentId': equipmentId,
      'equipmentSerialNumber': equipmentSerialNumber,
      'productParameterSettingsId': productParameterSettingsId,
      'identificationHash': identificationHash,
      'configuredValue': configuredValue,
      'startByAccountUserId': startByAccountUserId,
      'endByAccountUserId': endByAccountUserId,
      'endSettingsDate': endSettingsDate.toIso8601String(),
      'isActiveParameter': isActiveParameter,
      'parameterLanguage': parameterLanguage,
      'isActive': isActive,
    };
  }
}
