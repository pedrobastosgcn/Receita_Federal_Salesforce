trigger AccountTrigger on Account (after insert) { //A trigger é acionada após a criação de uma conta
    
    List<Account> accs = [SELECT Name, Id, CNPJ__c FROM Account WHERE CNPJ__c <> Null AND Id IN :Trigger.new];//Porém só entra as contas que tem algum CNPJ inserido
    FilaIntegracao updateAcc = new FilaIntegracao(accs); //Invocamos o método
    Id jobId = System.enqueueJob(updateAcc);//Criamos um job para chamar a nossa queue
}