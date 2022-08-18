//
//  MainViewModel.swift
//  SwiftUI_2
//
//  Created by Shuhrat Nurov on 10/08/22.
//

import Foundation


class MainViewModel:ObservableObject{
    @Published var arr:[League] = []
    
    
    init(){
        getLeagues()
    }
    
    func getLeagues(){
        guard let url = URL(string: "https://api-football-standings.azharimm.site/leagues") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(DataResponse<[League]>.self, from: data)
                self.arr = model.data
            } catch {
                print("Error: \(error)")
            }
            
            
        }

        task.resume()
    }
}
