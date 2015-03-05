class DestroyableBlocksElements extends Entity{
	String Loot;
	String Event;
	DestroyableBlocksElements(int dx, int dy, int dwidth, int dheight, String dtexture, String dloot, String dEvent){
		super(dx, dy, dwidth, dheight, dtexture);
		Loot = dloot;
		Event = dEvent;
	}
	public void DestroyableBlockPlacing(){
		rect(x, y, width, height);
		image(BlockTexture, x, y , width, height);
	}
	static void AddCoins(){
		println("Coin!");
	}
}