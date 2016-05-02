React = require("react")

{createDevTools} = require("redux-devtools")
LogMonitor = require("redux-devtools-log-monitor").default
DockMonitor = require("redux-devtools-dock-monitor").default

DevTools = createDevTools(
	<DockMonitor toggleVisibilityKey="ctrl-h" changePositionKey="ctrl-q" defaultIsVisible={false}>
		<LogMonitor theme="tomorrow" />
	</DockMonitor>
	)

module.exports = DevTools