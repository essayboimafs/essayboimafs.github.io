let draw1 = true;
let color = "";
let input1 = document.getElementById("color");
function hexToRgb(hex) {
    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    } : null;
}
function setup(){
createCanvas(1000,1000);
  console.log("hil");
  textAlign(CENTER, CENTER);
  textSize(20);
}
function draw(){
  input1 = document.getElementById("color");
    color = input1.value;
  stroke(0)
  fill(255,0,0);
 rect(100, 800, 800, 100);
  line(366, 900, 366, 800);
  line(634, 900, 634, 800);
  fill(0);
  text("Paint", 233, 850);
  text("Eraser", 500, 850);
  text("Clear", 767, 850);
  if(mouseIsPressed){
    if(draw1){
    stroke(hexToRgb(color).r, hexToRgb(color).g, hexToRgb(color).b);
      strokeWeight(10);
      line(pmouseX, pmouseY, mouseX, mouseY);
      strokeWeight(1);
  }
  else{
    stroke(255);
    strokeWeight(20);
      line(pmouseX, pmouseY, mouseX, mouseY);
      strokeWeight(1);
    stroke(0)
  }
  }
  if(mouseIsPressed&&mouseX<366&&mouseX>100&&mouseY<900&&mouseY>800){
   draw1 = true;
  }
  if(mouseIsPressed&&mouseX<634&&mouseX>366&&mouseY<900&&mouseY>800){
   draw1 = false;
  }
  if(mouseIsPressed&&mouseX<900&&mouseX>634&&mouseY<900&&mouseY>800){
   background(255);
  }
}
