React = require("react")
{
	Editor
	EditorState 
	ContentState 
	convertToRaw
	convertFromRaw
	convertFromHTML
	RichUtils 
	} = require("draft-js")
draft = require("draft-js")
console.log draft:draft, ContentState:ContentState

backdraft = require("backdraft-js")


markup = {
	BOLD: ["<strong>", "</strong>"]
	ITALIC: ["<em>", "</em>"]
	H1: ["<h1>", "</h1>"]
	H2: ["<h2>", "</h2>"]
}


DraftEditor = React.createClass({
	onChange: (editorState)->
		@setState({editorState})
	onBlur: ->
		console.log "on blur ran"
		editorState = @state.editorState.getCurrentContent()
		# val = backdraft(convertToRaw(editorState), markup)
		val = convertToRaw(editorState)
		# final = val.join("<br />")
		console.log val:val
		e = {
			target:
				value: val
		}
		# console.log val:val, final:final
		@props.onChange(e)
	componentWillMount: ->
		console.log props:@props
		if @props.value
			val = @props.value
			if !val.entityMap
				val.entityMap = {}
			content = EditorState.createWithContent convertFromRaw(val)
		else
			content = EditorState.createEmpty()
		@setState({
			editorState: content
			})
	toggleInline: (type)->
		return (e)=>
			e.preventDefault()
			@onChange(RichUtils.toggleInlineStyle(@state.editorState, type))
	render: ->
		console.log state:@state, props:@props
		styles = require("./form.sass")
		richStyles = require("./rich-styles.sass")

		<div className={styles.editorContainer}>
			<div className={richStyles.menu}>
				<button onClick={@toggleInline("BOLD")}><strong>B</strong></button>
				<button onClick={@toggleInline("ITALIC")}><em>I</em></button>
			</div>
			<Editor editorState={@state.editorState} onChange={@onChange} onBlur={@onBlur} />
		</div>
	})

module.exports = {
	DraftEditor
}