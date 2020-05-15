import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  home: Game()
));



class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  List<String> questions = [
    'THE DIRECTOR OF TITANIC AND AVATAR WAS THE SAME?' ,
    'ITALY IS IN NORTHERN EUROPE?',
    'RUSSIA HAS A LARGER SURFACE AREA THAN PLUTO?',
    'STEPHEN HAWKING DECLINED A KNIGHTHOOD FROM THE QUEEN?',
    'THE STATUE OF LIBERTY WAS A GIFT FROM THE FRENCH?',
    'IS 97 SQUARED 9509?',
    'MARSHMELLOW IS IT SPELT CORRECTLY?',
    'Z IS THE LEAST OCCURING LETTER IN THE ENGLISH LANGUAGE?',
    'SHERLOCK HOLMES IS A FICTIONAL CHARACTER CREATED BY SIR ARTHUR CONAN DOYLE?',
    'BRAZIL HAS WON THE WORLD CUP 4 TIMES IN FOOTBALL?',
    'WELL DONE',
    'INCORRECT MY FRIEND, TRY AGAIN? (Answering this would not add to your score!!)'
  ];
  List<String> ans = [
    'yes','no','yes','yes','yes','no','no','no','yes','no'
  ];
  List<int> indices=[];
  int score = 0;
  String val='h';
  int r=0;
  String truth;

  Widget tab(int n) {

    if(r>=9 && truth=='true') {
      r=0;
    }

    if(truth=='false')
      {
        n=11;
      }

    if(score==10)
      {n=10;
      }

      if (val == 'h') {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                  padding: EdgeInsets.all(20.0),
                  height: 400.0,
                  width: 348.0,
                  child: Center(
                      child: Text(
                        questions[n],
                        style: TextStyle(
                            fontSize: 40.0
                        ),
                      )
                  ),
                  color: Colors.blue[500]
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.grey,
                    child: SizedBox(
                      height: 100.0,
                      width: 135.0,
                      child: Center(
                          child: Text(
                            'YES',
                            style: TextStyle(
                                fontSize: 50.0
                            ),
                          )
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (n<=9) {
                          if (ans[n] == 'yes') {
                            score++;
                            r=r+1;
                          }
                          else{
                            truth='false';
                          }
                        }
                        else if(n==11){
                          truth='true';
                          r=0;
                          score=0;
                        }
                      });
                    },
                  ),
                  RaisedButton(
                    color: Colors.grey,
                    child: SizedBox(
                      height: 100.0,
                      width: 135.0,
                      child: Center(
                        child: Text(
                            'NO',
                            style: TextStyle(
                                fontSize: 50.0
                            )
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if(n<=9) {
                          if (ans[n] == 'no') {
                            score++;
                            r = r + 1;
                          }
                          else {
                            truth = 'false';
                          }
                        }
                      });
                    },
                  )
                ],
              )
            ]);
      }
      else {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue[200],
                      height: 200,
                      child: Center(
                          child: Text('CURRENT SCORE',style: TextStyle(
                            fontSize: 40.0,
                            letterSpacing: 1.0
                          ),)
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue[200],
                      height: 200,
                      child: Center(
                          child: Text('$score',style: TextStyle(
                            fontSize: 180.0
                          ),)
                      ),
                    ),
              )
            ]);
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Center(child: Text('YES OR NO??')),
            backgroundColor: Colors.blue,
          ),
          body: tab(r),

          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.blue[800],
              onTap: (index){
                setState(() {
                  if(index==0){
                    val='h';
                  }
                  else if(index==1){
                    val='s';
                  }
                  else{
                    val='i';
                  }
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.gamepad),
                    title: Text('Home')
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.score),
                  title: Text('Score'),
                )
              ]
          )
      );
    }
  }
