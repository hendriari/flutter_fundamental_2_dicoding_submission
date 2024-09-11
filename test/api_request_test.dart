import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/constants_base_url.dart';
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/dio_request.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/datasource/restaurants_remote_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'api_request_test.mocks.dart';
import 'expectation_response_data_test.dart';

@GenerateMocks([Dio])
void main() {
  late RestaurantsRemoteDatasource restaurantsRemoteDatasource;
  late MockDio mockDio;
  late ConstantsBaseUrl constantsBaseUrl;
  late DioRequest dioRequest;
  late ExpectationResponseDataTest expectationDataTest;

  setUp(() {
    constantsBaseUrl = ConstantsBaseUrl();
    dioRequest = DioRequest(constantsBaseUrl, {});
    restaurantsRemoteDatasource = RestaurantsRemoteDatasourceImpl(
      dioRequest,
      constantsBaseUrl,
    );
    expectationDataTest = ExpectationResponseDataTest();
    mockDio = MockDio();
  });

  /// GET RESTAURANTS
  test(
    'get list restaurants',
    () async {
      when(mockDio.get(constantsBaseUrl.listRestaurants)).thenAnswer(
        (_) async => Response(
          data: expectationDataTest.expectationListRestaurants,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await restaurantsRemoteDatasource.getListRestaurants();

      expect(result?.map((e) => e.toJson()).toList(),
          expectationDataTest.expectationListRestaurants);
    },
  );

  /// GET DETAIL RESTAURANTS
  test(
    'get detail restaurants',
    () async {
      when(mockDio
              .get(constantsBaseUrl.detailRestaurants('rqdv5juczeskfw1e867')))
          .thenAnswer(
        (_) async => Response(
          data: expectationDataTest.expectationDetailRestaurants,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await restaurantsRemoteDatasource
          .getDetailRestaurants('rqdv5juczeskfw1e867');

      expect(
          result?.toJson(), expectationDataTest.expectationDetailRestaurants);
    },
  );

  /// SEARCH RESTAURANTS
  group('search restaurants', () {
    test('available result', () async {
      when(mockDio.get(constantsBaseUrl.searchRestaurants('makan'))).thenAnswer(
        (_) async => Response(
          data: expectationDataTest.expectationSearchRestaurants,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result =
          await restaurantsRemoteDatasource.searchRestaurants('makan');

      expect(result?.map((e) => e.toJson()),
          expectationDataTest.expectationSearchRestaurants);
    });

    test('unavailable result', () async {
      when(mockDio.get(constantsBaseUrl.searchRestaurants('makan enak murah')))
          .thenAnswer(
        (_) async => Response(
          data: [],
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
      when(mockDio.post(
        constantsBaseUrl.postReview,
        data: {
          "name": "kimans",
          "review": "resto enak murah mantap",
          "date": "11 September 2024",
        },
      )).thenAnswer(
        (_) async => Response(
          data: expectationDataTest.expectationPostReview,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await restaurantsRemoteDatasource.postReview(
        'rqdv5juczeskfw1e867',
        'kimans',
        "resto enak murah mantap",
      );

      expect(result?.map((e) => e.toJson()).toList(),
          expectationDataTest.expectationPostReview);
      verify(mockDio.post(constantsBaseUrl.postReview, data: {
        "name": "kimans",
        "review": "resto enak murah mantap",
        "date": "11 September 2024",
      })).called(1);
    },
  );
}
