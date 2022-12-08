void main() {
  String fixWord(String aWord) {
    String y = aWord.toLowerCase();
    String z = y.substring(1);
    String x = aWord[0].toUpperCase();
    print(x + z);
    return x + z;
  }

  fixWord("aWord");
}
