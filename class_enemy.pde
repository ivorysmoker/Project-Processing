class Enemy extends Entity{
	static ArrayList Enemies = new ArrayList();
	int movmentSpeed,jumpPower,remainingJumpPower;
	boolean isMoving,
			isJumping,
			isFacingForward,
			canFly;
	Enemy(int ex, int ey, int ewidth, int eheight, String etype, int emovmentSpeed, int ejumpPower, boolean eisMoving, boolean eisFacingForward, boolean ecanFly, String[] etexture){
		super(ex,ey,ewidth,eheight,etype,etexture);
		movmentSpeed = emovmentSpeed;
		JumpPower = ejumpPower;
		remainingJumpPower = 100;
		isMoving = eisMoving;
		isJumping = false;
		isFacingForward = eisFacingForward;
		canFly = ecanFly;
		Enemy.Enemies.add(this);
		MaxEnemyElements[AnzahlEnemy] = this;
		AnzahlEnemy++;
	}
	public void kill(){
		Enemies.remove(this);
		this.remove();
	}
	public void jump(){
		if(!this.isJumping){
			this.isJumping = true;
		}
	}
	public boolean isOnSolidGround(){
		for(BlockElements b : MaxBlockElements){
			if (this.x+this.width > b.x && this.x < b.x+b.width && this.y+this.height >= b.y && this.y+this.height <= b.y+GravityKraft){
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
			//image(Koopa, e.x, e.y, e.width, e.height);	
		}	
	}
}
