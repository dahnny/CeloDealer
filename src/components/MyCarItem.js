const MyCarItem = props => {
    return(
        <div className="car-item col-lg-4 col-md-6 col-sm-12">
                                <div className="thumb">
                                    <img src={props.car.carImage} alt = "item" />
                                </div>
                                <div className="car-item-body">
                                    <div className="content">
                                        <h4 className="title">{props.car.carName}</h4>
                                        <span className="price">Price:${props.car.price/1000000000000000000}</span>
                                        <p>{props.car.carDescription}</p>
                                        {(props.car.isBought === true && props.car.isRented === false) ? <div>
                                        <a onClick = {()=>props.sellCar(props.car.index)} className="cmn-btn">Sell Car</a>
                                        <a onClick = {()=>props.rentCar(props.car.index)} className="cmn-btn">Rent your Car</a>
                                        </div> : <p>This car is rented!!</p>}
                                        
                                    </div>
                                    <div className="car-item-meta">
                                        <ul className="details-list">
                                            <li><i className="fa fa-car" />{props.car.carName}</li>
                                      
                                        </ul>
                                    </div>
                                </div>
                            </div>
    )
}

export default MyCarItem;