List<int> numbers = [1, 2, 3, 4, 5, 4, 3, 2, 1];

String nums = "1,2,3,4,5,6,7,8,656,43,21";

String answerText =
    """The proper response to "What's your name?" when the person is asking for your last name would be to simply say your last name, for example: "Smith." If the person asked for your full name, you could respond with both your first and last name, for example: "John Smith." It's always a good idea to pay attention to the""";

void main() {
  print(numbers
      .map((num) {
        return "$num is ${num % 2 == 0 ? 'even' : 'odd'}.";
      })
      .toList()
      .join("\n"));

  print(nums.split(","));

  print("The word length are:");
  print(
      answerText.split(" ").map((e) => "$e: ${e.length}").toList().join("\n"));
}
