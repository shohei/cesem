import React from "react"
import PropTypes from "prop-types"


class Services extends React.Component {
    add = () => {
        this.props.callbackAdd();
    }

    remove = () => {
        this.props.callbackRemove();
    }

    render() {
      return (
        <div className="columns">
            <div className="column is-3">
                <label className="label is-small">Name</label>
                <input type="text" className="input" />
            </div>
            <div className="column is-3">
                <label className="label is-small">Supplier</label>
                <input type="text" className="input" />
            </div>
            <div className="column is-3">
                <label className="label is-small">Price</label>
                <input type="text" className="input" />
            </div>
            <div className="column is-1">
                <label className="label is-small">Quantity</label>
                <input type="number" pattern="[0-9]" className="input" />
            </div>
            <div className="column is-1">
                <label className="label is-small">Add</label>
                <div onClick={this.add} className="button"><i className="fa fa-plus"></i></div>
            </div>
            <div className="column is-1">
                <label className="label is-small">Delete</label>
                <div onClick={this.remove} className="button"><i className="fa fa-minus"></i></div>
            </div>
        </div>
      )
    }
}

class Maintenance extends React.Component {
    constructor(props){
        super(props);
        this.state = {services: 1,};
    }

    callbackAdd = () => {
        let services = this.state.services;
        this.setState({services: services+1})
    }

    callbackRemove = () => {
        let services = this.state.services;
        if (services != 1) {
          this.setState({services: services-1})
        }
    }

  render () {
    return (
      <React.Fragment>
      {Array(this.state.services).fill().map((_, i) => 
                 <Services
                   callbackAdd={this.callbackAdd} 
                   callbackRemove={this.callbackRemove} 
                   key={i} />) }
      </React.Fragment>
    );
  }
}

// Maintenance.propTypes = {
//   greeting: PropTypes.string
// };
export default Maintenance
