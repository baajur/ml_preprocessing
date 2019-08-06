import 'package:ml_linalg/dtype.dart';
import 'package:ml_linalg/linalg.dart';
import 'package:ml_linalg/matrix.dart';
import 'package:ml_preprocessing/src/data_frame/dataframe.dart';
import 'package:ml_preprocessing/src/data_frame/dataframe_helpers.dart';
import 'package:ml_preprocessing/src/data_frame/series.dart';

class DataFrameImpl implements DataFrame {
  DataFrameImpl(this.rows, this.header) :
        series = convertRowsToSeries(rows, header);

  DataFrameImpl.fromSeries(this.series) :
        header = series.map((series) => series.header),
        rows = convertSeriesToRows(series);

  @override
  final Iterable<String> header;

  @override
  final Iterable<Iterable<dynamic>> rows;

  @override
  final Iterable<Series> series;

  @override
  Matrix toMatrix([DType dtype = DType.float32]) => null;
}
