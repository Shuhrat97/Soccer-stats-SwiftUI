//
//  StandingRow.swift
//  SwiftUI_2
//
//  Created by Shuhrat Nurov on 10/08/22.
//

import SwiftUI

//func reload(index:Int, standing:Standing){
//    self.rankLbl.text = "\(index+1)"
//    if let urlString = standing.team.logos.first?.href {
//        self.imgView.load(url: URL(string: urlString)!)
//    }
//
//    self.nameLbl.text = standing.team.name
//
//    self.winsLbl.text = standing.stats[0].displayValue
//    self.loseLbl.text = standing.stats[1].displayValue
//    self.drawsLbl.text = standing.stats[2].displayValue
//    self.gamePlayedLbl.text = standing.stats[3].displayValue
//    self.ptsLbl.text = standing.stats[6].displayValue
//}


struct StandingRow: View {
    @State var index:Int
    @State var standing:Standing
    
    let screenWidth = (UIScreen.main.bounds.width - 20) / 2
    
    var body: some View {
        HStack{
            Text("\(index)")
            if let urlString = standing.team.logos.first?.href{
                AsyncImage(url: URL(string:urlString)!, placeholder: { ProgressView() }, image: { Image(uiImage: $0).resizable()}).frame(width: 30, height: 30)
                Text(standing.team.name)
                Spacer()
                HStack {
                    Text(standing.stats[0].displayValue)
                    Text(standing.stats[1].displayValue)
                    Text(standing.stats[2].displayValue)
                    Text(standing.stats[3].displayValue)
                    Text(standing.stats[6].displayValue)
                }
                .font(.system(size: 15))
                .frame(width: 150)
            }
        }
    }
}

struct StandingRow_Previews: PreviewProvider {
    static var previews: some View {
        //        StandingRow(index: 1, standing: )
        Text("")
    }
}
