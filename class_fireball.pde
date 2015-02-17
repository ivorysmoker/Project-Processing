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
		}else{
			this.firex = this.firex - 6;
		}
			//Kollision
			for(Enemy e : Enemy.Enemies){
				if(e != null){
					if(this.firex >= e.x && this.firex <= e.x+e.width && this.firey >= e.y && this.firey <= e.y+e.height){
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
	}
}