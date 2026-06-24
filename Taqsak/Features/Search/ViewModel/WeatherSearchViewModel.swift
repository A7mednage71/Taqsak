//
//  WeatherSearchViewModel.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import Foundation
import Combine

class WeatherSearchViewModel: ObservableObject {
    
    @Published var searchQuery = ""
    @Published var searchResults: [SearchCityResult] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSearchDebounce()
    }
    
    private func setupSearchDebounce() {
        
        $searchQuery
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                
                guard let self = self else { return }
                
                if text.trimmingCharacters(in: .whitespacesAndNewlines).count > 2 {
                    
                    self.isLoading = true
                    self.errorMessage = nil
                    self.performSearch(with: text)
                } else {

                    self.searchResults = []
                    self.isLoading = false
                }
            }
            .store(in: &cancellables)
    }
    
    private func performSearch(with query: String) {
        
        NetworkManager.shared.searchCities(matching: query) { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading = false
            
            switch result {
               case .success(let cities):
                   self.searchResults = cities
                
               case .failure(let error):
                   self.errorMessage = error.localizedDescription
                   self.searchResults = []
            }
        }
    }
}
