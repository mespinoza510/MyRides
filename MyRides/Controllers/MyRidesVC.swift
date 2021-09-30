//
//  MyRidesVC.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/27/21.
//

import UIKit

class MyRidesVC: UIViewController {
    
    static let myRidesFooterID = "MyRidesFooter"
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    var rides: [Ride] = []
    var rideSchedules: [RideSchedule] = []
    
    var sectionIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRides()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRides()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .init(red: 0, green: 0.2863, blue: 0.6196, alpha: 1)
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.register(MyRidesCell.self, forCellReuseIdentifier: MyRidesCell.reuseID)
        tableView.register(TripTableViewHeader.self, forHeaderFooterViewReuseIdentifier: TripTableViewHeader.tripHeaderID)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: MyRidesVC.myRidesFooterID)
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.frame = view.bounds
        tableView.backgroundColor = .systemBackground
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func getRides() {
        
        NetworkManager.shared.getJSON() { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let rides):
                self.updateUI(with: rides)
            case .failure(let error):
                self.presentRidesAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func updateUI(with rides: [Ride]) {
        
        var rideSchedules = [RideSchedule]()
        
        // Group rides according to day
        rides.forEach { ride in
            if let index = rideSchedules.firstIndex(where: { trip in
                trip.date.isSameDay(as: ride.startsAt)
            }) {
                rideSchedules[index].rides.append(ride)
            } else {
                rideSchedules.append(.init(ride: ride))
            }
        }
        self.rideSchedules = rideSchedules
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.view.bringSubviewToFront(self.tableView)
        }
    }
}


extension MyRidesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rideSchedules[section].rides.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyRidesCell.reuseID) as! MyRidesCell
        let ride = rideSchedules[indexPath.section].rides[indexPath.row]
        
        cell.set(ride: ride)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ride = rideSchedules[indexPath.section].rides[indexPath.row]
        let destinationVC = RideDetailsVC(ride: ride)
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TripTableViewHeader.tripHeaderID) as! TripTableViewHeader
        headerView.set(trip: rideSchedules[section])
        
        headerView.layer.borderWidth = 1
        headerView.layer.borderColor = UIColor.lightGray.cgColor
        headerView.layer.backgroundColor = MyRidesColor.headerColor
        
        headerView.layer.shadowColor = UIColor.gray.cgColor
        headerView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        headerView.layer.shadowOpacity = 1.0
        headerView.layer.masksToBounds = false
        headerView.layer.cornerRadius = 2
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return rideSchedules.count
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyRidesVC.myRidesFooterID)!

        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}
