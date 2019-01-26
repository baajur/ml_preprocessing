import 'package:ml_preprocessing/src/categorical_data_encoder/encoder_type.dart';
import 'package:tuple/tuple.dart';

abstract class MLDataParamsValidator {
  String validate({
    int labelIdx,
    Iterable<Tuple2<int, int>> rows,
    Iterable<Tuple2<int, int>> columns,
    bool headerExists,
    Map<String, Iterable<Object>> predefinedCategories,
    Map<String, CategoricalDataEncoderType> namesToEncoders,
    Map<int, CategoricalDataEncoderType> indexToEncoder,
  });
}
