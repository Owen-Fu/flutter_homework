import 'package:flutter_homework/Tool/Net/base_server_resp.dart';
import 'package:flutter_homework/generated/json/base/json_field.dart';
import 'package:flutter_homework/generated/json/RestDatastoreNormalModel.g.dart';
import 'dart:convert';

@JsonSerializable()
class RestDatastoreNormalModel implements BaseServerResp {
  String? success;
  RestDatastoreNormalResult? result;
  RestDatastoreNormalRecords? records;

  RestDatastoreNormalModel();

  factory RestDatastoreNormalModel.fromJson(Map<String, dynamic> json) => $RestDatastoreNormalModelFromJson(json);

  Map<String, dynamic> toJson() => $RestDatastoreNormalModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  @override
  int? httpStatus;
}

@JsonSerializable()
class RestDatastoreNormalResult {
  @JSONField(name: "resource_id")
  String? resourceId;
  List<RestDatastoreNormalResultFields>? fields;

  RestDatastoreNormalResult();

  factory RestDatastoreNormalResult.fromJson(Map<String, dynamic> json) => $RestDatastoreNormalResultFromJson(json);

  Map<String, dynamic> toJson() => $RestDatastoreNormalResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RestDatastoreNormalResultFields {
  String? id;
  String? type;

  RestDatastoreNormalResultFields();

  factory RestDatastoreNormalResultFields.fromJson(Map<String, dynamic> json) =>
      $RestDatastoreNormalResultFieldsFromJson(json);

  Map<String, dynamic> toJson() => $RestDatastoreNormalResultFieldsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RestDatastoreNormalRecords {
  String? datasetDescription;
  List<RestDatastoreNormalRecordsLocation>? location;

  RestDatastoreNormalRecords();

  factory RestDatastoreNormalRecords.fromJson(Map<String, dynamic> json) => $RestDatastoreNormalRecordsFromJson(json);

  Map<String, dynamic> toJson() => $RestDatastoreNormalRecordsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RestDatastoreNormalRecordsLocation {
  String? locationName;
  List<RestDatastoreNormalRecordsLocationWeatherElement>? weatherElement;

  RestDatastoreNormalRecordsLocation();

  factory RestDatastoreNormalRecordsLocation.fromJson(Map<String, dynamic> json) =>
      $RestDatastoreNormalRecordsLocationFromJson(json);

  Map<String, dynamic> toJson() => $RestDatastoreNormalRecordsLocationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RestDatastoreNormalRecordsLocationWeatherElement {
  String? elementName;
  List<RestDatastoreNormalRecordsLocationWeatherElementTime>? time;

  RestDatastoreNormalRecordsLocationWeatherElement();

  factory RestDatastoreNormalRecordsLocationWeatherElement.fromJson(Map<String, dynamic> json) =>
      $RestDatastoreNormalRecordsLocationWeatherElementFromJson(json);

  Map<String, dynamic> toJson() => $RestDatastoreNormalRecordsLocationWeatherElementToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RestDatastoreNormalRecordsLocationWeatherElementTime {
  String? startTime;
  String? endTime;
  RestDatastoreNormalRecordsLocationWeatherElementTimeParameter? parameter;

  RestDatastoreNormalRecordsLocationWeatherElementTime();

  factory RestDatastoreNormalRecordsLocationWeatherElementTime.fromJson(Map<String, dynamic> json) =>
      $RestDatastoreNormalRecordsLocationWeatherElementTimeFromJson(json);

  Map<String, dynamic> toJson() => $RestDatastoreNormalRecordsLocationWeatherElementTimeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RestDatastoreNormalRecordsLocationWeatherElementTimeParameter {
  String? parameterName;
  String? parameterValue;
  String? parameterUnit;

  String? get getData => parameterValue ?? parameterUnit;

  RestDatastoreNormalRecordsLocationWeatherElementTimeParameter();

  factory RestDatastoreNormalRecordsLocationWeatherElementTimeParameter.fromJson(Map<String, dynamic> json) =>
      $RestDatastoreNormalRecordsLocationWeatherElementTimeParameterFromJson(json);

  Map<String, dynamic> toJson() => $RestDatastoreNormalRecordsLocationWeatherElementTimeParameterToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
