import 'package:healtheats/responses/get_all_response.dart';

abstract class IRecipeRepository {
  Future<List<RecipePrismicResponse>> getAll();
  Future<List<RecipePrismicResponse>> getAllByCategory(String category);
  Future<List<RecipePrismicResponse>> getFeatured();
  Future<RecipePrismicResponse?>? getOne(int id);
}
