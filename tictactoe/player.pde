class player{
  int let;
  player(int let){
    this.let = let;
  }
  float i = 0;
  float j = 0;
  int trys = 0;
  void play(){
    if(!done){
  while(board[int(i)][int(j)] != 0 || trys == 0){
    i = floor(random(3));
    j = floor(random(3));
    trys++;
  }
  board[int(i)][int(j)] = let;
    }
}
}
