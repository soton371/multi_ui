class Agent{

  String name,image,address,number,description,properties;

  Agent(this.name, this.image, this.address, this.number,
      this.properties, this.description);

  static List<Agent> agentList() {
    List<Agent> list = [];
    list.add(Agent('Jelly Grande','assets/images/avatar-4.jpg','DownTown, Boston','+65 8123 456 7890','10 Listings',
        'I provide real estates such as home, apartment, and houses to rent and buy. The modern and minimalist design interior and building will give you the greatest experience and comfortable place guarantee. What are you waiting for? Come and get it...'));
    list.add(Agent('Emillie Joans','assets/images/avatar-1.jpg','DownTown, New York','+65 8123 456 7890','5 Listings',
        'I provide real estates such as home, apartment, and houses to rent and buy. The modern and minimalist design interior and building will give you the greatest experience and comfortable place guarantee. What are you waiting for? Come and get it...'));
    list.add(Agent('John Farnandise','assets/images/avatar-2.jpg','DownTown, Edmonton','+65 8123 456 7890','8 Listings',
        'I provide real estates such as home, apartment, and houses to rent and buy. The modern and minimalist design interior and building will give you the greatest experience and comfortable place guarantee. What are you waiting for? Come and get it...'));
    list.add(Agent('Harry Scott','assets/images/avatar-3.jpg','DownTown, Indonesia','+65 8123 456 7890','12 Listings',
        'I provide real estates such as home, apartment, and houses to rent and buy. The modern and minimalist design interior and building will give you the greatest experience and comfortable place guarantee. What are you waiting for? Come and get it...'));
    list.add(Agent('Elizabeth Palson','assets/images/avatar-5.jpg','DownTown, California','+65 8123 456 7890','6 Listings',
        'I provide real estates such as home, apartment, and houses to rent and buy. The modern and minimalist design interior and building will give you the greatest experience and comfortable place guarantee. What are you waiting for? Come and get it...'));

    return list;
  }

  static Agent getOne(){
    return Agent('Jelly Grande','assets/images/avatar-4.jpg','DownTown, Boston','+65 8123 456 7890','10 Listings',
        'I provide real estates such as home, apartment, and houses to rent and buy. The modern and minimalist design interior and building will give you the greatest experience and comfortable place guarantee. What are you waiting for? Come and get it...');
  }

}