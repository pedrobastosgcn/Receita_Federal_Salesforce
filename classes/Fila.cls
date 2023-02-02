public class Fila implements Queueable, Database.AllowsCallouts { //Foi implementado a interface de Queue para realizar as atividades de forma assíncrona

    private List<Account> accountList; //Colocamos uma lista de Accounts como parâmetro
    public Fila(List<Account> accountList){ //E a inserimos dentro do construtor
        this.accountList = accountList; //Igualamos a variável ao parâmetro
    }
    
    public void execute(QueueableContext context){ //Assim que recebe o contexto de job ele inicia o método que chama a classe IntegracaoResponse
        for(Account acc : accountList){ //Realizamos esse for each para caso sejam criadas mais de uma conta
            Integracao.DadosDaReceita dados = Integracao.doGet(acc); //Invocamos o método e como seu retorno é o JSON desserealizado conseguimos capturar seus dados
            acc.Nome_Fantasia__c = dados.fantasia;
			acc.Data_de_abertura_da_empresa__c = dados.abertura;
            acc.Situacao_na_receita_federal__c = dados.situacao;
            acc.Capital_social__c = dados.capital_social;
            acc.Email__c = dados.email;
            acc.Phone = dados.telefone;
            acc.ShippingStreet = dados.logradouro;
            acc.Numero__c = dados.numero;
            acc.Complemento__c = dados.complemento;
            acc.ShippingState = dados.uf;
            acc.ShippingCountry = dados.pais;
            acc.ShippingPostalCode = dados.cep;
            
        }
        
        update accountList; //Atualizamos as contas com os dados alterados
    }
}