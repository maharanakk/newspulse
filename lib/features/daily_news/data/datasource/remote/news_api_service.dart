import 'package:dio/dio.dart';
import 'package:newspulse/core/constants/constants.dart';
import 'package:newspulse/features/daily_news/data/model/article_model.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getArticles(
    @Query('country') String country,
    @Query('apiKey') String apiKey,
    @Query('category') String category,
  );
}