function preload(){
let font = loadFont('assets/SourceSansPro-Regular.otf');
}
function setup(){
createCanvas(1000,1000);
  console.log("hi");
  textAlign(CENTER, CENTER);
  textFont(font);
}
function draw(){
  fill(255,0,0);
 rect(100, 800, 800, 100);
  line(366, 900, 366, 800);
  line(634, 900, 634, 800);
  text('Paint', 200, 850);
}
