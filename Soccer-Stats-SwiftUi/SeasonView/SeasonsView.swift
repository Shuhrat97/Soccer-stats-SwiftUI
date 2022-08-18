//
//  SeasonsView.swift
//  SwiftUI_2
//
//  Created by Shuhrat Nurov on 10/08/22.
//

import SwiftUI

//var years:[Int] = []
//details?.seasons.forEach({ season in
//    years.append(season.year)
//})
//let vc = StandingsViewController(abbr: league.id, seasonYear: String(describing: year), years: years)
//navigationController?.pushViewController(vc, animated: true)

struct SeasonsView: View {
    
    @ObservedObject var viewModel:SeasonsViewModel
    
    var body: some View {
        List{
            ForEach(viewModel.detailLeague!.seasons, id: \.year) { season in
                Section {
                    ForEach(season.types, id: \.id) { type in
                        NavigationLink {
                            StandingsView(viewModel: StandingsViewModel(abbr: viewModel.league.id, seasonYear: "\(season.year)", years: viewModel.years))
                        } label: {
                            SeasonsRow(type: type)
                                .padding()
                        }
                    }
                } header: {
                    Text(season.displayName)
                }
                
            }
        }
        .navigationBarTitle(viewModel.league.abbr)
    }
}

struct SeasonsView_Previews: PreviewProvider {
    static var previews: some View {
        //        SeasonsView()
        Text("asd")
    }
}
