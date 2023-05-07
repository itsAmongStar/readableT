import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class OpenAICall {
  static Future<ApiCallResponse> call({
    String? articleText = '',
    String? articleTitle = '',
  }) {
    final body = '''
{
  "model": "gpt-3.5-turbo",
  "temperature": 0.4,
  "max_tokens": 500,
  "top_p": 1,
  "frequency_penalty": 0,
  "presence_penalty": 0,
  "messages": [
    {
      "role": "user",
      "content": "summarize article:\\n\\n${articleText}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OpenAI',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic summary(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.content''',
      );
  static dynamic tokens(dynamic response) => getJsonField(
        response,
        r'''$.usage.total_tokens''',
      );
}

class ArticleExtractorCall {
  static Future<ApiCallResponse> call({
    String? urlAddress =
        'https://techcrunch.com/2023/04/20/google-consolidates-ai-research-divisions-into-google-deepmind/',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ArticleExtractor',
      apiUrl: 'https://api.articlextractor.com/v1/extract',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'api_token': "G7iWMcLF0poXbXtSRDMC4B61BSQMCfObsD4JoCH8",
        'url': urlAddress,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic author(dynamic response) => getJsonField(
        response,
        r'''$.data.authors''',
        true,
      );
  static dynamic siteName(dynamic response) => getJsonField(
        response,
        r'''$.data.meta_site_name''',
      );
  static dynamic favicon(dynamic response) => getJsonField(
        response,
        r'''$.data.meta_favicon''',
      );
  static dynamic text(dynamic response) => getJsonField(
        response,
        r'''$.data.text''',
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.data.top_image''',
      );
  static dynamic lang(dynamic response) => getJsonField(
        response,
        r'''$.data.meta_lang''',
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.data.title''',
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.data.url''',
      );
  static dynamic publishDate(dynamic response) => getJsonField(
        response,
        r'''$.data.publish_date''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
