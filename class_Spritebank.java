class Spritebank{
	// --- static variables
	private static HashMap<String,Spritebank> spriteBanks = new HashMap<String,Spritebank>();
	
	// --- obj fields
	//private HashMap<String,PImage[]> animations =  new HashMap<String, PImage[]>();
	private HashMap<String,HashMap<PImage[],int>> animations =  new HashMap<String,HashMap<PImage[],int>>();
	private String name,currentAnimation;
	private int width,height,currentAnimationIndex;
	
	// --- constructor
	Spritebank(HashMap sanimations, String sname, int swidth, int sheight){
		//this.animations.put('MOVE',)
		this.animations = sanimations;
		this.name = sname;
		this.currentAnimation = 'IDLE';
		this.width = swidth;
		this.height = sheight;
		this.currentAnimationIndex = 0;
		Spritebank.spriteBanks.add(this);
	}
	//static HashMap<String,int[]> animationsX =  new HashMap<String, int[]>();
	
	// --- static methods
	public static void preloadImages(){
		String lines[] = loadStrings("spritebanks.txt");
		for (String l : lines) {
			String[] args = l.split(';',-1);
			for(String arg : args){
				//println(arg);
			}
			//new Spritebank(ani,name,width,height); //pseudo code -- memo a mi so ungefähr muäss das de usgseh..
		}
		//animationsX.put('MOVE',{'11','22','33','44','55'});
		//println(animationsX.get('MOVE')[1]);
	}
	public static Spritebank create(String name){
		//return Spritebank.spriteBanks.get(name).clone() //pseudo code -- memo a mi so ungefähr muäss das de usgseh..
	}
	public static void testdraw(){

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
}