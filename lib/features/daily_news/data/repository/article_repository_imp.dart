import 'package:newspulse/core/resource/data_state.dart';
import 'package:newspulse/features/daily_news/data/model/article_model.dart';
import 'package:newspulse/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImp implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getArticles() {
    // TODO: implement getArticles
    throw UnimplementedError();
  }
  
  
}