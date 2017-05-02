// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Item from './components/item.jsx'

class ItemCollection extends React.Component {
  constructor(props) {
    super(props)

    this.state = { query: '', favoritedItems: [], unfavoritedItems: [ { name: "Waiting for data", description: "Waiting for data"}] }

    window.fetch('/items.json').then((response) =>
    {
      response.json().then((json) => {
        this.setState({ favoritedItems: [], unfavoritedItems: json })
      })
    })
  }

  handleInputChange(event) {
    this.setState({ query: event.target.value })
  }

  handleItemClick(item) {
    this.setState((oldState) => {
      favoritedItems: oldState.favoritedItems.push(item)
    })
  }

  itemsDomElements(items) {
    return items.
            filter((item) => this.state.query === '' || item.description.indexOf(this.state.query) != -1).
            map((item, index) => <Item itemClick={this.handleItemClick.bind(this, item)} key={item.id} name={item.name} description={item.description} id={item.id} image_url={item.image_url}/>)
  }

  render() {
    return <div>
      <input type="text" onChange={this.handleInputChange.bind(this)}/>

      <div className="page-header">
        <h1>Unfavorited</h1>
      </div>
      <ul className="list-group item-list-from-react">
        {this.itemsDomElements(this.state.unfavoritedItems)}
      </ul>

      <div className="page-header">
        <h1>Favorited</h1>
      </div>
      <ul className="list-group item-list-from-react">
        {this.itemsDomElements(this.state.favoritedItems)}
      </ul>

    </div>
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const reactItemsDomElement = document.querySelector('.react-items')

  ReactDOM.render(
    <ItemCollection />,
    reactItemsDomElement,
  )
})
