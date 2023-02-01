public class FilaIntegracao implements Queueable, Database.AllowsCallouts {

    private List<Account> accLs;
    public FilaIntegracao(List<Account> accLs){
        this.accLs = accLs;
    }
    
    public void execute(QueueableContext context){
        for(Account ac : accLs){
            IntegracaoResponse.DadosReceita dados = IntegracaoResponse.doGet(ac);
            ac.Nome_Fantasia__c = dados.fantasia;
			ac.Data_de_abertura_da_empresa__c = dados.abertura;
            ac.Situacao_na_receita_federal__c = dados.situacao;
            ac.Capital_social__c = dados.capital_social;
            ac.Email__c = dados.email;
            ac.Phone = dados.telefone;
            ac.ShippingStreet = dados.logradouro;
            ac.Numero__c = dados.numero;
            ac.Complemento__c = dados.complemento;
            ac.ShippingState = dados.uf;
            ac.ShippingCountry = dados.pais;
            ac.ShippingPostalCode = dados.cep;
            
        }
        
        update accLs;
    }
}