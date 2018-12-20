void lines(){
  fill(0);
  strokeWeight(20);
  line(300, 0, 300, 900);
  line(600, 0, 600, 900);
  line(0, 300, 900, 300);
  line(0, 600, 900, 600);
}
player players[];
int[][] board;
int turn = 0;
int numfill = 0;
boolean done = false;
boolean win = false;
void setup(){
  size(900,900);
  background(255);
  lines();
  players = new player[2];
  players[0] = new player(1);
  players[1] = new player(-1);
  board = new int[3][3];
  for(int i = 0;i<3;i++){
    for(int j = 0;j<3;j++){
      board[i][j] = 0;
    }
  }
}
void draw(){
  numfill = 0;
  delay(1000);
  background(255);
  lines();
  players[turn].play();
  turn = 1-turn;
  for(int i = 0;i<3;i++){
    for(int j = 0;j<3;j++){
      if(board[i][j]==1){
        line(300*j+50, 300*i+50, 300*(j+1)-50, 300*(i+1)-50);
        line(300*j+50, 300*(i+1)-50, 300*(j+1)-50, 300*i+50);
        numfill++;
      }
      if(board[i][j]==-1){
        noFill();
        ellipse(300*j+150, 300*i+150, 200, 200);
        numfill++;
      }
    }
  }
  if(numfill==9){
    done = true;
  }
  for(int i=0;i<3;i++){
    if(board[i][0] == board[i][1]&&board[i][0] == board[i][2]&&board[i][2] != 0){
      done = true;
      win=true;
    }
    if(board[0][i] == board[1][i]&&board[0][i] == board[2][i]&&board[2][i] != 0){
      done = true;
      win=true;
    }
  }
  if(board[0][0] == board[1][1]&&board[1][1] == board[2][2]&&board[2][2] != 0){
    done = true;
    win=true;
  }
  if(board[0][2] == board[1][1]&&board[1][1] == board[2][0]&&board[2][0] != 0){
    done = true;
    win=true;
  }
  if(done){
    delay(500);
    for(int i = 0;i<3;i++){
    for(int j = 0;j<3;j++){
      board[i][j] = 0;
    }
  }
  players[0].trys = 0;
  players[1].trys = 0;
  turn = 0;
  win = false;
  done = false;
  }
}
