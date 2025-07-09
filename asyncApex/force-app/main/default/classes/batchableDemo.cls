public with sharing class batchableDemo implements Database.Batchable<SObject>, Database.Stateful {

      public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, Name FROM Account LIMIT 3]);
    }

    public void execute(Database.BatchableContext bc, List<Account> scope) {
        System.debug('inside execute method');
        // Add your processing logic here
    }

    public void finish(Database.BatchableContext bc) {
        List<String> emailAddresses = new List<String>{
            'iamsaharshshukla86@gmail.com',
            'iamsaharshshukla@gmail.com',
            'ckmubola@gmail.com'
        };

        try {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(emailAddresses);
            email.setSubject('Batch Apex Demo');
            email.setPlainTextBody('This is a test email from batch apex class');
            Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{email});
            
            System.debug('Email sent successfully to: ' + emailAddresses);
        } catch(Exception e) {
            System.debug('Error sending email: ' + e.getMessage());
        }
    }
   
    /*public database.queryLocator start(database.BatchableContext bc)  {
        return database.getQueryLocator([select id,name from account limit 3]);
    }

    public void execute(database.BatchableContext bc,List<Account> scope) {
        System.debug('inside execute method');
        
    }

    public void finish(database.BatchableContext bc) {

        List<String> emailAddrress = new List<String>();

        emailAddrress.add('iamsaharshshukla86@gmail.com');
        emailAddrress.add('iamsaharshshukla@gmail.com');
        emailAddrress.add('ckmubola@gmail.com');

        Messaging.SingleEmailMessage emails = new Messaging.SingleEmailMessage();
        emails.setToAddresses(emailAddrress);
        emails.setSubject('Batch apex Demo');
        emails.setPlainTextBody('This is a test email from batch apex class');
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage> {emails});

    }*/

}