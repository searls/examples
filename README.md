# Ember.js Examples

These apps are designed to illustrate features and best practices of
Ember.js. You can see them running at
[http://www.emberjs.com/examples/][1].

## Todos

As required by law, our JavaScript MVC framework includes an
implementation of a todos app. This version was inspired by [Jérôme Gravel-Niquet's Backbone todos sample](http://documentcloud.github.com/backbone/examples/todos/index.html).

If you'd like to compare and contrast JavaScript frameworks, we suggest
you visit [Addy Osmani's TodoMVC project][2]. We think the Ember.js
version excels in its simplicity, brevity, and focus on the task at
hand--not routine boilerplate.

## Simple Bindings

This simple example illustrates how Handlebars templates update live in
response to user entry. You'll note that, despite being totally
interactive, we haven't actually written any procedural code. Instead,
we describe our model, then, using Handlebars, describe what HTML should
be displayed depending on its current state. With Ember.js, you can
display sophisticated views using Handlebars—and never have to write the
code that makes sure they stay up-to-date when the model changes.

## Contacts

Designed to illustrate a real-world application, this contact manager
displays a list of contacts sorted by name. To edit a contact, select it
from the list, then double-click on either the first or last name on the
right. A dynamic text field appears that allows you to change the
contact's name. Note that as you type, the list on the left
automatically updates with the new value.

This example also illustrates how to create a user interface for editing
an array that dynamically changes size. After selecting a contact, click
the "Add Phone Number" or red delete buttons to see it in action.

To see how an Ember.js application might load records from the server,
switch to the `contacts` directory in your terminal and run `node
server.js`. Then, visit `http://localhost:3000`. At application
initialization, the data will be retrieved from `contacts.json` instead
of being generated from fixtures.

(Note that at this time, data entered in the web interface is not saved
back to the server. Pull requests that update this app to use Ember Data
are welcome.)

[1]: http://www.emberjs.com/examples/
[2]: http://addyosmani.github.com/todomvc/
