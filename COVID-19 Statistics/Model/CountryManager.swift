//
//  CountryManager.swift
//  COVID-19 Statistics
//
//  Created by Tushar Khandaker on 3/20/21.
//

import Foundation
protocol ShowInformationVC {
    func showCurrentUpdate(Update: FinalData)
}
struct CountryManager {
    
    let countName = ["Afghanistan","Albania","Algeria","Algeria","Algeria","Antigua and Barbuda","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus"]
    
    var delegate: ShowInformationVC?
    
    func sendRequest(for countryRow : Int){
        
        let urlString = "https://api.covid19api.com/summary"
        
        if let url = URL(string: urlString) {
          
            let session = URLSession(configuration: .default)
          
            
            let task = session.dataTask(with: url){ (data, response, error) in
                if error != nil {
                    print(error!)
                  
                    return
                }
                if let safeData = data {
                    print("safeData : \(safeData)")
                    if let allInformation = self.parseJSON(safeData, countryArrayIndex: countryRow){
                        print(allInformation)
                       self.delegate?.showCurrentUpdate(Update: allInformation)
                    }
                }
                
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data, countryArrayIndex: Int) -> FinalData? {
        
        //Create a JSONDecoder
        let decoder = JSONDecoder()
        do {

            //try to decode the data using the CoinData structure
            let decodedData = try decoder.decode(InformationStructure.self, from: data)
           // print("JSON")
            let Country = decodedData.countries[countryArrayIndex].country
            print(Country)
            let NewConfirmed = decodedData.countries[countryArrayIndex].newConfirmed
           print(NewConfirmed)
            let TotalConfirmed = decodedData.countries[countryArrayIndex].totalConfirmed
            let NewDeaths = decodedData.countries[countryArrayIndex].newDeaths
            let TotalDeaths = decodedData.countries[countryArrayIndex].totalDeaths
            let NewRecovered = decodedData.countries[countryArrayIndex].newRecovered
            let TotalRecovered = decodedData.countries[countryArrayIndex].totalRecovered
            let Date = decodedData.countries[countryArrayIndex].date

           // print(exchaingValue)

          let passData = FinalData(countryName: Country, newCase: NewConfirmed, totalCase: TotalConfirmed, newDead: NewDeaths, totalDead: TotalDeaths, newSurvive: NewRecovered, totalSurvive: TotalRecovered)
           return passData

        } catch {

            //Catch and print any errors.
            print("EOOOORRrr")
            print(error)
            return nil
        }
  
 }
    
    
    
}
