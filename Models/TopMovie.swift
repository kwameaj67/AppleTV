//
//  TopMovie.swift
//  AppleTV-Clone
//
//  Created by Kwame Agyenim - Boateng on 11/09/2022.
//

import Foundation


struct TopMovie {
    var image: String
    var title: String
    var details: String
    
    
    static var topMoviesData = [
        TopMovie(image: "movie8", title: "Spider-man: Far From Home", details: "2019 Action"),
        TopMovie(image: "movie9", title: "Fall", details: "2022 Action"),
        TopMovie(image: "movie2", title: "Dragon Ball Super: Super Hero", details: "2022 Adventure"),
        TopMovie(image: "movie1", title: "Thor: Love and Thunder", details: "2022 Action"),
        TopMovie(image: "samaritan", title: "Samaritan", details: "2022 Action"),
        TopMovie(image: "movie7", title: "Fullmetal Alchemist the Revenge of Scar", details: "2022 Action"),
        TopMovie(image: "movie3", title: "DC League of Super-Pets", details: "2022 Drama"),
        TopMovie(image: "movie4", title: "Prey", details: "2022 Action"),
        TopMovie(image: "movie6", title: "Seoul Vibe", details: "2022 Action"),
        TopMovie(image: "movie2", title: "Jurassic World Dominion", details: "2022 Action"),
        TopMovie(image: "movie8", title: "Minions: The Rise of Gru", details: "2022 Action"),
        TopMovie(image: "movie5", title: "Jujutsu Kaisen 0", details: "2022 Action"),
        TopMovie(image: "movie8", title: "Top Gun: Maverick", details: "2022 Action"),
    ]
}
