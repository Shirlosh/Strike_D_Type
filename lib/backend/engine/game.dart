import 'dart:math';
import 'package:uuid/uuid.dart';

class Game {
  static int gameIdGenerator = 0;
  var _id;
  int sameSymbolIdx;

  //The number of symbols on a card has to be a prime number + 1
  int primeNumber;
  int numberOfSymbolsOnCard =
  4; //(3+1)//we will give the user an list of numbers to choose from.
  num numberOfCards = 0;

  List<List<int>> cardsOfCards;
  bool shuffleSymbolsOnCard = false;
  var symbols = <String>[];

  Game(this.numberOfSymbolsOnCard, this.shuffleSymbolsOnCard) {
    //Word out the prime number
    primeNumber = numberOfSymbolsOnCard - 1;

    //Total number of cards that can be generated following the Dobble rules.
    numberOfCards = pow(primeNumber, 2) + primeNumber + 1;
    cardsOfCards = List.generate(0, (it) => []);

    _id = Uuid().v4().substring(0,7);
    initGame();
  }

  String getGameID() {
    return _id;
  }

  int getSameSymbol()
  {
    return sameSymbolIdx;
  }

  List<List<int>> getTwoCards() {
    final random = new Random();
    int n1 = 1, n2 = 1;
    // generate a random index based on the list length
    while (n1 == n2) {
      n1 = random.nextInt(cardsOfCards.length);
      n2 = random.nextInt(cardsOfCards.length);
    }

    List<List<int>> chosenCards = List.generate(0, (it) => []);
    chosenCards.add(cardsOfCards[n1]);
    chosenCards.add(cardsOfCards[n2]);

    final sameSymbolSet = chosenCards.fold<Set>(
        chosenCards.first.toSet(), (a, b) => a.intersection(b.toSet()));

    if (sameSymbolSet.length > 1) {
      throw Exception("There is bug in this game!!");
    }
    sameSymbolIdx = sameSymbolSet.single;
    //TwoCardsDTO gameData = new TwoCardsDTO(chosenCards, sameSymbolIdx.single);

    return chosenCards;
  }

  setSymbols(StringBuffer sb, List<int> card) {
    for (var number in card) {
      sb.write("${symbols[number - 1]}, ");
    }
  }

  void initGame() {
    //Add first set of primeNumber+1 cards (e.g. 8 cards)
    for (int i = 0; i < numberOfSymbolsOnCard; i++) {
      //Add new card with first symbol
      List<int> newList = [1];
      cardsOfCards.add(newList);
      //Add primeNumber+1 symbols on the card (e.g. 8 symbols)
      for (int j = 0; j < primeNumber; j++) {
        cardsOfCards[i].add((j + 1) + (i * primeNumber) + 1);
      }
    }

    //Add primeNumber sets of primeNumber cards
    for (int i = 0; i < primeNumber; i++) {
      for (int j = 0; j < primeNumber; j++) {
        //Append a new card with 1 symbol
        List<int> newList = [i + 2];
        cardsOfCards.add(newList);
        //Add numberOfSymbolsOnCard symbols on the card (e.g. 8 symbols)
        for (int k = 0; k < primeNumber; k++) {
          var val =
              (primeNumber + 1 + primeNumber * k + (i * k + j) % primeNumber) +
                  1;
          cardsOfCards[cardsOfCards.length - 1].add(val);
        }
      }
    }

    if (shuffleSymbolsOnCard) {
      for (var setOfCards in cardsOfCards) {
        setOfCards.shuffle();
      }
    }
  }

  @override
  String toString() {
    var output = StringBuffer();
    var cardsOutput = StringBuffer();

    output.write("primeNumber = $primeNumber\n"
        "numberOfSymbolsOnCard = $numberOfSymbolsOnCard\n"
        "numberOfUniqueCards = $numberOfCards\n"
        "shuffleSymbolsOnCard=$shuffleSymbolsOnCard\n");

    //Output all cards
    int i = 0;
    for (var card in cardsOfCards) {
      i += 1;
      cardsOutput.write("$i -[");
      for (var number in card) {
        cardsOutput.write("${symbols[number - 1]}, ");
      }
      cardsOutput.write(']\n');
    }

    output.write("\n\nThe set of Cards:\n$cardsOutput");

    String dataToPrint = output.toString();
    return dataToPrint;
  }
}
