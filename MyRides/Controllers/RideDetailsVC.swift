//
//  RideDetailsVC.swift
//  MyRides
//
//  Created by Marco Espinoza on 9/3/21.
//

import UIKit
import MapKit

class RideDetailsVC: UIViewController {
    
    let headerView = UIView()
    let addressView = UIView()
    let contentView = UIView()
    let seriesTripLabel = UILabel()
    let cancelButton = UIButton()
    
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var ride: Ride!
    var trip: Trip!
    
    init(ride: Ride) {
        super.init(nibName: nil, bundle: nil)
        self.ride = ride
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureContentView()
        layoutUI()
        configureUIElements(with: ride)
        configureActionButton()
        addAnnotations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureContentView() {
        view.addSubview(contentView)

        contentView.pinToEdges(of: view)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = RidesConstants.rideDetailsTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func layoutUI() {
        let mapViewHeight: CGFloat = view.layer.bounds.height / 3 - 20
        let halfScreenWidth: CGFloat = view.layer.bounds.width / 2
        
        mapView = MKMapView()
        mapView.showsUserLocation = false
        mapView.userTrackingMode = .none
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        seriesTripLabel.translatesAutoresizingMaskIntoConstraints = false
        addressView.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        seriesTripLabel.text = ride.inSeries ? RidesConstants.tripIsPartOfSeriesLabel : ""
        seriesTripLabel.font = .italicSystemFont(ofSize: 12)
        seriesTripLabel.textColor = .gray
        
        cancelButton.setTitle(RidesConstants.cancelTrip, for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        cancelButton.backgroundColor = .systemBackground
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor.lightGray.cgColor
        
        contentView.addSubviews(headerView, mapView,seriesTripLabel, addressView, cancelButton)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            
            mapView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.heightAnchor.constraint(equalToConstant: mapViewHeight),
            
            seriesTripLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 10),
            seriesTripLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            seriesTripLabel.widthAnchor.constraint(equalToConstant: halfScreenWidth),
            seriesTripLabel.heightAnchor.constraint(equalToConstant: 14),
            
            addressView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 20),
            addressView.widthAnchor.constraint(equalToConstant: contentView.layer.bounds.width),
            addressView.heightAnchor.constraint(equalToConstant: 200),
            
            cancelButton.topAnchor.constraint(equalTo: addressView.bottomAnchor, constant: 30),
            cancelButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cancelButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cancelButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureActionButton() {
        cancelButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    // TODO: Need specs for action button
    @objc func actionButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func addAnnotations() {
        let pickupMarker = MKPointAnnotation()
        pickupMarker.coordinate.latitude = ride.orderedWaypoints.first!.location.lat
        pickupMarker.coordinate.longitude = ride.orderedWaypoints.first!.location.lng
        pickupMarker.title = RidesConstants.pickup
        pickupMarker.coordinate = CLLocationCoordinate2D(latitude: pickupMarker.coordinate.latitude,
                                                         longitude: pickupMarker.coordinate.longitude)
        let dropoffMarker = MKPointAnnotation()
        dropoffMarker.title = RidesConstants.dropoff
        dropoffMarker.coordinate.latitude = ride.orderedWaypoints.last!.location.lat
        dropoffMarker.coordinate.longitude = ride.orderedWaypoints.last!.location.lng
        dropoffMarker.coordinate = CLLocationCoordinate2D(latitude: dropoffMarker.coordinate.latitude,
                                                          longitude: dropoffMarker.coordinate.longitude)
        
        mapView.addAnnotations([pickupMarker, dropoffMarker])
        
        let middleLocation = pickupMarker.coordinate.middleLocationWith(location: dropoffMarker.coordinate)
        let region = MKCoordinateRegion(center: middleLocation, span: MKCoordinateSpan(latitudeDelta: 0.19, longitudeDelta: 0.19))
        mapView.setRegion(region, animated: true)
    }
    
    func configureUIElements(with ride: Ride) {
        self.add(childVC: RidesDetailHeaderView(ride: ride), to: self.headerView)
        self.add(childVC: AddressListVC(ride: ride), to: self.addressView)
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = view.bounds
        childVC.didMove(toParent: self)
    }
}
