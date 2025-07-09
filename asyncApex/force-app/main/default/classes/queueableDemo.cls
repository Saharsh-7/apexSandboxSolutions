public with sharing class queueableDemo implements Queueable,Database.AllowsCallouts{
    
    public void execute(QueueableContext qc) {
        //List of email address
        List<string> emailAddressList = new List<string>();
        emailAddressList.add('iamsaharshshukla86@gmail.com');
        emailAddressList.add('iamsaharshshukla@gmail.com');
        emailAddressList.add('ckmubola@gmail.com');

        // Sending emails to the list of emails addresses 
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(emailAddressList);
        email.setSubject('Queueable class use');
        email.setPlainTextBody('This is message from Queueable Class ');
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{email});       
    }
}