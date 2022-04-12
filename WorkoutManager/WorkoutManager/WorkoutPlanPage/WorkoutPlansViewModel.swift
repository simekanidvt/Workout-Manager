//
//  WorkoutPlansViewModel.swift
//  WorkoutManager
//
//  Created by Simekani Mabambi on 2022/04/05.
//

import Foundation

protocol WorkoutPlansDelegate : ViewModelDelegate {
    func reloadCollectionView()
}

class WorkoutPlansViewModel {
    
    private weak var delegate: WorkoutPlansDelegate?
    private var repository: WorkoutPlansRepositoryType?
    
    private var workoutPlan: WorkoutPlan?
    private var workoutPlanInfo: WorkoutPlanDetails?
    
    init(delegate:WorkoutPlansDelegate, repository: WorkoutPlansRepositoryType) {
        self.delegate = delegate
        self.repository = repository
    }
    
    func setWorkoutPlan(workoutPlan:WorkoutPlan) {
        self.workoutPlan = workoutPlan
    }
    
    func getWorkoutPlan() -> WorkoutPlan? {
        return workoutPlan
    }
    
    public var numberOfDays: Int {
        return workoutPlanInfo?.days?.count ?? 0
    }
    
    public func getWorkoutInfo(itemIndex:Int) -> Day? {
        return workoutPlanInfo?.days?[itemIndex] ?? nil
    }
    
    func getWorkoutPlanDetails() {
        guard let id = workoutPlan?.id else {return}
        repository?.getWorkoutPlanById(id: id,completion: { [weak self] result in
            switch result {
            case .success(let workoutPlanDetails):
                self?.workoutPlanInfo = workoutPlanDetails
                self?.delegate?.reloadCollectionView()
            case .failure(let error):
                self?.delegate?.showError(error: error.rawValue)
            }
        })
    }
}
