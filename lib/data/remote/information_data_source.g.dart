// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_data_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Information _$InformationFromJson(Map<String, dynamic> json) => Information(
      id: json['id'] as int?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      publishedAt: json['publishedAt'] as String?,
    );

Map<String, dynamic> _$InformationToJson(Information instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'publishedAt': instance.publishedAt,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _InformationDataSource implements InformationDataSource {
  _InformationDataSource(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://localhost:8000/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Information>> getInformations({sortBy = 'publishedAt'}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'sortBy': sortBy};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Information>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/v1/information/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Information.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
