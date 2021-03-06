@Post = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/posts/#{ @props.post.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeletePost @props.post
  render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.post.description
        React.DOM.td null,
          React.DOM.a 
              className: 'btn btn-danger'
              onClick: @handleDelete
              'delete'
