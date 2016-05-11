React = require("react")

{RouterButton} = require("../buttons/buttons.cjsx")

items = [
	{
		title: "Because it shouldn't be hard to get your business on the internet."
		description: "this is why we exist"
	}
	{
		title: "by using the latest tricks and tools:"
		description: "this is how we do our thing"
	}
	{
		title: "you get:"
		description: "this is why you should choose us"
	}
	{
		title: "what's next?"
		description: "this is what you should do now"
	}
]

Why = React.createClass({
	render: ->
		<div>
			<h2>{items[0].title}</h2>
			<p>We specialize in getting you online, fast, with a code-base that will grow as fast as your company does.</p>
		</div>
	})

How = React.createClass({
	render: ->
		styles = require("./story.sass")
		<div>
			<h2>{items[1].title}</h2>
			<div className={styles.twoCol}>
				<div>
					<PictureItem title="Universal Code" img="/img/universe.png">
						<p>
							Gone are the days of using a different language for each target device. Our custom servers, web sites and 
							applications are all written in universal javascript. 
						</p>
					</PictureItem>
					<h3 className={styles.callout}>One codebase, one language, super fast development.</h3>
				</div>
				<div>
					<PictureItem title="Sprint Development" img="/img/rabbit.png">
						<p>
							We like to get things done quickly too. Our tools help us move quickly, freeing up more time for working
							with you to make the best online presence for your business.
						</p>
					</PictureItem>
					<h3 className={styles.callout}>Less time developing, more time earning.</h3>
				</div>
			</div>
		</div>
	})

PictureItem = React.createClass({
	render: ->
		styles = require("./story.sass")
		<div className={styles.pictureItem}>
			<img src={@props.img} />
			<h3>{@props.title}</h3>
			<hr />
			{@props.children}
		</div>
	})

Benefits = React.createClass({
	render: ->
		styles = require("./story.sass")
		<div>
			<h2>{items[2].title}</h2>
			<div className={styles.threeCol}>
				<PictureItem title="speed" img="/brink-logo-small.svg">
					<p>
						Want it done fast? No problem. Our tools (which we love) and our philosophy
						lets us move quickly from conception to completion.
					</p>
				</PictureItem>
				<PictureItem title="money in your pocket" img="/img/wallet.png">
					<p>
						We're cheap! It's true, check out our competition. Being a startup teaches
						you how to keep your operation lean. Our lean operation keeps our costs down and your
						wallet happy.
					</p>
				</PictureItem>
				<PictureItem title="quality, reusable code" img="/img/future-code.png">
					<p>
						The internet is getting smarter. Newcomers like React, Node and the Isomorphic philosophy have enabled us
						to write compatible, standards-compliant code quickly using our custom-built library.
					</p>
				</PictureItem>
			</div>
			<h3 className={styles.callout}>
				Your business will love our universal codebase. Let us build your online presence.
			</h3>
		</div>
	})

Now = React.createClass({
	render: ->
		styles = require("./story.sass")
		<div>
			<h2>{items[3].title}</h2>
			<div className={styles.twoCol}>
				<div>
					<h3>what can we do for you?</h3>
					<RouterButton href="/products-and-services" title="products & services" type="go" />
				</div>
				<div>
					<h3>find out what technology we use</h3>
					<RouterButton href="/stack" title="stack" type="go" />
				</div>
			</div>
		</div>
	})



StoryItem = React.createClass({
	render: ->
		styles = require("./story.sass")
		<div className={styles.storyItem}>
			<div className={styles.inner}>
				{@props.children}
			</div>
		</div>
	})

Story = React.createClass({
	render: ->
		styles = require("./story.sass")
		style = {
			backgroundImage: "url(/backgrounds/square_bg.png)"
		}

		<div className={styles.container} style={style}>
			<StoryItem>
				<Why />
			</StoryItem>
			<StoryItem>
				<How />
			</StoryItem>
			<StoryItem>
				<Benefits />
			</StoryItem>
			<StoryItem>
				<Now />
			</StoryItem>

		</div>
	})

module.exports = Story