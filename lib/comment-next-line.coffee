module.exports =

  activate: ->
    atom.workspaceView.command "comment-next-line:comment-down", => @commentDown()

  commentDown: ->
    editor = atom.workspace.activePaneItem
    editor.toggleLineCommentsInSelection()
    editor.moveCursorDown()
