//  COVID19.swift
//  FinalProject
//  Team member : Sunghyun Park(shpark92@iu.edu), Jae Kwan Kim(jk216@iu.edu), Tae Yoon Choi(choitae@iu.edu)
//  iOS App's name: COVID19 case finder
//  Submission Date: 05/06/2020
//
//  Created by Sunghyun Park on 27/04/2020.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import Foundation

class COVID19 {
    
    var covid_cases:[String:Int]
    var current_country: [String]
    var current_case: [Int]
    
        
        
    init(){
        covid_cases = ["UNITED STATES":1064572,"SPAIN":236899,"ITALY":203591,"FRANCE":166420,"UNITED KINGDOM":165221,"GERMANY":162530,
                       "TURKEY":120204,"RUSSIA":106498,"IRAN":94640,"BRAZIL":85380,"CHINA":82862,"CANADA":53021,"BELGIUM":48519,"NETHERLANDS":39316,"PERU":36976,"INDIA":34862,"SWITZERLAND":29586,"PORTUGAL":25045,"ECUADOR":22934,"SAUDI ARABIA":22753,"SWEDEN":21092,"IRELAND":20612,"MEXICO":17799,"PAKISTAN":16473,"SINGAPORE":16169,"CHILE":16023,"ISRAEL":15946,"AUSTRIA":15452,"BELARUS":14027,"JAPAN":13965,"QATAR":13409,"POLAND":12877, "UNITED ARAB EMIRATES":12481,"ROMANIA":12240,"SOUTH KOREA":10765]
        current_country = []
        current_case = []
    }
    
    func search(input:String) {
        var process = input.uppercased()
        print(process)
        if let caseNum = covid_cases[process]{
            self.current_case.append(caseNum)
            self.current_country.append(process)
        
        }
    }
    
    func country_getter() -> [String]{
        return self.current_country
    }
    
    func case_getter() -> [Int]{
        return self.current_case
    }
        
}
