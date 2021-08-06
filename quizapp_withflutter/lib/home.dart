import 'package:flutter/material.dart';
import 'package:quizapp_withflutter/answer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      //cevap seçilmiş ise
      answerWasSelected = true;
      // cevap seçilecek ise
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      _scoreTracker.add(answerScore
          ? Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : Icon(
              Icons.cancel,
              color: Colors.red,
            ));
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    if (_questionIndex >= _questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(
          "Quiz Uygulaması",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                if (_scoreTracker.length == 0)
                  SizedBox(
                    height: 25.0,
                  ),
                if (_scoreTracker.length > 0) ..._scoreTracker
              ],
            ),
            Container(
              width: double.infinity,
              height: 130,
              margin: EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  _questions[_questionIndex]['question'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...(_questions[_questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map(
              (answer) => Answer(
                answerText: answer['answerText'],
                answerColor: answerWasSelected
                    ? answer['score']
                        ? Colors.green
                        : Colors.red
                    : null,
                answerTap: () {
                  if (answerWasSelected) {
                    return;
                  }
                  _questionAnswered(answer['score']);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "${_totalScore.toString()}/${_questions.length}",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 40.0),
                  primary: Colors.orangeAccent,
                ),
                onPressed: () {
                  if (!answerWasSelected) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Lütfen Soruyu Cevaplayınız!!"),
                      ),
                    );
                    return;
                  }
                  _nextQuestion();
                },
                child: Text(endOfQuiz ? 'Yeniden Başlat' : 'Sıradaki Soru'),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            if (answerWasSelected && !endOfQuiz)
              Container(
                height: 80,
                width: double.infinity,
                color: correctAnswerSelected ? Colors.green : Colors.red,
                child: Center(
                  child: Text(
                    correctAnswerSelected
                        ? "İyi Gidiyorsun!"
                        : "Yanlış Cevap :/",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (endOfQuiz)
              Container(
                height: 80,
                width: double.infinity,
                color: Colors.orangeAccent,
                child: Center(
                  child: Text(
                    _totalScore > 4
                        ? 'Tebrikler: $_totalScore'
                        : 'Final Skorun: $_totalScore. Bir dahaki sefere daha iyi şanslar!',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: _totalScore > 4 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

final _questions = const [
  {
    'question': 'Yeni Zelanda nın Ninety Mile Plajı ne kadardır?',
    'answers': [
      {'answerText': '88km, yani 55 mil uzunluğunda.', 'score': true},
      {'answerText': '55km, yani 34 mil uzunluğunda.', 'score': false},
      {'answerText': '90km, yani 56 mil uzunluğunda.', 'score': false},
    ],
  },
  {
    'question':
        'Alman Oktoberfest festivali en çok hangi ayda gerçekleşir?',
    'answers': [
      {'answerText': 'Ocak', 'score': false},
      {'answerText': 'Ekim', 'score': false},
      {'answerText': 'Eylül', 'score': true},
    ],
  },
  {
    'question': 'Sonic the Hedgehog 3 ün müziğini kim besteledi?',
    'answers': [
      {'answerText': 'Britney Spears', 'score': false},
      {'answerText': 'Timbaland', 'score': false},
      {'answerText': 'Michael Jackson', 'score': true},
    ],
  },
  {
    'question': 'Gürcistan da (eyalet), çatalla ne yemek yasa dışı?',
    'answers': [
      {'answerText': 'Hamburger', 'score': false},
      {'answerText': 'Kızarmış Tavuk', 'score': true},
      {'answerText': 'Pizza', 'score': false},
    ],
  },
  {
    'question':
        'Kiss ten müzisyen Gene Simmons, vücudunun hangi bölümünü bir milyon dolara sigortalattı?',
    'answers': [
      {'answerText': 'His tongue', 'score': true},
      {'answerText': 'His leg', 'score': false},
      {'answerText': 'His butt', 'score': false},
    ],
  },
  {
    'question': 'Panama şapkaları hangi ülkede yapılır?',
    'answers': [
      {'answerText': 'Ekvador', 'score': true},
      {'answerText': 'Panama', 'score': false},
      {'answerText': 'Portekiz', 'score': false},
    ],
  },
  {
    'question': 'Patates kızartması hangi ülkeden geliyor?',
    'answers': [
      {'answerText': 'Belçika', 'score': true},
      {'answerText': 'Fransa', 'score': false},
      {'answerText': 'İsviçre', 'score': false},
    ],
  },
  {
    'question': 'Hangi deniz canlısının üç kalbi vardır?',
    'answers': [
      {'answerText': 'Büyük Beyaz Köpekbalıkları', 'score': false},
      {'answerText': 'balinalar', 'score': false},
      {'answerText': 'Ahtapot', 'score': true},
    ],
  },
  {
    'question': 'Hangi Avrupa ülkesi kişi başına en çok çikolata tüketiyor?',
    'answers': [
      {'answerText': 'Belçika', 'score': false},
      {'answerText': 'Hollanda', 'score': false},
      {'answerText': 'İsviçre', 'score': true},
    ],
  },
];
