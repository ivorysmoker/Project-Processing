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
BlockElements Boden = new BlockElements(0, 300, 400, 10); // X / Y / Länge / Höhe
BlockElements Boden2 = new BlockElements(100, 250, 200, 10);
BlockElements Boden3 = new BlockElements(200, 200, 100, 10);
//BlockElements Boden3 = new BlockElements(200, 100, 200, 50);


//Enemys
Enemy Koopa = new Enemy(250, 20,20,20,'Enemy',1,100,true,false,false,{'lexuEnemy_walkLeft.png','lexuEnemy_walkRight.png'}); // X + Y Spawnpoint
Enemy Koopa = new Enemy(150, 20,20,20,'Enemy',1,100,true,false,false,{'lexuEnemy_walkLeft.png','lexuEnemy_walkRight.png'}); // X + Y Spawnpoint
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

	/*for(b=0; b < AnzahlEnemy; b++){
		if(MaxEnemyElements[b] != null){
			if(MaxEnemyElements[b].gms == true){
			MaxEnemyElements[b].EnemyY += GravityKraft;
			}
		}

	/*if(ObjectGravity == true){
		firey += GravityKraft;
	}*/
	Enemy.update();
	PlayerMario.Render(); // PlayerMario - Mario do nothing? Make This
	PlayerMario.Movement(); // Keys Event's - Movement
	PlayerMario.PlayerDie(); //Player Mario Die
	BlockElements.Collision(); // Aktiviere Player Kollision
	Player.TestingSuperClass();
	Entity.draw();
	}
}
void keyPressed() {
 
  if (key == 'j' || key == 'J') {
	println("Spring mario spring!");
	MovementMaxSpeed = 4.5;
	
  }	
  if (key == 's' || key == 'S') {
	Enemy Koopa = new Enemy(250, 20,20,20,'Enemy',1,100,true,false,false,{'lexuEnemy_walkLeft.png','lexuEnemy_walkRight.png'}); // X + Y Spawnpoint
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
/*class Enemy{
	//Positionen
	int EnemyX;
	int EnemyY;
	boolean gms; // Gravity Multi Settings
	//Konstuktor
	Enemy(int x, int y){
		EnemyX = x;
		EnemyY = y;
		gms = true;
		MaxEnemyElements[AnzahlEnemy] = this;
		AnzahlEnemy++;
	}
	public void EnemyMovement(){
		this.EnemyX -= 1;
		image(Koopa, this.EnemyX, this.EnemyY, 20, 20);	
	}
}*/
/* class FeuerBall{
	int firex = PlayerMario.x; 
	int firey = PlayerMario.y;
	int firenumber;
	boolean Richtung;	
	FeuerBall(boolean Seite) {
		firenumber = MaxFireBall.length;
		MaxFireBall[AnzahlFire] = this;
		AnzahlFire++;
		Richtung = Seite;	
	}
	
	public void einfeuerball() {	
		if(this.Richtung == true){
		this.firex = this.firex + 6;
		//Kollision
		for(x=0; x < AnzahlEnemy; x++){
			if(MaxEnemyElements[x] != null){
			if(this.firex >= MaxEnemyElements[x].EnemyX && this.firex <= MaxEnemyElements[x].EnemyX+20 && this.firey >= MaxEnemyElements[x].EnemyY && this.firey <= MaxEnemyElements[x].EnemyY+20){
			 println("Ein Feuerball ist kollidiert!"+this.firenumber);
			 MaxFireBall[this.firenumber] = null;
			 MaxEnemyElements[x] = null;
			 //AnzahlEnemy--;
			}else{
			frame3 = (frame3+1)%numFrames3;
			image(images3[frame3], this.firex, this.firey, 7, 9);
			}
			}
		}
		//Feuerball Left
		}else{
			
		this.firex = this.firex - 6;
		for(x=0; x < AnzahlEnemy; x++){
			if(MaxEnemyElements[x] != null){
			if(this.firex >= MaxEnemyElements[x].EnemyX && this.firex <= MaxEnemyElements[x].EnemyX+20 && this.firey >= MaxEnemyElements[x].EnemyY && this.firey <= MaxEnemyElements[x].EnemyY+20){
				println("Ein Feuerball ist kollidiert!"+this.firenumber);
				MaxFireBall[this.firenumber] = null;
				MaxEnemyElements[x] = null;
				//AnzahlEnemy--;
			}else{
				frame3 = (frame3+1)%numFrames3;
				image(images3[frame3], this.firex, this.firey, 7, 9);	
			}
			}
		}
		}
		}
	}*/


/*class Player{ 
	//Eigenschaften
	int realX = 5; // The Real Player Coord X
	int x = 5; //Actuell Player Coords MAPPING
	int y = 200; 
	int Speed = 0; // Example for Test
	public boolean LeftSpeed = false; //Setzt ob der Linke Pfeilt Aktiv ist
	public boolean RightSpeed = false; //Keyevent trigger
	public boolean UpSpeed = false;
	int Life = 2;
	//Methode wenn Spieler stirbt
	public void FeuerBall(){
		
		//Welche Seite drückt der Spieler
		if(PlayerMario.LeftSpeed == true || LastPressed == true){
					
			firex -= 3;
			//um den feuerball sringen zu lassen, addre bsp alle 3 frame 4 höhe - die gravity wird in automatisch wieder runter drücken
		}else if(PlayerMario.RightSpeed == true || LastPressed == false){
			frame3 = (frame3+1)%numFrames3; 
			image(images3[frame3], firex, firey, 7, 7);
			firex += 3;
		}
	}
	public void Render(){
		if(PlayerMario.RightSpeed == false && PlayerMario.LeftSpeed == false && PlayerMario.UpSpeed == false || PlayerMario.RightSpeed == true && PlayerMario.LeftSpeed == true){
			
			if(PlayerMario.LeftSpeed == true || LastPressed == true){
			image(images2[3], PlayerMario.x, PlayerMario.y, 14, 20);		
			}else if(PlayerMario.RightSpeed == true || LastPressed == false){
			image(images[3], PlayerMario.x, PlayerMario.y, 14, 20);
			}
			
		}
	}
	public void Movement(){
		//Rechts
		
		if(PlayerMario.RightSpeed == true){
			println("Test"+PlayerMario.RightSpeed);
			PlayerMario.x += MovementMaxSpeed;
			//Animation
			frame = (frame+1)%numFrames; 
			image(images[frame], PlayerMario.x, PlayerMario.y, 14, 20);
		}
		//Links
		if(PlayerMario.LeftSpeed == true){
			PlayerMario.x -= MovementMaxSpeed;
			//Animation
			frame2 = (frame2+1)%numFrames2; 
			image(images2[frame2], PlayerMario.x, PlayerMario.y, 14, 20);
		}
		//Nac
		if(PlayerMario.UpSpeed == true){
				if(FramesBlocker == false){
					AnzahlFrames = frameCount;
					AnzahlFramesSpeicher = frameCount;
					FramesBlocker = true;
				}
				if(AnzahlFrames > (AnzahlFramesSpeicher+15)){
					println("Frames wurde erreicht! Springen verboten!");
					image(jumpMario, PlayerMario.x, PlayerMario.y, 14, 20);
					//Blocke das Springen
					PlayerMario.UpSpeed = false;
				}else{
					println(JumpOptik);
						PlayerMario.y -= 4;

				AnzahlFrames++;
				JumpOptik++;
				image(jumpMario, PlayerMario.x, PlayerMario.y, 14, 20);
				println("Test"+PlayerMario.RightSpeed);
				}
		}
		
	}
}*/


/*class BlockElements{
	int BlockHeight;
	int BlockWidth;
	int BlockThick;
	int BlockHoehe;
	//Konstuktor breite - höhe - länge - höhe
	BlockElements(int width, int height, int thick, int hoehe){
		BlockHeight = height;
		BlockWidth = width;
		BlockThick = thick;
		BlockHoehe = hoehe;
		MaxBlockElements[AnzahlObjekte] = this;
		AnzahlObjekte++;
	}
	//Methoden
	private void BlockPlacing(){
		rect(BlockWidth, BlockHeight, BlockThick, 30);
	}
	static void EnemyCollision(){
			//NewBlock.BlockThick;0, 300, 400, 100
		
					int y = MaxBlockElements[0].BlockHeight - 20;
					int h = y + GravityKraft; // 4 = gravity
					int l = MaxBlockElements[0].BlockWidth + MaxBlockElements[0].BlockThick;
					if(MaxEnemyElements[0] != null){
								//Die Werte Stimmen, komischerweise wird immer ein Block ingoriert!
								if(MaxEnemyElements[0].EnemyX >= MaxBlockElements[0].BlockWidth && MaxEnemyElements[0].EnemyX <= l && MaxEnemyElements[0].EnemyY >= y && MaxEnemyElements[0].EnemyY <= h){
									//EnemyGravity = false;
									MaxEnemyElements[0].gms = false;
									//println("Enemy Gravity wurde deaktiviert");
									counts+=1;
									println(counts);
								}else{
									MaxEnemyElements[0].gms = true;
									//println("Aktiv");
								}
					}
					int y = MaxBlockElements[1].BlockHeight - 20;
					int h = y + GravityKraft; // 4 = gravity
					int l = MaxBlockElements[1].BlockWidth + MaxBlockElements[1].BlockThick;
					if(MaxEnemyElements[0] != null){
								//Die Werte Stimmen, komischerweise wird immer ein Block ingoriert!
								if(MaxEnemyElements[0].EnemyX >= MaxBlockElements[1].BlockWidth && MaxEnemyElements[0].EnemyX <= l && MaxEnemyElements[0].EnemyY >= y && MaxEnemyElements[0].EnemyY <= h){
									//EnemyGravity = false;
									MaxEnemyElements[0].gms = false;
									//println("Enemy Gravity wurde deaktiviert");
									counts+=1;
									println(counts);
								}else{
									
									MaxEnemyElements[0].gms = true;
									//println("Aktiv");
								}
					}
	}
	static void Collision(){
		//Best way soooo goooooood!
		//villeicht mit einem array? for dyn array MaxBlockElements
		for(x=0; x < AnzahlObjekte; x++){
			//Objekt name kommt als String, dieser kann nicht verwendet werden um code blöcke zu bauen. Daher den String unwandeln
			int Hoehe = MaxBlockElements[x].BlockHeight - 20;
			int PXAbfangen = Hoehe + GravityKraft; // 4 = gravity
			int Thick = MaxBlockElements[x].BlockWidth + MaxBlockElements[x].BlockThick; 
			//NewBlock.BlockThick;0, 300, 400, 100
			//0, 300, 400, 100      X 300- mario grösse 100, 240, 300, 50
			//println("Block Dicke ist: "+MaxBlockElements[x].BlockThick);
			//Player Collison and gravity settings
			if(PlayerMario.x >= MaxBlockElements[x].BlockWidth && PlayerMario.x <= Thick && PlayerMario.y >= Hoehe && PlayerMario.y <= PXAbfangen){
				//Spieler steht auf dem Boden Gravity aus
				//println("Block Dicke ist: "+MaxBlockElements[x].BlockThick);
					Gravity = false;
					if(PlayerMario.UpSpeed == false){
					FramesBlocker = false;
					}
					x = AnzahlObjekte;
					//Falls dies eintrifft schalte value auf true
					//Schalte das value auf false wenn kein objekt zutrifft
					//Frage ab ob das value auf true ist wen ja gravity false
			}else{
				if(PlayerMario.UpSpeed == true){
					Gravity = false;	
				}else{
					Gravity = true;
				}
			}	
		}
		//Alle existierten objekte in dieser klasse laden, werte ausrechnenen, Cod 
	}
}*/