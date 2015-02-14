class FeuerBall{

	int firex = PlayerMario.x,
		firey = PlayerMario.y,
		firenumber;
	boolean Richtung;

	FeuerBall(boolean Seite) {
		firenumber = MaxFireBall.length;
		MaxFireBall[AnzahlFire] = this;
		AnzahlFire++;
		Richtung = Seite;	
	}

	public void einfeuerball() {
		//es wird immer das Objekt gesendet was verarbeitet werden muss.
		//Das Objekt wird auferufen und animiert. 		
		if(this.Richtung == true){
			this.firex = this.firex + 6;
			//Kollision
			for(Enemy e : Enemy.Enemies){
				if(e != null){
					if(this.firex >= e.x && this.firex <= e.x+e.width && this.firey >= e.y && this.firey <= e.y+e.heigth){
						println("Ein Feuerball ist kollidiert!"+this.firenumber);
						MaxFireBall[this.firenumber] = null;
						e.kill();
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
}