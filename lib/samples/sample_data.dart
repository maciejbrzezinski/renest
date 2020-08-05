class IdeaHub {
  static var ideas = generateIdeas();

  static List<String> generateIdeas() {
    var ideas = List<String>();
    ideas.add("Book professional movers");
    ideas.add("Prepare the house");
    ideas.add("Review moving plans");
    ideas.add("Prepare for payment");
    ideas.add("Pack an essentials box");
    ideas.add("Prepare appliances");
    ideas.add("Measure furniture and doorways");
    ideas.add("Take measurements");
    ideas.add("Do a change of address");
    ideas.add("Begin packing");
    ideas.add("Order supplies");
    return ideas;
  }

  static void markIdeaAsAdded(String ideaName) {
    ideas.remove(ideaName);
  }
}
