React = require("react")

styles = require("modules/story.sass")


items = [
	{
		title: "Because it shouldn't be hard to get your business on the internet."
		description: "this is why we exist"
	}
	{
		title: "by using the latest tricks and tools"
		description: "this is how we do our thing"
	}
	{
		title: "you get:"
		description: "this is why you should choose us"
	}
	{
		title: "check out our products"
		description: "this is what you should do now"
	}
]

Why = React.createClass({
	render: ->
		<div>
			<h2>{items[0].title}</h2>
			<p>Thanks to the internet, the speed of commerce has never been faster. And it keeps speeding up.</p>
			<p>We specialize in getting you online, fast, with a code-base that will grow as fast as your company does.</p>
		</div>
	})

How = React.createClass({
	render: ->
		<div>
			<h2>{items[1].title}</h2>
			<div className={styles.twoCol}>
				<div>
					<h3>Universal Code</h3>
				</div>
				<div>
					<h3>Sprint Development</h3>
				</div>
			</div>
		</div>
	})

Benefits = React.createClass({
	render: ->
		<div>
			<h2>{items[2].title}</h2>
			<div className={styles.threeCol}>
				<div>
					<h3>speed</h3>
					<p>
						Want it done fast? No problem. Leveraging the latest and greatest of the
						node.js and javascript ecosystem, our tools (which we love) and our philosophy
						lets us move quickly from conception to completion.
					</p>
				</div>
				<div>
					<h3>money in your pocket</h3>
					<p>
						We're cheap! It's true, check out our competition. We're a startup company too, looking
						to make our mark on the world wide web. Being a startup, like many of you know, teaches
						you how to keep your operation lean. Our lean operation keeps our costs down and your
						wallet happy.
					</p>
				</div>
				<div>
					<h3>quality, reusable code</h3>
					<p>
						The internet is getting smarter, and being brink technology we're keeping ourselves 
						on the cutting edge. Newcomers like React, Node and the Isomorphic philosophy have enabled us
						to write compatible, standards-compliant code quickly using our custom-built library.
					</p>
				</div>
			</div>
			<h3>
				Find out what it means to use one universal codebase. Let us build your online presence.
			</h3>
		</div>
	})

Now = React.createClass({
	render: ->
		<div>
			<h2>{items[3].title}</h2>
		</div>
	})



StoryItem = React.createClass({
	render: ->
		<div className={styles.storyItem}>
			<div className={styles.inner}>
				{@props.children}
			</div>
		</div>
	})

Story = React.createClass({
	render: ->
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