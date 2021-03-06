import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

export default class Item extends React.Component {
  render() {
    return (
      <li className="list-group-item" onClick={this.props.itemClick}>
        <div className="media">
          <div className="media-left">
            <img className="media-object" src={this.props.image_url} width="64" height="64"/>
          </div>
          <div className="media-body">
            <a href={this.props.link}>
              <h4 className="media-heading">{this.props.name}</h4>
              <p>
                {this.props.description}
              </p>
            </a>
          </div>
        </div>
      </li>
    )
  }
}
