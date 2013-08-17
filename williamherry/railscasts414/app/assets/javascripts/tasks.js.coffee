jQuery -> new ToDoList

class ToDoList
  constructor: ->
    @requests = []
    @tasks = $('#tasks').data('tasks')
    for task in @tasks
      @render(task)
    $('#tasks').on('submit', '#new_task', @add)
    $('#tasks').on('change', 'input[type=checkbox]', @update)
    $('#tasks').on('click', '#complete_all', @completeAll)
    $('#tasks').on('click', '#toggle_offline', @toggleOffline)

  render: (task) ->
    content = Mustache.render($('#task_template').html(), task)
    if task.complete
      $('#complete_tasks').append(content)
    else
      $('#incomplete_tasks').append(content)

  find: (id) ->
    for task in @tasks
      return task if task.id == id

  toggleOffline: (event) =>
    event.preventDefault()
    @offline = !@offline
    $('#toggle_offline').text(if @offline then "Go Online" else "Go Offline")
    @sync()

  add: (event) =>
    event.preventDefault()
    task = {name: $('#task_name').val(), complete: false}
    @render(task)
    $('#task_name').val("")
    @tasks.push(task)
    $.post("/tasks.json", task: task)

  update: (event) =>
    checkbox = $(event.target)
    task = @find(checkbox.data('id'))
    task.complete = checkbox.prop('checked')
    checkbox.parent().remove()
    @render(task)
    @save(task)

  completeAll: (event) =>
    event.preventDefault()
    @offline = true
    $('#incomplete_tasks').find('input[type=checkbox]').click()
    @offline = false
    @sync()

  save: (task) ->
    @requests.push
      method: "PUT"
      url: "/tasks/#{task.id}.json"
      body: $.param(task: {complete: task.complete})
    @sync()

  sync: ->
    unless @offline
      $.post("/batch", requests: JSON.stringify(@requests))
      @requests = []
