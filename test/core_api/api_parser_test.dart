import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bantucart/features/core_api/data/network/api_parser.dart';
import 'package:bantucart/features/core_api/domain/errors/api_failure.dart';
import 'package:bantucart/features/core_api/domain/models/domain_models.dart';

void main() {
  group('ApiParser', () {
    test('parses paginated products', () {
      const payload = '''
      {
        "count": 1,
        "next": null,
        "previous": null,
        "results": [
          {
            "id": "p1",
            "shop": {"id": "s1", "name": "Shop A", "rank": "1"},
            "name": "Product A",
            "description": "Desc",
            "price": "10.00",
            "is_on_sale": true,
            "sale_percentage": "5.00",
            "images": [],
            "attributes": {"size": "M"}
          }
        ]
      }
      ''';

      final parsed =
          ApiParser.parsePaginated<Product>(payload, Product.fromJson);

      expect(parsed.count, 1);
      expect(parsed.results.first.id, 'p1');
      expect(parsed.results.first.name, 'Product A');
    });

    test('maps validation-style 400 errors', () {
      final exception = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response<dynamic>(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: <String, dynamic>{
            'email': <String>['already exists'],
            'password': <String>['too short'],
          },
        ),
      );

      final failure = ApiParser.mapDioError(exception);

      expect(
        failure,
        const ApiFailure.badRequest(
            'Bad Request: email: already exists, password: too short'),
      );
    });
  });
}
