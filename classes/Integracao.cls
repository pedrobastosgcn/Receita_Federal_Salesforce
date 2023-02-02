public class Integracao {
    
    public static final String url = 'https://receitaws.com.br/v1/cnpj/'; //Url do site da receita
    public static Integracao.DadosDaReceita doGet(Account ac) { //Método que irá utilizar o GET para obter os dados da receita

        String endpoint = ac.CNPJ__c; //O endpoint é o CNPJ pesquisado, ou seja utilizamos o CNPJ fornecido pela Account
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url+endpoint);
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('GET'); //Método GET para obtermos os dados
        HttpResponse response = http.send(req);
        
        if(response.getStatusCode() == 200) { //Caso tenha acessado a API com sucesso desserealizamos o JSON no nosso objeto DadosDaReceita
            DadosDaReceita dados = (DadosDaReceita) JSON.deserialize(response.getBody(), DadosDaReceita.class);
            System.debug(dados); //Utilizei esse System.debug para visualizar a estrutura do body
            return dados;
        }else{
            return null;
        }
        
    }
    
    public class DadosDaReceita{ //Estrutura de dados compatíveis com os da receita
        public String fantasia;
        public String abertura;
        public String situacao;
        public String natureza_juridica;
        public String capital_social;
        public String email;
        public String telefone;
        public String logradouro;
        public String numero;
        public String complemento;
        public String bairro;
        public String municipio;
        public String uf;
        public String pais;
        public String cep;
    }
}