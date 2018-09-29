library jaguar_serializer_cli;

import 'package:build/build.dart';
import 'src/generator_base.dart';

Builder exampleBuilder(BuilderOptions options) =>
    examplePartBuilder(header: options.config['header'] as String);
