describe "Todos", ->
  Then -> Todos instanceof Ember.Application

describe "Todos.Todo", ->
  context "a default Todo", ->
    Given -> @subject = Todos.Todo.create()
    Then -> @subject.get('title') == null
    Then -> @subject.get('isDone') == false

  context "a finished todo with a title", ->
    Given -> @subject = Todos.Todo.create(title: "write tests", isDone: true)
    Then -> @subject.get('title') == "write tests"
    Then -> @subject.get('isDone') == true

describe "Todos.todosController", ->
  Given -> @subject = Todos.todosController

  Given -> @finishedTodo = Todos.Todo.create(title: "A", isDone: true)
  Given -> @unfinishedTodo = Todos.Todo.create(title: "B", isDone: false)

  describe "#createTodo", ->
    When -> @subject.createTodo("foo")
    Then -> expect(@subject.objectAtContent(0).get('title')).toBe('foo')

  describe "#clearCompletedTodos", ->
    Given -> resetController([@finishedTodo, @unfinishedTodo])
    When -> @subject.clearCompletedTodos()
    Then -> expect(@subject.get('length')).toBe 1
    Then -> @subject.objectAtContent(0) == @unfinishedTodo

  describe "#remaining", ->
    context "an empty list", ->
      Then -> @subject.get('remaining') == 0

    context "one finished, one unfinished", ->
      Given -> resetController([@finishedTodo, @unfinishedTodo])
      Then -> @subject.get('remaining') == 1

  describe "#allAreDone", ->
    context "an empty list", ->
      Then -> @subject.get('allAreDone') == false #wtf?

    context "some", ->
      Given -> resetController([@finishedTodo, @unfinishedTodo])
      Then -> @subject.get('allAreDone') == false

    context "all done", ->
      Given -> resetController([@finishedTodo])
      Then -> @subject.get('allAreDone') == true

describe "Todos.StatsView", ->
  Given -> @subject = Todos.StatsView.create()

  #not a very valuable spec, but nothing else here requires it be a view
  Then -> @subject instanceof Em.View

  #todo: what's the non-private way to inspect the following?
  Then -> @subject.get('remainingBinding')._from == 'Todos.todosController.remaining'

  describe "#remainingString", ->
    context "no items", ->
      Given -> @subject.set('remaining', 0)
      Then -> @subject.get('remainingString') == "0 items"

    context "singular item", ->
      Given -> @subject.set('remaining', 1)
      Then -> @subject.get('remainingString') == "1 item"

    context "plural items", ->
      Given -> @subject.set('remaining', 52)
      Then -> @subject.get('remainingString') == "52 items"

describe "Todos.CreateTodoView", ->
  Given -> @subject = Todos.CreateTodoView.create()

  #again, not very valuable, but nothing else about the code requires it be a text field
  Then -> @subject instanceof Em.TextField

  describe "#insertNewline", ->
    context "a populated text field", ->
      Given -> @subject.set('value','fooberry')
      When -> @subject.insertNewline()
      Then -> Todos.todosController.objectAtContent(0).get('title') == 'fooberry'
      Then -> @subject.get('value') == ''

    context "a blank text field", ->
      When -> @subject.insertNewline()
      Then -> Todos.todosController.get('length') == 0
      
#would prefer for the controller not to already be a singleton instance, but alas..
resetController = (newContent=[]) ->
  Todos.todosController.replaceContent(0,Todos.todosController.get('length'), newContent)

afterEach ->
  resetController()
