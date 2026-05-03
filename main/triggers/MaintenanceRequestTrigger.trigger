trigger MaintenanceRequestTrigger on Maintenance_Request__c (before insert) {

    List<Vendor__c> vendors = [SELECT Id FROM Vendor__c];

    if(vendors.isEmpty()) return;

    Map<Id, Integer> vendorLoad = new Map<Id, Integer>();

    for(Vendor__c v : vendors){
        vendorLoad.put(v.Id, 0);
    }

    for(Maintenance_Request__c mr : [
        SELECT Vendor__c FROM Maintenance_Request__c WHERE Vendor__c != null
    ]){
        if(vendorLoad.containsKey(mr.Vendor__c)){
            vendorLoad.put(mr.Vendor__c, vendorLoad.get(mr.Vendor__c) + 1);
        }
    }

    for(Maintenance_Request__c newReq : Trigger.new){

        Id leastLoadedVendor;
        Integer minLoad = 999999;

        for(Id vId : vendorLoad.keySet()){
            if(vendorLoad.get(vId) < minLoad){
                minLoad = vendorLoad.get(vId);
                leastLoadedVendor = vId;
            }
        }

        newReq.Vendor__c = leastLoadedVendor;

        vendorLoad.put(leastLoadedVendor, vendorLoad.get(leastLoadedVendor) + 1);
    }
}

