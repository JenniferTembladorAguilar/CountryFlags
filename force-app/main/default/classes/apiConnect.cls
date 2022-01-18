
public with sharing class apiConnect {
    @AuraEnabled(cacheable=true)
    public static String apiConnectedCountries() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://restcountries.com/v3.1/all');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String responseBody=null;
        //If the request is succesful, parse the JSOn reponse.
        if(response.getStatusCode() == 200) 	{
            // Deserializes the JSON string into collections of primitive data types.
          responseBody =response.getBody();
          /*  List<Object> results = (List<Object>) JSON.deserializeUntyped(response.getBody());
        
             
            //for(Object result: results) {
                Map<String,Object> mapObject = (Map<String,Object>) results[0];
                for(String keyName : mapObject.keySet())
                    System.debug(keyName + '-----'+mapObject.get(keyName));
            //}
        }*/
        return responseBody;
}
}