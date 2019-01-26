let draw1=true;
function setup(){
createCanvas(1000,1000);
  console.log("hil");
  textAlign(CENTER, CENTER);
  textSize(20);
}
function draw(){
  fill(255,0,0);
 rect(100, 800, 800, 100);
  line(366, 900, 366, 800);
  line(634, 900, 634, 800);
  fill(0);
  text("Paint", 233, 850);
  text("Eraser", 500, 850);
  text("Clear", 767, 850);
  if(mouseIsPressed&&draw1){
    ellipse(mouseX, mouseY, 10, 10);
  }
  if(mouseIsPressed&&mouseX<366&&mouseX>100&&mouseY<900&&mouseY>800){
   draw1=true;
  }
  if(mouseIsPressed&&mouseX<634&&mouseX>366&&mouseY<900&&mouseY>800){
   draw1=false;
  }
  if(mouseIsPressed&&mouseX<900&&mouseX>634&&mouseY<900&&mouseY>800){
   background(255);
  }
}
