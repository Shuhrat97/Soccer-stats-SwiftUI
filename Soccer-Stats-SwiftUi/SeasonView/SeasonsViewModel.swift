//
//  SeasonsViewModel.swift
//  SwiftUI_2
//
//  Created by Shuhrat Nurov on 10/08/22.
//

import Foundation

class SeasonsViewModel:ObservableObject{
    @Published var detailLeague:DetailLeague?
    
    @Published var league:League
    
    var years:[Int] = []
    
    init(league:League) {
        self.league = league
        getSeasonsView(leagueId: league.id)
    }
    
    func getSeasonsView(leagueId:String){
        guard let url = URL(string: "https://api-football-standings.azharimm.site/leagues/\(leagueId)/seasons") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(DataResponse<DetailLeague>.self, from: data)
                self.detailLeague = model.data
                
                self.detailLeague?.seasons.forEach({ item in
                    self.years.append(item.year)
                })
            } catch {
                print("Error: \(error)")
            }
            
            
        }

        task.resume()
    }
}
