import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

export default class Item extends React.Component {
  render() {
    return (
      <li onClick={this.props.itemClick}>
        <span className="number">{this.props.index + 1}</span>
        <div>
            <h4>{this.props.name}</h4>
            <p>{this.props.description}</p>
        </div>
      </li>
    )
  }
}
