import 'dart:math' as math;

import 'package:logging/logging.dart';
import 'package:ml_preprocessing/src/common/error_logger_mixin.dart';
import 'package:ml_preprocessing/src/raw_data_preprocessor/read_mask_creator/read_mask_creator.dart';
import 'package:tuple/tuple.dart';

class MLDataReadMaskCreatorImpl extends Object with ErrorLoggerMixin implements MLDataReadMaskCreator {
  static const String emptyRangesMsg = 'Columns/rows read ranges list cannot be empty!';

  @override
  final Logger logger;

  MLDataReadMaskCreatorImpl(this.logger);

  @override
  List<bool> create(Iterable<Tuple2<int, int>> ranges) {
    if (ranges.isEmpty) {
      throwException(emptyRangesMsg);
    }
    final numberOfElements = ranges.last.item2 + 1;
    final mask = List<bool>.filled(numberOfElements, false);
    ranges.forEach((Tuple2<int, int> range) {
      if (range.item1 >= numberOfElements) {
        return false;
      }
      final end = math.min(numberOfElements, range.item2 + 1);
      mask.fillRange(range.item1, end, true);
    });
    return mask;
  }
}
