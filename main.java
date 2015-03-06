//merge test
//Create all object's
Player PlayerMario = new Player(5, 200, 14, 20, {'standingMario.gif'}, 1);
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
BlockElements Boden = new BlockElements(0, 300, 300, 10, {'views/texture.jpg'}, false, 0, false, false ,false); // X / Y / Länge / Höhe
BlockElements Boden2 = new BlockElements(100, 250, 200, 10, {'views/texture.jpg'}, false, 0, false, false ,false);
BlockElements Boden3 = new BlockElements(200, 200, 100, 10, {'views/texture.jpg'}, false, 0, false, false ,false);
BlockElements Boden4 = new BlockElements(400, 250, 100, 10, {'views/texture.jpg'}, false, 0, false, false ,false);
BlockElements Boden3 = new BlockElements(550, 300, 100, 10, {'views/texture.jpg'}, false, 0, false, false ,false);
BlockElements Boden3 = new BlockElements(800, 205, 100, 10, {'views/texture.jpg'}, false, 0, false, false ,false);

BlockElements Bodenstatic = new BlockElements(180, 150, 100, 10, {'views/texture.jpg'}, false, 0, false, false ,true);

BlockElements FallingGroundDMG = new BlockElements(200, 100, 100, 20, {'views/falling.png'}, true, 7, false, false ,true);
BlockElements FallingGroundNone = new BlockElements(310, -10, 50, 10, {'views/texture.jpg'}, true, 1, true, true, false);
BlockElements FallingGroundNone = new BlockElements(310, -100, 50, 10, {'views/texture.jpg'}, true, 1, true, true, false);
BlockElements FallingGroundNone = new BlockElements(310, -190, 50, 10, {'views/texture.jpg'}, true, 1, true, true, false);
BlockElements FallingGroundNone = new BlockElements(310, -270, 50, 10, {'views/texture.jpg'}, true, 1, true, true, false);
BlockElements FallingGroundNone = new BlockElements(710, -10, 50, 10, {'views/texture.jpg'}, true, 1, true, true, false);
//Destroyeble Block Elements
DestroyableBlocksElements DBE = new DestroyableBlocksElements(50, 240, 20, 20, {'views/texture.jpg'}, 'NoLoot', 'Event');
DestroyableBlocksElements DBE = new DestroyableBlocksElements(50, 190, 20, 20, {'views/texture.jpg'}, 'NoLoot', 'Event');
//BlockElements Boden3 = new BlockElements(200, 100, 200, 50);


//Enemys
Enemy K = new Enemy(250, 20,20,20,1,100,true,false,false,{'lexuEnemy_walkLeft.png','lexuEnemy_walkRight.png'}); // X + Y Spawnpoint
Enemy K = new Enemy(150, 20,20,20,1,100,true,false,false,{'lexuEnemy_walkLeft.png','lexuEnemy_walkRight.png'}); // X + Y Spawnpoint
	//Spritebank.preloadImages();
	
	//Loading pic's for the Aninmation and Movement
	BlockTexture = loadImage("views/texture.jpg"); 
	FallingB = loadImage("views/falling.png"); 
	standingMario = loadImage("views/Running-mario4.gif");  
	jumpMario = loadImage("views/Jumping-mario.gif");
	jumpMarioLeft = loadImage("views/Jumping-marioleft.gif");
	FeuerB = loadImage("views/Feuerball.png");
	Koopa = loadImage("views/koopa.png");
	gameover = loadImage("views/gameover.png");
	bg = loadImage("views/hintergrund.png");
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
		setup(); // reset the game datas
		GameIsLose = false;
	}else{
	background(255, 204, 0); // Überdeckt das gezeichnete
	background(bg);
	//Loading all Block Elements
	for(int x=0; x < AnzahlObjekte; x++){
		MaxBlockElements[x].BlockPlacing();
	}
	for (Entity d : Entity.Entities){
		if(d instanceof DestroyableBlocksElements){
			d.DestroyableBlockPlacing();
		}
	}
	for(int c=0; c < AnzahlFire; c++){
		if(MaxFireBall[c] != null){
		MaxFireBall[c].einfeuerball();	
		}
	}
	if(Gravity == true){
		PlayerMario.y += GravityKraft;
		GravityKraft += 0.5;
		//Gravity wird ausgeführt obwohl sie off gestellt wurde?^^
		//println(GravityKraft);
	}
	//Spritebank.testdraw();
	Enemy.update();
	Player.BlockUpdater();
	PlayerMario.Movement(); // Keys Event's - Movement
	PlayerMario.PlayerDie(); //Player Mario Die
	//BlockElements.Collision(); // Aktiviere Player Kollision
	//Player.TestingSuperClass();
	Entity.draw(); // Render Enemy and Player
	Player.Tracker();
	
	BlockElements.BlockTrigger();
	BlockElements.BlockFalling();
	BlockElements.BlockDmg();
	}
}
void keyPressed() {
  if (key == 'n' || key == 'N') {
	println("NeuStart");
	if(GameIsLose == true){
		println("Geht nicht!");
	}else{
		GameIsLose = false;
	}
	
  }	
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