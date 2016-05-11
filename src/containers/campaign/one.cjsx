React = require("react")
_ = require("lodash")


USDRate = 1.29229

convertUSD = (USD)->
	return (USD * USDRate)

list = [
	{
		title: "SSL Certificate"
		price: convertUSD(295)
		currency: "CAD (USD => CAD)"
		priceFor: "for one year"
		category: "Security"
		description: [
			"provides a secure tunnel through which clients can connect to and interact with the website"
			"improves google search rankings"
		]
		why: "every website that collects sensitive user data should use a security certificate to protect those customers"
	}
	{
		title: "PCI Quarterly Compliance Scanning"
		price: convertUSD(79)
		currency: "CAD (USD => CAD)"
		description: "provides quarterly security weakness scanning to comply with sensitive user data-collection laws"
		priceFor: "for one year"
		category: "Security"
	}
	{
		title: "Wave One Campaign Advertising Fund"
		price: 100
		currency: "CAD"
		description: "to get the company advertising on Google and Facebook"
		priceFor: "to recruit initial customers"
		category: "Marketing"
	}
	{
		title: "Internet"
		price: 84 * 3
		currency: "CAD"
		description: "Web companies need to be online!"
		priceFor: "for three months of internet"
		category: "Business Expenses"
	}
	{
		title: "Groceries"
		price: 200
		currency: "CAD"
		description: "New businesses need food too. Help Derek eat well!"
		priceFor: "for one month"
		category: "Living Expenses"
	}
]

List = React.createClass({
	render: ->
		list = @props.items
		categories = _.uniq list.map (x, i)-> return x.category
		items = categories.map (x, i)->
			subItems = _.filter list, (y, i)->
				y.category == x
			<SubList title={x} key={i} items={subItems} />
		<div>
			<h2>{@props.title}</h2>
			<ul>
				{items}
			</ul>
		</div>
	})

SubList = React.createClass({
	render: ->
		items = @props.items.map (x, i)->
			<ListItem {...x} key={i} />
		<li>
			<h3>{@props.title}</h3>
			<ul>
				{items}
			</ul>
		</li>
	})

ListItem = React.createClass({
	render: ->
		styles = require("./campaign.sass")
		makeDescription = (x)->
			if typeof x == "string"
				return x
			else if _.isArray x
				return x.join("<br />")
		description = makeDescription(@props.description)
		<li className={styles.listItem}>
			<div className={styles.title}>
				<h2>{@props.title}</h2>
			</div>
			<div className={styles.description}> 
				<h4>description</h4>
				<p dangerouslySetInnerHTML={ __html: description} />
			</div>
			<div className={styles.why}>
				<h4>why</h4>
				<p>
					{@props.why}
				</p>
			</div>
			<div className={styles.price}>
				<span className={styles.priceSpan}>${@props.price.toFixed(2)}</span><br />
				<span>{@props.currency}</span><br />
				<span>{@props.priceFor}</span>
			</div>
		</li>
	})

One = React.createClass({
	render: ->
		styles = require("./campaign.sass")
		<div className={styles.container}>
			<h1>Wave One</h1>
			<p>
				Hello friends and family!
			</p>
			<p>
				Thanks for coming here! As some of you know, I am working on building a company
				to provide internet services to customers in Vancouver, Canada,
				and abroad. Right now the business is ready to launch but
				for this grocery list of things I'm missing right now. At the moment I find myself
				almost out of money, which is where you come in.
			</p>
			<p>
				In order to finish up this site and get to recruiting clients, these
				are the things that I need:
			</p>
			<List items={list} title="The List" />
		</div>
	})

module.exports = One