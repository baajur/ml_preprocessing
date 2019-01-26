import 'package:logging/logging.dart';
import 'package:ml_preprocessing/src/raw_data_preprocessor/read_mask_creator/read_mask_creator.dart';
import 'package:ml_preprocessing/src/raw_data_preprocessor/read_mask_creator/read_mask_creator_factory.dart';
import 'package:ml_preprocessing/src/raw_data_preprocessor/read_mask_creator/read_mask_creator_impl.dart';

class MLDataReadMaskCreatorFactoryImpl implements MLDataReadMaskCreatorFactory {
  const MLDataReadMaskCreatorFactoryImpl();

  @override
  MLDataReadMaskCreator create(Logger logger) => MLDataReadMaskCreatorImpl(logger);
}
