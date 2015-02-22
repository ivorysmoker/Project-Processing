class DestroyableBlocksElements extends Entity{
	String Loot;
	DestroyableBlocksElements(int dx, int dy, int dwidth, int dheight, String dtexture, String dloot){
		super(dx, dy, dwidth, dheight, dtexture);
		Loot = dloot;
	}
	private void DestroyableBlockPlacing(){
		rect(x, y, width, height);
		image(BlockTexture, x, y , width, height);
	}
}