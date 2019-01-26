import 'package:ml_preprocessing/src/raw_data_preprocessor/labels_extractor/labels_extractor_impl.dart';
import 'package:test_api/test_api.dart';

import '../mocks.dart';

void main() {
  final valueConverterMock = MLDataValueConverterMockWithImpl();
  final records = [
    [10.0, 20.0, 30.0, 400.0, 500.0],
    [700.0, 123.0, 756.0, 109.0, 192.0],
    [102.0, 349.0, 203.0, 395.0, 209.0],
    [308.0, 2983.0, 387.0, 249.0, 100.0],
    [10001.0, 208.0, 230.0, 200.0, 800.0],
  ];
  final loggerMock = LoggerMock();

  group('MLDataLabelsExtractorImpl', () {
    test('should extract labels according to given read mask', () {
      final readMask = <bool>[true, true, true, true, true];
      final extractor = MLDataLabelsExtractorImpl(records, readMask, 4, valueConverterMock, loggerMock);
      final actual = extractor.getLabels();

      expect(actual, equals([500, 192, 209, 100, 800]));
    });

    test('should extract labels according to given read mask from pointed column number', () {
      final readMask = <bool>[true, true, true, true, true];
      final extractor = MLDataLabelsExtractorImpl(records, readMask, 0, valueConverterMock, loggerMock);
      final actual = extractor.getLabels();

      expect(actual, equals([10, 700, 102, 308, 10001]));
    });
  });
}
