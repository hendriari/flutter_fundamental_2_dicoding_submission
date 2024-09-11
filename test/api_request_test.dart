import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttter_fundamental_submission_2/src/core/error/dio_exception_handler.dart';
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/constants_base_url.dart';
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/dio_request.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/datasource/restaurants_remote_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'api_request_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late RestaurantsRemoteDatasource restaurantsRemoteDatasource;
  late MockDio mockDio;
  late ConstantsBaseUrl constantsBaseUrl;
  late DioRequest dioRequest;
  late DioExceptionHandler dioExceptionHandler;

  setUp(() {
    constantsBaseUrl = ConstantsBaseUrl();
    dioExceptionHandler = DioExceptionHandler();
    dioRequest = DioRequest(constantsBaseUrl, dioExceptionHandler, {});
    restaurantsRemoteDatasource = RestaurantsRemoteDatasourceImpl(
      dioRequest,
      constantsBaseUrl,
    );
    mockDio = MockDio();
  });

  /// GET RESTAURANTS
  test(
    'get list restaurants',
    () async {
      Response? expectation =
          await dioRequest.get(url: constantsBaseUrl.listRestaurants);

      final data = expectation?.data['restaurants'];

      when(mockDio.get(constantsBaseUrl.listRestaurants)).thenAnswer(
        (_) async => Response(
          data: data,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await restaurantsRemoteDatasource.getListRestaurants();

      expect(result?.map((e) => e.toJson()).toList(), data);
    },
  );

  /// GET DETAIL RESTAURANTS
  test(
    'get detail restaurants',
    () async {
      Response? expectation = await dioRequest.get(
          url: constantsBaseUrl.detailRestaurants('rqdv5juczeskfw1e867'));

      final data = expectation?.data['restaurant'];

      when(mockDio
              .get(constantsBaseUrl.detailRestaurants('rqdv5juczeskfw1e867')))
          .thenAnswer(
        (_) async => Response(
          data: data,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await restaurantsRemoteDatasource
          .getDetailRestaurants('rqdv5juczeskfw1e867');

      expect(result?.toJson(), data);
    },
  );

  /// SEARCH RESTAURANTS
  group('search restaurants', () {
    test('available result', () async {
      Response? expectation = await dioRequest.get(
          url: constantsBaseUrl.searchRestaurants('makan'));

      final data = expectation?.data['restaurants'];

      when(mockDio.get(constantsBaseUrl.searchRestaurants('makan'))).thenAnswer(
        (_) async => Response(
          data: data,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result =
          await restaurantsRemoteDatasource.searchRestaurants('makan');

      expect(result?.map((e) => e.toJson()), data);
    });

    test('unavailable result', () async {
      Response? expectation = await dioRequest.get(
          url: constantsBaseUrl.searchRestaurants('makan enak murah'));

      final data = expectation?.data['restaurants'];

      when(mockDio.get(constantsBaseUrl.searchRestaurants('makan enak murah')))
          .thenAnswer(
        (_) async => Response(
          data: data,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await restaurantsRemoteDatasource
          .searchRestaurants('makan enak murah');

      expect(result?.map((e) => e.toJson()), []);
    });
  });

  test(
    'post review',
    () async {
      List<Map<String, dynamic>>? expectation = [
        {
          "name": "Ahmad",
          "review": "Tidak rekomendasi untuk pelajar!",
          "date": "13 November 2019"
        },
        {
          "name": "tukijo",
          "review": "resto enak murah mantap",
          "date": "11 September 2024"
        },
      ];

      when(mockDio.post(
        constantsBaseUrl.postReview,
        data: {
          "id": 'rqdv5juczeskfw1e867',
          "name": 'tukijo',
          "review": 'resto enak murah mantap',
        },
      )).thenAnswer(
        (_) async => Response(
          data: expectation,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await restaurantsRemoteDatasource.postReview(
        'rqdv5juczeskfw1e867',
        'tukijo',
        "resto enak murah mantap",
      );

      expect(result?.map((e) => e.toJson()).toList(), expectation);
    },
  );
}
