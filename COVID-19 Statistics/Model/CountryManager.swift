//
//  CountryManager.swift
//  COVID-19 Statistics
//
//  Created by Tushar Khandaker on 3/20/21.
//

import Foundation
protocol ShowInformationVC {
    func showCurrentUpdate(Update: InformationStructure)
}
struct CountryManager {
    
    let countName = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"]
    
    var delegate: ShowInformationVC?
    
    func sendRequest(){
        
        let urlString = "https://api.covid19api.com/summary"
        
        if let url = URL(string: urlString) {
          
            let session = URLSession(configuration: .default)
          
            
            let task = session.dataTask(with: url){ (data, response, error) in
                if error != nil {
                    print(error!)
                  
                    return
                }
                if let safeData = data {
                    print(safeData)
                    if let allInformation = self.parseJSON(safeData){
                        print(allInformation)
                        self.delegate?.showCurrentUpdate(Update: allInformation)
                    }
                }
                
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data, countryArrayIndex : Int) -> InformationStructure? {
        
        //Create a JSONDecoder
        let decoder = JSONDecoder()
        do {

            //try to decode the data using the CoinData structure
            let decodedData = try decoder.decode(InformationStructure.self, from: data)
           // print("JSON")
            let Country = decodedData.countries[countryArrayIndex].country
            print(Country)
            let NewConfirmed = decodedData.countries[countryArrayIndex].newConfirmed
         //   print(NewConfirmed)
            let TotalConfirmed = decodedData.countries[countryArrayIndex].totalConfirmed
            let NewDeaths = decodedData.countries[countryArrayIndex].newDeaths
            let TotalDeaths = decodedData.countries[countryArrayIndex].totalDeaths
            let NewRecovered = decodedData.countries[countryArrayIndex].newRecovered
            let TotalRecovered = decodedData.countries[countryArrayIndex].totalRecovered
            let Date = decodedData.countries[countryArrayIndex].date

           // print(exchaingValue)

//            let  exchangeInformation = CoinData(asset_id_quote: currencyType, rate: exchaingValue)
//            return exchangeInformation

        } catch {

            //Catch and print any errors.
            print("EOOOORRrr")
            print(error)
            return nil
        }
        return nil
 }
    
    
    
}
