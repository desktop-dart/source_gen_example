import 'dart:async';

import 'package:analyzer/dart/element/element.dart';

import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

import 'package:annotations/annotations.dart';

/// source_gen hook to generate serializer
class ExampleGenerator extends GeneratorForAnnotation<GenForMe> {
  const ExampleGenerator();

  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) throw UnsupportedError("Only class is supported!");

    return """
class GenFor${element.displayName} {}    
    """;
  }
}

Builder examplePartBuilder({String header}) => new PartBuilder(
  [new ExampleGenerator()],
  '.example.dart',
  header: header,
);