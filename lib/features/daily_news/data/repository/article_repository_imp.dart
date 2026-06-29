import 'dart:io';

import 'package:dio/dio.dart';
import 'package:newspulse/core/constants/constants.dart';
import 'package:newspulse/core/resource/data_state.dart';
import 'package:newspulse/features/daily_news/data/datasource/remote/news_api_service.dart';
import 'package:newspulse/features/daily_news/data/model/article_model.dart';
import 'package:newspulse/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImp implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImp(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try{
      final httpResponse = await _newsApiService.getNewsArticles(
      country: country,
      apiKey: newsApiKey,
      category: category
    );
    if(httpResponse.response.statusCode == HttpStatus.ok) {
      return DataFailure(httpResponse.response.data);
    }else
    {
      return DataFailure(DioException(
        requestOptions: httpResponse.response.requestOptions,
        response: httpResponse.response,
        error: httpResponse.response.statusMessage ?? 'Unknown error',
      ));
    }
    }on DioException catch (e) {
      return DataFailure(e);
    }
  }
}