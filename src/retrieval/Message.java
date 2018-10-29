package retrieval;

public class Message {
	public String subject;
	public String body;
	public int recipient;
	public int sender = 0;
	public Byte read = 0;
	public int timeSent = 0;
	public Message (String subject, String body, int recipient) {
		this.subject = subject;
		this.body = body;
		this.recipient = recipient;
	}
	public Message () {
		this.subject = "";
		this.body = "";
		this.recipient = -1;
	}
}
