global class LeaseReminderScheduler implements Schedulable {

    global void execute(SchedulableContext sc) {

        Date targetDate = Date.today().addDays(30);

        List<Lease_Agreement__c> leases = [
            SELECT Id, Tenant__r.Email__c, End_Date__c
            FROM Lease_Agreement__c
            WHERE End_Date__c = :targetDate
        ];

        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for(Lease_Agreement__c lease : leases){

            if(lease.Tenant__r.Email__c != null){

                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new String[]{lease.Tenant__r.Email__c});
                mail.setSubject('Lease Expiry Reminder');
                mail.setPlainTextBody('Your lease will expire in 30 days. Please take action.');

                emails.add(mail);
            }
        }

        if(!emails.isEmpty()){
            Messaging.sendEmail(emails);
        }
    }
}
