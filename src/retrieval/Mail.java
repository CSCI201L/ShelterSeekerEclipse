package retrieval;
import java.util.ArrayList;
import java.util.Comparator;

public class Mail {

	private ArrayList<Message> messages;

	public Mail() {
		messages = new ArrayList<Message>();
	}

	public void addMessage(Message m) {
		this.messages.add(m);
	}

	public void SortByReadAndTime(Comparator<Message> comp) {
		messages.sort(comp);
	}
	
	public ArrayList<Message> getMessages(){
		return this.messages;
	}

	public void display() {
		for (int i = 0; i < messages.size(); i++) {
			System.out.println(messages.get(i).readable());
		}
	}
}