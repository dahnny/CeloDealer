const MyCarItem = props => {
    return(
        <div className="car-item col-lg-4 col-md-6 col-sm-12">
                                <div className="thumb">
                                    <img src={props.car.carImage} alt = "item" />
                                </div>
                                <div className="car-item-body">
                                    <div className="content">
                                        <h4 className="title">{props.car.carName}</h4>
                                        <span className="price">Price:${props.car.price.c/1000000000000000000}</span>
                                        <p>{props.car.carDescription}</p>
                                        <a onClick = {()=>props.sellCar(props.car.index)} className="cmn-btn">Sell Car</a><a onClick = {()=>props.rentCar(props.car.index)} className="cmn-btn">Rent your Car</a>
                                    </div>
                                    <div className="car-item-meta">
                                        <ul className="details-list">
                                            <li><i className="fa fa-car" />model 2014ib</li>
                                            <li><i className="fa fa-tachometer" />32000 KM</li>
                                            <li><i className="fa fa-sliders" />auto</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
    )
}

export default MyCarItem;