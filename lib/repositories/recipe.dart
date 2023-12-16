import 'dart:io';
import 'package:healtheats/repositories/recipe_interface.dart';
import 'package:healtheats/responses/get_all_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeRepository implements IRecipeRepository {
  static const String ref = 'ZXx3CxEAACAA0ld2';
  @override
  Future<List<RecipePrismicResponse>> getAll() {
    return getAllDocumentsByRef(ref);
  }

  @override
  Future<List<RecipePrismicResponse>> getAllByCategory(String category) {
    return getAllDocumentsByRef(ref);
  }

  @override
  Future<List<RecipePrismicResponse>> getFeatured() {
    return getAllDocumentsByRef(ref);
  }

  @override
  Future<RecipePrismicResponse?>? getOne(int id) {
    // return fetchPrismicDocuments();
    return null;
  }
}

Future<List<RecipePrismicResponse>> getAllDocumentsByRef(String ref) async {
  // final String apiEndpoint = 'https://healtheat.cdn.prismic.io/api/v2';
  const String documentEndpoint = 'healtheat.cdn.prismic.io';

  const String path = '/api/v2/documents/search';

  final Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json'
  };
  final queryParameters = {'ref': ref};
  final uri = Uri.https(documentEndpoint, path, queryParameters);
  final response = await http.get(uri, headers: headers);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    return List<RecipePrismicResponse>.from(
        data['results'].map((i) => RecipePrismicResponse.fromJson(i)));
  } else {
    throw Exception('Failed to load Prismic documents');
  }
}
