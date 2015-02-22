class Spritebank{
	// --- static variables
	private static HashMap<String,HashMap<String,AnimationSet>> SpriteBanks = new HashMap<String,HashMap<String,AnimationSet>>();
	
	
	// --- obj fields
	//private HashMap<String,PImage[]> animations =  new HashMap<String, PImage[]>();
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
	
	
	// --- static methods
	public static void preloadImages(){
		println('preloading all sprites');
		String lines[] = loadStrings("spritebanks.txt");
		for (String l : lines) {
			//println('working on line : ' + l);
			Sting[] spProperties = l.split(';',-1);
			PImage spImage = loadImage('graphics/spritebanks/' + spProperties[0]);
			Sting spName = spProperties[1];
			int yOffset = 0;
			Sting[]	animationDiscriptions = spProperties[2].split(':',-1);
			HashMap<String,AnimationSet> AnimationSets = new HashMap<String,AnimationSet>();
			//println('path : graphics/spritebanks/' + spProperties[0] + '   name : ' + spProperties[1] + '   otherstuff : ' + spProperties[2]);
			for(String aD : animationDiscriptions){
				//println('working on a Discription: ' + aD);
				String[] animationProperties = aD.split('-',-1);
				String animationName =  animationProperties[0];
				int frameCount =  animationProperties[1],
					frameSkip = animationProperties[2],
					frameWidth = animationProperties[3],
					frameHeight = animationProperties[4];
				PImage[] animationImageSet;
				for(int index = 0 ; index < frameCount; index++){
					animationImageSet[animationImageSet.length] = spImage.get(index*frameWidth,(index*frameHeight)+yOffset,frameWidth,frameHeight);
					println(index);
				}
				yOffset += frameWidth;
				AnimationSet as = new AnimationSet(frameWidth,frameHeight,frameSkip,animationImageSet)
				AnimationSets.put(animationName,as);
				//println('name :' + animationName);
			}
			Spritebank.SpriteBanks.put(spName,AnimationSets);
			
			//PImage spImage = loadImage('graphics/spritebanks/' + l);
			//String spName = l[1];
			//String[] Animats = l[2].split(';',-1);
			//for(String animationDiscription : Animats){
			//	println('working on AnimationDes ' + animationDiscription);
				
			//}
			//println("working on Animation for modelname : " + spName);
			//println('animaition :' + spAnimationDescribtions[0]);
			//for(String d : spAnimationDescribtions){
				
				//String[] spAnimationProperties = d.split('-',-1);
				//println(spAnimationProperties);
				//AnimationSet as = new AnimationSet;
				
				
				
				
				//PImage[] animationImageSet;
				
				//String animationName = d[0];
				//int imageCount = d[1];
				//int framesSkip = d[2];
				//for(int index = 1; index <= imageCount){
					//animationImageSet[animationImageSet.length] = new PImage();
				//}
				//animation.put(animationImageSet,framesSkip);
				//spanimations.put(animationName,animation);
			//}
			//new Spritebank(spanimations,spname,spwidth,spheight); //pseudo code -- memo a mi so ungef?hr mu?ss das de usgseh..
		}
		//animationsX.put('MOVE',{'11','22','33','44','55'});
		//println(animationsX.get('MOVE')[1]);
	}
	public static void testdraw(){
		println(Spritebank.SpriteBanks.get('name2').get('name2animationname2').width);
	}
	//println(Spritebank.SpriteBanks.get('name2').get('name2animationname2').width);
	/*
	public static Spritebank create(String name){
		//return Spritebank.spriteBanks.get(name).clone() //pseudo code -- memo a mi so ungef?hr mu?ss das de usgseh..
	}
	public static void testdraw(){
		println(Spritebank.SpriteBanks.get('name2').get('name2animationname2').width);
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

class AnimationSet{
	int width,height,frameSkip;
	PImage[] AnimationSetImages;
	AnimationSet(int w,int h,int fS,PImage[] ASI){
		width = w;
		height = h;
		frameSkip = fS;
		AnimationSetImages =  ASI;
	}
}