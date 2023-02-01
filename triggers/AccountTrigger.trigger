trigger AccountTrigger on Account (after insert) {
    
    List<Account> accs = [SELECT Name, Id, CNPJ__c FROM Account WHERE CNPJ__c <> Null AND Id IN :Trigger.new];
    FilaIntegracao updateAcc = new FilaIntegracao(accs);
    Id jobId = System.enqueueJob(updateAcc);
}