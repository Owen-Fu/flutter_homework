import 'package:flutter_homework/generated/json/base/json_convert_content.dart';
import 'package:flutter_homework/Weather/Model/RestDatastoreNormalModel.dart';
import 'package:flutter_homework/Tool/Net/base_server_resp.dart';


RestDatastoreNormalModel $RestDatastoreNormalModelFromJson(Map<String, dynamic> json) {
  final RestDatastoreNormalModel restDatastoreNormalModel = RestDatastoreNormalModel();
  final String? success = jsonConvert.convert<String>(json['success']);
  if (success != null) {
    restDatastoreNormalModel.success = success;
  }
  final RestDatastoreNormalResult? result = jsonConvert.convert<RestDatastoreNormalResult>(json['result']);
  if (result != null) {
    restDatastoreNormalModel.result = result;
  }
  final RestDatastoreNormalRecords? records = jsonConvert.convert<RestDatastoreNormalRecords>(json['records']);
  if (records != null) {
    restDatastoreNormalModel.records = records;
  }
  final int? httpStatus = jsonConvert.convert<int>(json['httpStatus']);
  if (httpStatus != null) {
    restDatastoreNormalModel.httpStatus = httpStatus;
  }
  return restDatastoreNormalModel;
}

Map<String, dynamic> $RestDatastoreNormalModelToJson(RestDatastoreNormalModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['result'] = entity.result?.toJson();
  data['records'] = entity.records?.toJson();
  data['httpStatus'] = entity.httpStatus;
  return data;
}

extension RestDatastoreNormalModelExtension on RestDatastoreNormalModel {
  RestDatastoreNormalModel copyWith({
    String? success,
    RestDatastoreNormalResult? result,
    RestDatastoreNormalRecords? records,
    int? httpStatus,
  }) {
    return RestDatastoreNormalModel()
      ..success = success ?? this.success
      ..result = result ?? this.result
      ..records = records ?? this.records
      ..httpStatus = httpStatus ?? this.httpStatus;
  }
}

RestDatastoreNormalResult $RestDatastoreNormalResultFromJson(Map<String, dynamic> json) {
  final RestDatastoreNormalResult restDatastoreNormalResult = RestDatastoreNormalResult();
  final String? resourceId = jsonConvert.convert<String>(json['resource_id']);
  if (resourceId != null) {
    restDatastoreNormalResult.resourceId = resourceId;
  }
  final List<RestDatastoreNormalResultFields>? fields = (json['fields'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<RestDatastoreNormalResultFields>(e) as RestDatastoreNormalResultFields).toList();
  if (fields != null) {
    restDatastoreNormalResult.fields = fields;
  }
  return restDatastoreNormalResult;
}

Map<String, dynamic> $RestDatastoreNormalResultToJson(RestDatastoreNormalResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['resource_id'] = entity.resourceId;
  data['fields'] = entity.fields?.map((v) => v.toJson()).toList();
  return data;
}

extension RestDatastoreNormalResultExtension on RestDatastoreNormalResult {
  RestDatastoreNormalResult copyWith({
    String? resourceId,
    List<RestDatastoreNormalResultFields>? fields,
  }) {
    return RestDatastoreNormalResult()
      ..resourceId = resourceId ?? this.resourceId
      ..fields = fields ?? this.fields;
  }
}

RestDatastoreNormalResultFields $RestDatastoreNormalResultFieldsFromJson(Map<String, dynamic> json) {
  final RestDatastoreNormalResultFields restDatastoreNormalResultFields = RestDatastoreNormalResultFields();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    restDatastoreNormalResultFields.id = id;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    restDatastoreNormalResultFields.type = type;
  }
  return restDatastoreNormalResultFields;
}

Map<String, dynamic> $RestDatastoreNormalResultFieldsToJson(RestDatastoreNormalResultFields entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['type'] = entity.type;
  return data;
}

extension RestDatastoreNormalResultFieldsExtension on RestDatastoreNormalResultFields {
  RestDatastoreNormalResultFields copyWith({
    String? id,
    String? type,
  }) {
    return RestDatastoreNormalResultFields()
      ..id = id ?? this.id
      ..type = type ?? this.type;
  }
}

RestDatastoreNormalRecords $RestDatastoreNormalRecordsFromJson(Map<String, dynamic> json) {
  final RestDatastoreNormalRecords restDatastoreNormalRecords = RestDatastoreNormalRecords();
  final String? datasetDescription = jsonConvert.convert<String>(json['datasetDescription']);
  if (datasetDescription != null) {
    restDatastoreNormalRecords.datasetDescription = datasetDescription;
  }
  final List<RestDatastoreNormalRecordsLocation>? location = (json['location'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<RestDatastoreNormalRecordsLocation>(e) as RestDatastoreNormalRecordsLocation)
      .toList();
  if (location != null) {
    restDatastoreNormalRecords.location = location;
  }
  return restDatastoreNormalRecords;
}

Map<String, dynamic> $RestDatastoreNormalRecordsToJson(RestDatastoreNormalRecords entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['datasetDescription'] = entity.datasetDescription;
  data['location'] = entity.location?.map((v) => v.toJson()).toList();
  return data;
}

extension RestDatastoreNormalRecordsExtension on RestDatastoreNormalRecords {
  RestDatastoreNormalRecords copyWith({
    String? datasetDescription,
    List<RestDatastoreNormalRecordsLocation>? location,
  }) {
    return RestDatastoreNormalRecords()
      ..datasetDescription = datasetDescription ?? this.datasetDescription
      ..location = location ?? this.location;
  }
}

RestDatastoreNormalRecordsLocation $RestDatastoreNormalRecordsLocationFromJson(Map<String, dynamic> json) {
  final RestDatastoreNormalRecordsLocation restDatastoreNormalRecordsLocation = RestDatastoreNormalRecordsLocation();
  final String? locationName = jsonConvert.convert<String>(json['locationName']);
  if (locationName != null) {
    restDatastoreNormalRecordsLocation.locationName = locationName;
  }
  final List<RestDatastoreNormalRecordsLocationWeatherElement>? weatherElement = (json['weatherElement'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<RestDatastoreNormalRecordsLocationWeatherElement>(
          e) as RestDatastoreNormalRecordsLocationWeatherElement).toList();
  if (weatherElement != null) {
    restDatastoreNormalRecordsLocation.weatherElement = weatherElement;
  }
  return restDatastoreNormalRecordsLocation;
}

Map<String, dynamic> $RestDatastoreNormalRecordsLocationToJson(RestDatastoreNormalRecordsLocation entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['locationName'] = entity.locationName;
  data['weatherElement'] = entity.weatherElement?.map((v) => v.toJson()).toList();
  return data;
}

extension RestDatastoreNormalRecordsLocationExtension on RestDatastoreNormalRecordsLocation {
  RestDatastoreNormalRecordsLocation copyWith({
    String? locationName,
    List<RestDatastoreNormalRecordsLocationWeatherElement>? weatherElement,
  }) {
    return RestDatastoreNormalRecordsLocation()
      ..locationName = locationName ?? this.locationName
      ..weatherElement = weatherElement ?? this.weatherElement;
  }
}

RestDatastoreNormalRecordsLocationWeatherElement $RestDatastoreNormalRecordsLocationWeatherElementFromJson(
    Map<String, dynamic> json) {
  final RestDatastoreNormalRecordsLocationWeatherElement restDatastoreNormalRecordsLocationWeatherElement = RestDatastoreNormalRecordsLocationWeatherElement();
  final String? elementName = jsonConvert.convert<String>(json['elementName']);
  if (elementName != null) {
    restDatastoreNormalRecordsLocationWeatherElement.elementName = elementName;
  }
  final List<RestDatastoreNormalRecordsLocationWeatherElementTime>? time = (json['time'] as List<dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<RestDatastoreNormalRecordsLocationWeatherElementTime>(
          e) as RestDatastoreNormalRecordsLocationWeatherElementTime).toList();
  if (time != null) {
    restDatastoreNormalRecordsLocationWeatherElement.time = time;
  }
  return restDatastoreNormalRecordsLocationWeatherElement;
}

Map<String, dynamic> $RestDatastoreNormalRecordsLocationWeatherElementToJson(
    RestDatastoreNormalRecordsLocationWeatherElement entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['elementName'] = entity.elementName;
  data['time'] = entity.time?.map((v) => v.toJson()).toList();
  return data;
}

extension RestDatastoreNormalRecordsLocationWeatherElementExtension on RestDatastoreNormalRecordsLocationWeatherElement {
  RestDatastoreNormalRecordsLocationWeatherElement copyWith({
    String? elementName,
    List<RestDatastoreNormalRecordsLocationWeatherElementTime>? time,
  }) {
    return RestDatastoreNormalRecordsLocationWeatherElement()
      ..elementName = elementName ?? this.elementName
      ..time = time ?? this.time;
  }
}

RestDatastoreNormalRecordsLocationWeatherElementTime $RestDatastoreNormalRecordsLocationWeatherElementTimeFromJson(
    Map<String, dynamic> json) {
  final RestDatastoreNormalRecordsLocationWeatherElementTime restDatastoreNormalRecordsLocationWeatherElementTime = RestDatastoreNormalRecordsLocationWeatherElementTime();
  final String? startTime = jsonConvert.convert<String>(json['startTime']);
  if (startTime != null) {
    restDatastoreNormalRecordsLocationWeatherElementTime.startTime = startTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    restDatastoreNormalRecordsLocationWeatherElementTime.endTime = endTime;
  }
  final RestDatastoreNormalRecordsLocationWeatherElementTimeParameter? parameter = jsonConvert.convert<
      RestDatastoreNormalRecordsLocationWeatherElementTimeParameter>(json['parameter']);
  if (parameter != null) {
    restDatastoreNormalRecordsLocationWeatherElementTime.parameter = parameter;
  }
  return restDatastoreNormalRecordsLocationWeatherElementTime;
}

Map<String, dynamic> $RestDatastoreNormalRecordsLocationWeatherElementTimeToJson(
    RestDatastoreNormalRecordsLocationWeatherElementTime entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['startTime'] = entity.startTime;
  data['endTime'] = entity.endTime;
  data['parameter'] = entity.parameter?.toJson();
  return data;
}

extension RestDatastoreNormalRecordsLocationWeatherElementTimeExtension on RestDatastoreNormalRecordsLocationWeatherElementTime {
  RestDatastoreNormalRecordsLocationWeatherElementTime copyWith({
    String? startTime,
    String? endTime,
    RestDatastoreNormalRecordsLocationWeatherElementTimeParameter? parameter,
  }) {
    return RestDatastoreNormalRecordsLocationWeatherElementTime()
      ..startTime = startTime ?? this.startTime
      ..endTime = endTime ?? this.endTime
      ..parameter = parameter ?? this.parameter;
  }
}

RestDatastoreNormalRecordsLocationWeatherElementTimeParameter $RestDatastoreNormalRecordsLocationWeatherElementTimeParameterFromJson(
    Map<String, dynamic> json) {
  final RestDatastoreNormalRecordsLocationWeatherElementTimeParameter restDatastoreNormalRecordsLocationWeatherElementTimeParameter = RestDatastoreNormalRecordsLocationWeatherElementTimeParameter();
  final String? parameterName = jsonConvert.convert<String>(json['parameterName']);
  if (parameterName != null) {
    restDatastoreNormalRecordsLocationWeatherElementTimeParameter.parameterName = parameterName;
  }
  final String? parameterValue = jsonConvert.convert<String>(json['parameterValue']);
  if (parameterValue != null) {
    restDatastoreNormalRecordsLocationWeatherElementTimeParameter.parameterValue = parameterValue;
  }
  return restDatastoreNormalRecordsLocationWeatherElementTimeParameter;
}

Map<String, dynamic> $RestDatastoreNormalRecordsLocationWeatherElementTimeParameterToJson(
    RestDatastoreNormalRecordsLocationWeatherElementTimeParameter entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['parameterName'] = entity.parameterName;
  data['parameterValue'] = entity.parameterValue;
  return data;
}

extension RestDatastoreNormalRecordsLocationWeatherElementTimeParameterExtension on RestDatastoreNormalRecordsLocationWeatherElementTimeParameter {
  RestDatastoreNormalRecordsLocationWeatherElementTimeParameter copyWith({
    String? parameterName,
    String? parameterValue,
  }) {
    return RestDatastoreNormalRecordsLocationWeatherElementTimeParameter()
      ..parameterName = parameterName ?? this.parameterName
      ..parameterValue = parameterValue ?? this.parameterValue;
  }
}