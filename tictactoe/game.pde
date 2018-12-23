 void lines(){
  fill(0);
  strokeWeight(20);
  line(300, 0, 300, 900);
  line(600, 0, 600, 900);
  line(0, 300, 900, 300);
  line(0, 600, 900, 600);
}
population pop;
player players[];
int gen = 0;
int[][] board;
int turn = 0;
int numfill = 0;
boolean done = false;
boolean win = false;
int timer = 0;
int numGames = 0;
boolean doner = false;
int first = -10;
void setup(){
  size(900,900);
  background(255);
  lines();
  pop = new population(10);
  players = pop.generate();
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
  if(!doner){
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
      if(board[i][2] == 1){
        players[0].fitness += 6;
        players[1].fitness -= 7;
      }
      else{
        players[0].fitness -= 7;
        players[1].fitness += 6;
      }
    }
    if(board[0][i] == board[1][i]&&board[0][i] == board[2][i]&&board[2][i] != 0){
      done = true;
      win=true;
      if(board[2][i] == 1){
        players[0].fitness += 6;
        players[1].fitness -= 7;
      }
      else{
        players[0].fitness -= 7;
        players[1].fitness += 6;
      }
    }
  }
  if(board[0][0] == board[1][1]&&board[1][1] == board[2][2]&&board[2][2] != 0){
    done = true;
    win=true;
    if(board[2][2] == 1){
        players[0].fitness += 6;
        players[1].fitness -= 7;
      }
      else{
        players[0].fitness -= 7;
        players[1].fitness += 6;
      }
  }
  if(board[0][2] == board[1][1]&&board[1][1] == board[2][0]&&board[2][0] != 0){
    done = true;
    win=true;
    if(board[0][2] == 1){
        players[0].fitness += 6;
        players[1].fitness -= 7;
      }
      else{
        players[0].fitness -= 7;
        players[1].fitness += 6;
      }
  }
  if(done){
    delay(500);
    for(int i = 0;i<3;i++){
    for(int j = 0;j<3;j++){
      board[i][j] = 0;
    }
  }
  if(!win){
    players[0].fitness += 2;
    players[1].fitness += 2;
  }
  numGames++;
  players[0].trys = 0;
  players[1].trys = 0;
  turn = 0;
  win = false;
  done = false;
  if(numGames > 45){
    numGames = 0;
    pop = pop.bababa();
    gen++;
    if(gen>20){
      doner=true;
    }
  }
  players = pop.generate();
  }
  if(millis()-timer>11000){
    done = true;
    timer = millis();
    players[0].fitness -= 4;
    players[1].fitness -= 4;
  }
}
else{
  if(done){
    delay(500);
    done = false;
    first = -10;
    for(int i = 0;i<3;i++){
    for(int j = 0;j<3;j++){
      board[i][j] = 0;
    }
  }
  }
  if(first<0){
  turn = floor(random(2));
    first = turn;
  }
  numfill=0;
    if(turn==0&&!done){
      if(first==0){
        pop.dems1[4].play();
      }
      else{
        pop.dems2[4].play();
      }
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
    }
    if(board[0][i] == board[1][i]&&board[0][i] == board[2][i]&&board[2][i] != 0){
      done = true;
    }
  }
  if(board[0][0] == board[1][1]&&board[1][1] == board[2][2]&&board[2][2] != 0){
    done = true;
  }
  if(board[0][2] == board[1][1]&&board[1][1] == board[2][0]&&board[2][0] != 0){
    done = true;
  }
      turn = 1;
    }
}
}
void mouseClicked(){
  if(turn==1&&!done){
    for(int i=0;i<3;i++){
      for(int j=0;j<3;j++){
      if(mouseY>300*i&&mouseY<300*(i+1)){
        if(mouseX>300*j&&mouseX<300*(j+1)){
        board[i][j] = 2*first-1;
      }
      }
    }
    }
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
    }
    if(board[0][i] == board[1][i]&&board[0][i] == board[2][i]&&board[2][i] != 0){
      done = true;
    }
  }
  if(board[0][0] == board[1][1]&&board[1][1] == board[2][2]&&board[2][2] != 0){
    done = true;
  }
  if(board[0][2] == board[1][1]&&board[1][1] == board[2][0]&&board[2][0] != 0){
    done = true;
  }
    turn = 0;
  }
}
