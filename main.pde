//Create all object's
Player PlayerMario = new Player(5, 200, 14, 20, {'standingMario.gif'}, 3);
//Animation Stuff
int numFrames = 4;  // The number of frames in the animation
int frame = 0;
int numFrames2 = 4;  
int frame2 = 0;
int numFrames3 = 3;  
int frame3 = 0;
int counts;
PImage[] images = new PImage[numFrames];
PImage2[] images2 = new PImage2[numFrames2];
PImage3[] images3 = new PImage3[numFrames3];

MaxBlockElements = [];
MaxEnemyElements = [];
MaxFireBall = [];
private int AnzahlFire = 0;
private int AnzahlEnemy = 0;
private int AnzahlObjekte = 0;
//Block Elements
BlockElements Boden = new BlockElements(0, 300, 400, 10, {'views/texture.jpg'}); // X / Y / Länge / Höhe
BlockElements Boden2 = new BlockElements(100, 250, 200, 10, {'views/texture.jpg'});
BlockElements Boden3 = new BlockElements(200, 200, 100, 10, {'views/texture.jpg'});
//BlockElements Boden3 = new BlockElements(200, 100, 200, 50);


//Enemys
Enemy K = new Enemy(250, 20,20,20,1,100,true,false,false,{'lexuEnemy_walkLeft.png','lexuEnemy_walkRight.png'}); // X + Y Spawnpoint
Enemy K = new Enemy(150, 20,20,20,1,100,true,false,false,{'lexuEnemy_walkLeft.png','lexuEnemy_walkRight.png'}); // X + Y Spawnpoint
//Enemy Koopa2 = new Enemy(275, 25); // X + Y Spawnpoint
//Enemy Koopa3 = new Enemy(400, 30); // X + Y Spawnpoint
//Anziehungskraft

private boolean Gravity = true;
private boolean EnemyGravity = true;
final private byte GravityKraft = 5;
boolean FramesBlocker = false;
double AnzahlFramesSpeicher;
//Animation Stuff end
double AnzahlFrames;
byte JumpOptik = 0;
byte MovementMaxSpeed = 3;
boolean LastPressed;
boolean Fire = false;
boolean FeuerBallRichtung;
boolean debug = true;
boolean GameIsLose = false;
//boolean ObjectGravity = true; AnzahlFrames += 15;
void setup(){
	size(600, 500); // Grösse des Spielfeldes
	frameRate( 40 ); // Bilderrate pro Sekunde 40
	
	Spritebank.preloadImages();
	
	//Loading pic's for the Aninmation and Movement
	BlockTexture = loadImage("views/texture.jpg"); 
	standingMario = loadImage("views/Running-mario4.gif");  
	jumpMario = loadImage("views/Jumping-mario.gif");
	jumpMarioLeft = loadImage("views/Jumping-marioleft.gif");
	FeuerB = loadImage("views/Feuerball.png");
	Koopa = loadImage("views/koopa.png");
	gameover = loadImage("views/gameover.png");
	images[0]  = loadImage("views/Running-mario1.gif");
    images[1]  = loadImage("views/Running-mario2.gif");
	images[2]  = loadImage("views/Running-mario3.gif");
	images[3]  = loadImage("views/Running-mario4.gif");
	
	images2[0]  = loadImage("views/Running-marioleft1.gif");
    images2[1]  = loadImage("views/Running-marioleft2.gif");
	images2[2]  = loadImage("views/Running-marioleft3.gif");
	images2[3]  = loadImage("views/Running-marioleft4.gif");
	
	images3[0]  = loadImage("views/Feuerball.png");
    images3[1]  = loadImage("views/Feuerball2.png");
	images3[2]  = loadImage("views/Feuerball3.png");
	
	
	if (debug) {noLoop();}
}

void draw(){
	if(GameIsLose == true){
		//open the Game Settings
	}else{
	background( 300 ); // Überdeckt das gezeichnete
	//Loading all Block Elements
	for(int x=0; x < AnzahlObjekte; x++){
		MaxBlockElements[x].BlockPlacing();
	}
	for(int c=0; c < AnzahlFire; c++){
		if(MaxFireBall[c] != null){
		MaxFireBall[c].einfeuerball();	
		}
	}
	if(Gravity == true){
		PlayerMario.y += GravityKraft;
	}
	Spritebank.testdraw();
	Enemy.update();
	PlayerMario.Movement(); // Keys Event's - Movement
	PlayerMario.PlayerDie(); //Player Mario Die
	Player.isOnGround();
	//BlockElements.Collision(); // Aktiviere Player Kollision
	//Player.TestingSuperClass();
	Entity.draw(); // Render Enemy and Player
	}
}
void keyPressed() {
 
  if (key == 'j' || key == 'J') {
	println("Spring mario spring!");
	MovementMaxSpeed = 4.5;
	
  }	
  if (key == 's' || key == 'S') {
	Enemy Koopa = new Enemy(250, 20,20,20,1,100,true,false,false,{'lexuEnemy_walkLeft.png','lexuEnemy_walkRight.png'}); // X + Y Spawnpoint
  }
  if (key == 'k' || key == 'K') {
		//Fire = true;
		if(PlayerMario.RightSpeed == true){
			FeuerBallRichtung = true;
		}else if(PlayerMario.LeftSpeed == true){
			FeuerBallRichtung = false;
		}else{
			if(LastPressed == true){
			FeuerBallRichtung = false;
			}else{
			FeuerBallRichtung = true;	
			}
		}
		FeuerBall FeuerB = new FeuerBall(FeuerBallRichtung);
		//println(FeuerB.firex);
  }	
  if (key == 32) {
	println("Spring mario spring!");
	PlayerMario.UpSpeed = true;
  }
  
  if (key == CODED) {
	if(keyCode == LEFT && keyCode == RIGHT){
		PlayerMario.RightSpeed = false;
		PlayerMario.LeftSpeed = false;
	}else{
    if(keyCode == RIGHT){
	
		PlayerMario.RightSpeed = true;
		
	}else if(keyCode == LEFT){
	
		PlayerMario.LeftSpeed = true;
		
	}else if(keyCode == UP){
	
		PlayerMario.UpSpeed = true;
		
	}
	}
}
}
void keyReleased() {
	if (key == 'p' || key == 'P') {
		loop();
	}
	if (key == 'o' || key == 'O') {
		noLoop();
	}
	if (key == 'i' || key == 'I') {
		redraw();
	}
	if (key == 'j' || key == 'J') {
		MovementMaxSpeed = 3;
	}		  
	if (key == 32) {
		PlayerMario.UpSpeed = false;
	}
	  
	if (key == CODED) {

			if(keyCode == RIGHT){
			
				PlayerMario.RightSpeed = false;
				LastPressed = false;
				
			}else if(keyCode == LEFT){
			
				PlayerMario.LeftSpeed = false;
				LastPressed = true;
				
			}else if(keyCode == UP){
			
				PlayerMario.UpSpeed = false;
				AnzahlFrames += 15;
			}
		
	}
}