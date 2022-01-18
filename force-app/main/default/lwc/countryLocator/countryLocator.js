import { api, track, LightningElement } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import apiConnectedCountries from '@salesforce/apex/apiConnect.apiConnectedCountries';
 

export default class CountryLocator extends LightningElement {
    @api  flagimage;
    @track  countryMap = [];
    connectedCallback() {
        apiConnectedCountries()
        .then(result=>{ 
            
            var allCountries=JSON.parse(result);
            for(let country in allCountries){
                 
                var countryInfo  = {
                    code: allCountries[country].cca2, 
                    name: allCountries[country].name.official, 
                    capital:  allCountries[country].capital, 
                    population:  allCountries[country].population, 
                    flag: allCountries[country].flags.png 
                };
                
                this.countryMap.push({key: allCountries[country].cca2, value: countryInfo});  
                 
            }
        
        });
    }
} 



       