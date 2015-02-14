class Enemy extends Entity{
	static ArrayList Enemies = new ArrayList();
	int movmentSpeed,jumpPower,remainingJumpPower;
	boolean isMoving,
			isJumping,
			isFacingForward,
			canFly;
	Enemy(int ex, int ey, int ewidth, int eheigth, int emovmentSpeed, int ejumpPower, boolean eisMoving, boolean eisFacingForward, boolean ecanFly){
		this.x = ex;
		this.y = ey;
		this.width = ewidth;
		this.heigth = eheigth;
		movmentSpeed = emovmentSpeed;
		JumpPower = ejumpPower;
		remainingJumpPower = 100;
		isMoving = eisMoving;
		isJumping = false;
		isFacingForward = eisFacingForward;
		canFly = ecanFly;
		Enemy.Enemies.add(this);
		//
		MaxEnemyElements[AnzahlEnemy] = this;
		AnzahlEnemy++;
	}
	public void kill(){
		Enemies.remove(this);
	}
	public void jump(){
		if(!this.isJumping){
			this.isJumping = true;
		}
	}
	public boolean isOnSolidGround(){
		for(BlockElements b : MaxBlockElements){
			if (this.x+this.width > b.x && this.x < b.x+b.width && this.y+this.heigth >= b.y && this.y+this.heigth <= b.y+GravityKraft){
				return true;
			}
		}
		return false;
	}

	static void update(){
		for(Enemy e : Enemy.Enemies){
			if(!e.isOnSolidGround() && !e.canFly){
				e.y += 5;
			}
			if(e.isMoving){
				if(e.isFacingForward){
					e.x += e.movmentSpeed;
				}
				else{
					e.x -= e.movmentSpeed;
				}
			}
			image(Koopa, e.x, e.y, e.width, e.heigth);	
		}	
	}
}
