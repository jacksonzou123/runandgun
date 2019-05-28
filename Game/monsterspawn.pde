class monsterspawn extends spawn{
  monsterspawn(int time, float x, float y) {
    super(time, x, y);
  }
  
  void create() {
    monsters.add(new Melee(100,100));
  }
}