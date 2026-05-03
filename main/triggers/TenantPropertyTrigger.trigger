trigger TenantPropertyTrigger on Tenant_Property__c (after insert) {
    List<Task> taskList = new List<Task>();

    for(Tenant_Property__c tp : Trigger.new){
        Task t = new Task();
        t.Subject = 'Generate Lease Agreement';
        t.WhatId = tp.Property__c;
        taskList.add(t);
    }

    if(!taskList.isEmpty()){
        insert taskList;
    }
}
