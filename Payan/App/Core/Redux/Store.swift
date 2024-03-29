//
//  Store.swift
//  Payan
//
//  Created by Juan Hurtado on 12/08/22.
//

import Combine
import Foundation

class AppStore<State, Action>: ObservableObject {
    typealias Reducer = AnyReducer<State, Action>
    
    @Published var state: State
    
    private let reducer: Reducer
    private var cancellables: Set<AnyCancellable> = []
    
    private var verbose = false
    
    init(initialState: State, reducer: Reducer) {
        state = initialState
        self.reducer = reducer
    }
    
    final func send(_ action: Action) {
        if verbose {
            print("sending action: \(action.self)")
        }
        guard let effect = reducer.update(state: &state, with: action) else {
            return
        }
        
        effect
            .receive(on: RunLoop.main)
            .sink(receiveValue: send)
            .store(in: &cancellables)
    }
    
    func debug() -> Self {
        verbose = true
        return self
    }
}
