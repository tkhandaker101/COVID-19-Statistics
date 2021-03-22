// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct InformationStructure: Codable {
    let id, message: String
    let global: Global
    let countries: [Country]
    let date: DateEnum

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case message = "Message"
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
}

// MARK: - Country
struct Country: Codable {
    let id, country, countryCode, slug: String
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int
    let newRecovered, totalRecovered: Int
    let date: DateEnum
    let premium: Premium

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case date = "Date"
        case premium = "Premium"
    }
}

enum DateEnum: String, Codable {
    case the20210322T144131944Z = "2021-03-22T14:41:31.944Z"
}

// MARK: - Premium
struct Premium: Codable {
}

// MARK: - Global
struct Global: Codable {
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int
    let newRecovered, totalRecovered: Int
    let date: DateEnum

    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case date = "Date"
    }
}
