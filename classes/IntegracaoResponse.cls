public class IntegracaoResponse {
    
    public static final String url = 'https://receitaws.com.br/v1/cnpj/';
    public static IntegracaoResponse.DadosReceita doGet(Account ac) {

        String endpoint = ac.CNPJ__c;
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url+endpoint);
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('GET');
        HttpResponse response = http.send(req);
        
        if(response.getStatusCode() == 200) {
            DadosReceita dr = (DadosReceita) JSON.deserialize(response.getBody(), DadosReceita.class);
            System.debug(dr);
            return dr;
        }else{
            return null;
        }
        
    }
    
    public class DadosReceita{
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