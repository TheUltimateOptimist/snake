import 'package:flutter_test/flutter_test.dart';

testMethod(String functionName, List<void Function(String name)> testCases) {
  for (var testCase in testCases) {
    testCase(functionName);
  }
}

void Function(String functionName) testInput(
    String inputDescription, dynamic actual, dynamic matcher) {
  return (String functionName) {
    test("$functionName Test with $inputDescription", () {
      expect(actual, matcher);
    });
  };
}