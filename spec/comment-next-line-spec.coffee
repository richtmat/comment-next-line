{WorkspaceView} = require 'atom'
CommentNextLine = require '../lib/comment-next-line'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "CommentNextLine", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('comment-next-line')

  describe "when the comment-next-line:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.comment-next-line')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'comment-next-line:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.comment-next-line')).toExist()
        atom.workspaceView.trigger 'comment-next-line:toggle'
        expect(atom.workspaceView.find('.comment-next-line')).not.toExist()
