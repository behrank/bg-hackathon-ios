//
//  OrderedDetailViewController.swift
//  GetirGotur
//
//  Created by Behran Kankul on 17.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit
import MapKit

protocol OrderedDetailDisplayLogic: class
{
    func prepareUI(post:GGDeliveryRequests,user:GGUsers)
}

class OrderedDetailViewController: BaseViewController, OrderedDetailDisplayLogic
{
    var interactor: OrderedDetailBusinessLogic?
    var router: (NSObjectProtocol & OrderedDetailRoutingLogic & OrderedDetailDataPassing)?

    let regionRadius: CLLocationDistance = 1000

    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDetails: UILabel!
    
    @IBOutlet weak var date1: UILabel!
    @IBOutlet weak var date2: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        OrderedDetailWorker().doSetup(self)
    
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        OrderedDetailWorker().doSetup(self)
    }
  
    // MARK: Routing
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.showViewDetails()
    }
}

extension OrderedDetailViewController {
    func prepareUI(post:GGDeliveryRequests,user:GGUsers) {
        imgUser.image = UIImage(named:user.avatarImg!)
        lblUsername.text = user.firstName! + " " + user.lastName!
        productName.text = post.requestTitle!
        productDetails.text = "Ürün yurtdışında oldukça ucuz olduğundan oradan almak daha mantıklı."
        date1.text = post.selectedDate
        date2.text = post.selectedDate2
        address.text = post.address
        if  post.lat == nil {
            map.isHidden = true
        }
        else{
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: post.lat!, longitude: post.lon!)
            map.addAnnotation(annotation)
            map.showsUserLocation = false
            centerMapOnLocation(location: CLLocation(latitude:  post.lat!, longitude: post.lon!))
        }

    }
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        map.setRegion(coordinateRegion, animated: false)
    }
}
