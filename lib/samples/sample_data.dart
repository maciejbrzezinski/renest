import 'package:renest/models/idea.dart';

class IdeaHub {
  static var ideas = generateIdeas();

  static List<Idea> generateIdeas() {
    var ideas = List<Idea>();
    ideas.add(Idea("Book professional movers"));
    ideas.add(Idea("Prepare the house"));
    ideas.add(Idea("Review moving plans"));
    ideas.add(Idea("Prepare for payment"));
    ideas.add(Idea("Pack an essentials box"));
    ideas.add(Idea("Prepare appliances"));
    ideas.add(Idea("Measure furniture and doorways"));
    ideas.add(Idea("Take measurements"));
    ideas.add(Idea("Do a change of address"));
    ideas.add(Idea("Begin packing"));
    ideas.add(Idea("Order supplies"));
    return ideas;
  }

  static void markIdeaAsAdded(Idea idea) {
    ideas.remove(idea);
  }
}
