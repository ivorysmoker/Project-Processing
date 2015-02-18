class Spritebank{
	// --- static variables
	private static HashMap<String,Spritebank> spriteBanks = new HashMap<String,Spritebank>();
	
	// --- obj fields
	//private HashMap<String,PImage[]> animations =  new HashMap<String, PImage[]>();
	private HashMap<String,HashMap<PImage[],int>> animations;
	private String name,currentAnimation;
	private int width,height,currentAnimationIndex;
	
	// --- constructor
	/*Spritebank(HashMap<String,HashMap<PImage[],int>> sanimations, String sname, int swidth, int sheight){
		//this.animations.put('MOVE',)
		this.animations = sanimations;
		this.name = sname;
		this.currentAnimation = 'IDLE';
		this.width = swidth;
		this.height = sheight;
		this.currentAnimationIndex = 0;
		Spritebank.spriteBanks.add(this);
	}*/
	//static HashMap<String,int[]> animationsX =  new HashMap<String, int[]>();
	
	// --- static methods
	public static void preloadImages(){
	/*	String lines[] = loadStrings("spritebanks.txt");
		for (String l : lines) {
			String[] args = l.split(';',-1);
			HashMap<String,HashMap<PImage[],int>> spanimations =  new HashMap<String,HashMap<PImage[],int>>();
			PImage spImage = loadImage(args[0]);
			String spname = args[1];
			int spwidth = args[2],
				spheight = args[3];
			String[] spanimationDescribtions = args[4].split(','-1);
			for(String disc : spanimationDescribtions){
				HashMap<PImage[],int> animation = new HashMap<PImage[],int>();
				PImage[] animationImageSet;
				String[] d = disc.split('-',-1);
				String animationName = d[0];
				int imageCount = d[1];
				int framesSkip = d[2];
				for(int index = 1; index <= imageCount){
					animationImageSet[animationImageSet.length] = new PImage();
				}
				animation.put(animationImageSet,framesSkip);
				spanimations.put(animationName,animation);
			}
			//new Spritebank(spanimations,spname,spwidth,spheight); //pseudo code -- memo a mi so ungefähr muäss das de usgseh..
		}
		//animationsX.put('MOVE',{'11','22','33','44','55'});
		//println(animationsX.get('MOVE')[1]);*/
	}
	/*
	public static Spritebank create(String name){
		//return Spritebank.spriteBanks.get(name).clone() //pseudo code -- memo a mi so ungefähr muäss das de usgseh..
	}
	public static void testdraw(){
		return;
	}
	public void nextFrame(){
		
	}
	public void previousFrame(){
			
	}
	public void resetFrame(){
		
	}
	public void setAnimation(){
		
	}
	
	public void getAnimation(){
		
	}
	public void getAnimationList(){
		
	}
	public void draw(){
		
	}
	*/
}