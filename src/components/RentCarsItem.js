
const RentCarItem = props => {

    return (
        <div className="car-item col-lg-4 col-md-6 col-sm-12">
        <div className="thumb">
            <img src={props.car.carImage} alt = "item" />
        </div>
        <div className="car-item-body">
            <div className="content">
                <h4 className="title">{props.car.carName}</h4>
                <span className="price">Price:${props.car.price/1000000000000000000} per day</span>
                <p>{props.car.carDescription}</p>
                <a style = {{color: "white"}} onClick = {()=>props.rentCar(props.car.price/1000000000000000000, props.car.index)} className="cmn-btn">Rent Car</a>
            </div>
            <div className="car-item-meta">
                <ul className="details-list">
                    <li><i className="fa fa-sliders" />{(props.car.isUsed === 'true' || props.car.isUsed === true) ? 'Used': 'New'}</li>
                </ul>
            </div>
        </div>
    </div>
    )
}

export default RentCarItem;