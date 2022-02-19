import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'information_data_source.g.dart';

@JsonSerializable()
class Information {
  int? id;
  String? title;
  String? content;
  String? publishedAt;

  Information({this.id, this.title, this.content, this.publishedAt});

  @override
  String toString() {
    return "id:$id title:$title content:$content publishedAt:$publishedAt";
  }

  factory Information.fromJson(Map<String, dynamic> json) =>
      _$InformationFromJson(json);
  Map<String, dynamic> toJson() => _$InformationToJson(this);
}

@RestApi(baseUrl: "http://localhost:8000/api/")
abstract class InformationDataSource {
  factory InformationDataSource(Dio dio, {String baseUrl}) =
      _InformationDataSource;

  @GET('/v1/information/')
  Future<List<Information>> getInformations({
    @Query("sortBy") String? sortBy = 'publishedAt',
    // @Query("q") required String query,
    // @Query("from") required String from,
    // @Query("language") String? language = 'en',
    // @Query("apiKey") required String apiKey,
  });
}
