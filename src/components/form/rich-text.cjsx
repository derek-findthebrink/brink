React = require("react")
{Editor, EditorState} = require("draft-js")

DraftEditor = React.createClass({
	onChange: (editorState)->
		@setState({editorState})
	componentWillMount: ->
		@setState({
			editorState: EditorState.createEmpty()
			})
	render: ->
		console.log state:@state
		<div>
			<link href="/css/Draft.css" rel="stylesheet" />
			<Editor editorState={@state.editorState} onChange={@onChange} />
		</div>
	})

module.exports = {
	DraftEditor
}