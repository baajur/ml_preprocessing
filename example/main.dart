import 'dart:async';

import 'package:ml_preprocessing/ml_preprocessing.dart';
import 'package:ml_preprocessing/src/data_frame/data_frame.dart';
import 'package:ml_preprocessing/src/data_reader/data_reader.dart';
import 'package:ml_preprocessing/src/encoder/pipeable/label_encode.dart';
import 'package:ml_preprocessing/src/encoder/pipeable/one_hot_encode.dart';
import 'package:ml_preprocessing/src/pipeline/pipeline.dart';

Future main() async {
  final data = await DataReader
      .csv('example/dataset.csv')
      .read();

  final dataFrame = DataFrame(
    data,
    headerExists: true,
    columns: [0, 1, 2, 3],
  );

  final processed = Pipeline([
    oneHotEncode(
      columnNames: ['position'],
      headerPostfix: '_position',
    ),
    labelEncode(
      columnNames: ['country'],
    ),
  ]).apply(dataFrame);

  print(processed.toMatrix());
}
