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
		description: "provides quarterly security weakness scanning"
		why: "to comply with user sensitive data-collection laws"
		priceFor: "for one year"
		category: "Security"
	}
	{
		title: "Wave One Campaign Advertising Fund"
		price: 200
		currency: "CAD"
		description: "to get the company advertising on Google and Facebook"
		why: "to recruit initial customers"
		priceFor: "for one month"
		category: "Marketing"
	}
	{
		title: "Internet"
		price: 84 * 3
		currency: "CAD"
		description: "internet access"
		why: "to keep the company online"
		priceFor: "for three months"
		category: "Business Expenses"
	}
	# {
	# 	title: "Groceries"
	# 	price: 200
	# 	currency: "CAD"
	# 	description: "New businesses need food too. Help Derek eat well!"
	# 	why: "because even coders get hungry sometimes"
	# 	priceFor: "for one month"
	# 	category: "Living Expenses"
	# }
]

List = React.createClass({
	render: ->
		list = @props.items
		total = 0
		categories = _.uniq list.map (x, i)->
			total += x.price
			return x.category
		items = categories.map (x, i)->
			subItems = _.filter list, (y, i)->
				y.category == x
			<SubList title={x} key={i} items={subItems} />

		styles = require("./campaign.sass")
		<div>
			<h2>{@props.title}</h2>
			<ul>
				{items}
			</ul>
			<div className={styles.total}>
				<h2>Total</h2>
				<p>${total.toFixed(2)}</p>
			</div>
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

PaypalButton = React.createClass({
	render: ->
		<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
			<input type="hidden" name="cmd" value="_s-xclick" />
			<input type="hidden" name="hosted_button_id" value="HK7FAMFS5T76L" />
			<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!" />
			<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1" />
		</form>
	})

Header = React.createClass({
	render: ->
		styles = require("./campaign.sass")
		<div className={styles.header}>
			<h1>{@props.title}</h1>
			<div className={styles.raised}>
				<h2>Raised so far:</h2>
				<h2>${@props.raised}</h2>
			</div>
		</div>
	})

One = React.createClass({
	render: ->
		styles = require("./campaign.sass")
		<div className={styles.container}>
			<Header title="Wave One" raised=0 />
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
			<p>
				That should keep me going long enough to get the first customers recruited, online
				and happy!
			</p>
			<p>
				Anything would help, and in return I have a few ideas for what I could do for you:
			</p>
			<hr />
			<ul className={styles.offers}>
				<li>A 20% discount on any of the services offered by Brink up to the value of your donation</li>
				<li>An "I Owe You" for the same as the above, if you have a project on the horizon</li>
				<li>If enough are interested (family, this one's for you in particular), an online and badass Euchre platform for conducting long-distance family bonding</li>
				<li>A free semi-professional photography session conducted by yours truly including editing and high-resolution outputs (any donations over $100 are eligible)</li>
				<li>A huge hug, a smile and a great big thank you</li>
				<li>Anything else (within reason, haha) that you think you would like from me!</li>
			</ul>
			<hr />
			<h2>Interested?</h2>
			<p>Click the link below to be redirected to Paypal!</p>
			<PaypalButton />
			<p>
				Once you've done that, email me at <a href="mailto:derek@findthebrink.com">derek@findthebrink.com</a>, let me know the amount
				that you have donated and then tell me know what I can do for you!
			</p>
			<p>
				This is a pretty exciting time for me, I'm really stoked to get going on this company. Your help and support
				is getting me there, and I thank you so much for it!
			</p>
			<p className={styles.signOff}>
				Sincerely, <br />
				Derek Moore <br />
				Principal Designer,
				Brink Technology Co.
			</p>
		</div>
	})

module.exports = One