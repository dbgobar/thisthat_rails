@Posts = React.createClass
  getInitialState: ->
    posts: @props.data
  getDefaultProps: ->
    posts: []
  addPost: (post) ->
    posts = @state.posts.slice()
    posts.push post
    @setState posts: posts
  deletePost: (post) ->
    posts = @state.posts.slice()
    index = lifts.indexOf post
    posts.splice index, 1
    @replaceState posts: posts
  render: ->
      React.DOM.div
        className: 'posts'
        React.DOM.h1
            className: 'title'
            'Posts'
        React.createElement PostForm, handleNewPost: @addPost
        React.DOM.table
            className: 'table table-bordered'
            React.DOM.thead null
              React.DOM.th null, 'Description'
              React.DOM.th null, 'Actions'
            React.DOM.tbody null,
              for post in @state.posts
                React.createElement Post, key: post.id, post: post, handleDeletePost: @deletePost
