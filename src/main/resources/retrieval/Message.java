package retrieval;

public class Message {
	public String subject;
	public int id;
	public String body;
	public String recipient;
	public String sender = "";
	public Byte read = 0;
	public int timeSent = 0;
	public Message (String subject, String body, String recipient) {
		this.subject = subject;
		this.body = body;
		this.recipient = recipient;
	}
	public Message () {
		this.subject = "";
		this.body = "";
		this.recipient = "";
	}
}
