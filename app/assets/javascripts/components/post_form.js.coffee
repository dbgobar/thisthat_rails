@PostForm = React.createClass
  getInitialState: ->
    description: ''
  handleValueChange: (e) ->
    valueName = e.target.name
    @setState "#{valueName}": e.target.value
  valid: ->
    @state.date && @state.description
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', {post: @state}, (data) =>
      @props.handleNewPost data
      @setState @getInitialState()
      'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'description'
          name: 'description'
          value: @state.description
          onChange: @handleValueChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Create Post'
