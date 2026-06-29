import 'package:newspulse/core/resource/data_state.dart';
import 'package:newspulse/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}