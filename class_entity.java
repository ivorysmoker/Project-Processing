class Entity{
	static ArrayList Entities = new ArrayList();
	int x,y,width,height,textureIndex;
	ArrayList Textures = new ArrayList();
	Entity(int ex,int ey,int ewidth,int eheight, String[] etexture){
		x = ex;
		y = ey;
		height = eheight;
		width = ewidth;
		textureIndex = 1;
			for (String s : etexture){
				Textures.add(loadImage(s));
			}
		Entities.add(this);
	}
	public void remove(){
		Entities.remove(this);
	}
	static void draw() {
		for (Entity e : Entities){
			//println('x: ' + e.x + '  y: ' + e.y + '  w: ' + e.width + '  h: ' + e.height + 'type: '+ e.type+'  tindex: ' + e.textureIndex );
			//image(e.Textures.get(e.textureIndex), e.x, e.y, e.width, e.height); 
			if(e instanceof Enemy){
			    image(Koopa, e.x, e.y, e.width, e.height);
			}
			if(e instanceof Player){
					if(e.RightSpeed == false && e.LeftSpeed == false && e.UpSpeed == false || e.RightSpeed == true && e.LeftSpeed == true){
						if(e.LeftSpeed == true || LastPressed == true){
							image(images2[3], e.x, e.y, e.width, e.height);		
						}else if(e.RightSpeed == true || LastPressed == false){
							image(images[3], e.x, e.y, e.width, e.height);
						}
					}
				
			}
		}
	}
}