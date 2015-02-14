class Player extends Entity{ 
	//Eigenschaften
	/*int realX = 5; // The Real Player Coord X
	int x = 5; //Actuell Player Coords MAPPING
	int y = 200; 
	int Speed = 0; // Example for Test*/
	public boolean LeftSpeed = false; //Setzt ob der Linke Pfeilt Aktiv ist
	public boolean RightSpeed = false; //Keyevent trigger
	public boolean UpSpeed = false;
	int Life;
	Player(int px, int py, int pwidth, int pheight, int plife){
		x = px;
		y = py;
		width = pwidth;
		height = pheight;
		Life = plife;
	}
	
	private void PlayerDie(){
		//Mario ist kollidiert mit einem Enemy
		for(Enemy e : Enemy.Enemies){
			if(this.x >= e.x && this.x <= e.x+e.width && this.y >= e.y && this.y <= e.y+e.height){
					this.Life -= 1;
				if(this.Life <= 0){
					GameIsLose = true;
					image(gameover, 0, 0, 600, 500);
					
				}else{
					this.x = 5; this.y = 200;
					image(standingMario, this.x, this.y, this.width, this.height);
				}
			}
		}
		//Mario ist runtergefallen!
		if(PlayerMario.y >= 500){
			this.Life -= 1;
			//Spawn Mario from the start Point
			image(standingMario, this.x, this.y, this.width, this.height);
		}
	}
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
			image(images2[3], PlayerMario.x, PlayerMario.y, PlayerMario.width, PlayerMario.height);		
			}else if(PlayerMario.RightSpeed == true || LastPressed == false){
			image(images[3], PlayerMario.x, PlayerMario.y, PlayerMario.width, PlayerMario.height);
			}
			
		}
	}
	public void Movement(){
		//Rechts
		if(PlayerMario.RightSpeed == true && PlayerMario.LeftSpeed == true){
				image(standingMario, PlayerMario.x, PlayerMario.y, PlayerMario.width, PlayerMario.height);
		}else{
		if(PlayerMario.RightSpeed == true){
			//println("Test"+PlayerMario.RightSpeed);
			PlayerMario.x += MovementMaxSpeed;
			//Animation
			if(PlayerMario.UpSpeed == false){
			frame = (frame+1)%numFrames; 
			image(images[frame], PlayerMario.x, PlayerMario.y, PlayerMario.width, PlayerMario.height);
			}
		}
		//Links
		if(PlayerMario.LeftSpeed == true){
			PlayerMario.x -= MovementMaxSpeed;
				if(PlayerMario.UpSpeed == false){
					//Animation
					frame2 = (frame2+1)%numFrames2; 
					image(images2[frame2], PlayerMario.x, PlayerMario.y, PlayerMario.width, PlayerMario.height);
				}
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
					if(PlayerMario.RightSpeed == true){
					image(jumpMario, PlayerMario.x, PlayerMario.y, PlayerMario.width, PlayerMario.height);
					}else if(PlayerMario.LeftSpeed == true){
					image(jumpMarioLeft, PlayerMario.x, PlayerMario.y, PlayerMario.width, PlayerMario.height);	
					}else{
						if(LastPressed = true){
							image(jumpMarioLeft, PlayerMario.x, PlayerMario.y, PlayerMario.width, PlayerMario.height);	
						}else{
							image(jumpMario, PlayerMario.x, PlayerMario.y, PlayerMario.width, PlayerMario.height);	
						}
					}
					//Blocke das Springen
					PlayerMario.UpSpeed = false;
				}else{
					println(JumpOptik);
						PlayerMario.y -= 4;

				AnzahlFrames++;
				JumpOptik++;
				if(PlayerMario.RightSpeed == true){
					image(jumpMario, PlayerMario.x, PlayerMario.y, PlayerMario.width, PlayerMario.height);
					}else if(PlayerMario.LeftSpeed == true){
					image(jumpMarioLeft, PlayerMario.x, PlayerMario.y, PlayerMario.width, PlayerMario.height);	
					}else{
						if(LastPressed = true){
							image(jumpMarioLeft, PlayerMario.x, PlayerMario.y, PlayerMario.width, PlayerMario.height);	
						}else{
							image(jumpMario, PlayerMario.x, PlayerMario.y, PlayerMario.width, PlayerMario.height);	
						}
					}
				//println("Test"+PlayerMario.RightSpeed);
				}
		}
	}
	}
}