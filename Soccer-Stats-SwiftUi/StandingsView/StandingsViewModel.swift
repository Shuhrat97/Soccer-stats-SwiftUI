//
//  StandingsViewModel.swift
//  SwiftUI_2
//
//  Created by Shuhrat Nurov on 10/08/22.
//

import SwiftUI


class StandingsViewModel:ObservableObject{
    
    @Published var seasons:DetailSeason? = nil
    
    @Published var abbr:String
    @Published var seasonYear:String
    @Published var years:[Int]
    
    @Published var selectedYear:Int = 0
    
    init(abbr:String, seasonYear:String, years:[Int]){
        self.abbr = abbr
        self.seasonYear = seasonYear
        self.years = years
        
        selectedYear = Int(seasonYear)!
    }
    
    func getStandings(abbr:String, seasonYear:String, completion:@escaping (DetailSeason)->()){
        guard var urlComponents = URLComponents(string: "https://api-football-standings.azharimm.site/leagues/\(abbr)/standings") else {
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "season", value: seasonYear),
            URLQueryItem(name: "sort", value: "asc")
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(DataResponse<DetailSeason>.self, from: data)
                completion(model.data)
            } catch {
                print("Error: \(error)")
            }
        }

        task.resume()
    }
}
