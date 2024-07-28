// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuestionsModel {
  final String text;
  final List<String> answers;

  const QuestionsModel({
    required this.text,
    required this.answers,
  });
  List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
