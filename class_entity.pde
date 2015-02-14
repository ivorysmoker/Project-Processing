class Entity{
	static ArrayList Entities = new ArrayList();
	int x,y,height,width,textureIndex;
	ArrayList Textures = new ArrayList();
	Entity(int ex,int ey,int eheight,int ewidth, String[] etexture){
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
			println('x: ' + e.x + '  y: ' + e.y + '  w: ' + e.width + '  h: ' + e.height + '  tindex: ' + e.textureIndex );
			//image(e.Textures.get(e.textureIndex), e.x, e.y, e.width, e.height);
			image(Koopa, e.x, e.y, e.width, e.height);
		}
	}
}