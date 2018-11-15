<html lang="en">
<head>
    <title>Todo Management</title>
    <style>
    .error 
    {
        color: #ff0000;
        font-weight: bold;
    }
    #listOfEmployees tr:first-child{
        font-weight: bold;
    }
    </style>
</head>
 
<body>
     
    <div>
        id : <input type="text" id="id" disabled/> <br/>
        name: <input type="text" id="name"/> <br/>
        description: <textarea id="description" cols="30" rows="5"></textarea> <br/>
        <input type="button" value="Create" onclick="createTodo()"/> | <input type="button" value="update" onclick="updateTodo()"/>
    </div>
    <table id="listOfTodos" border="1">
   		<tr>
        	<td>ID</td>
        	<td>Name</td>
            <td>Description</td>   
            <td>Actions</td>    
    	</tr>
    </table>
 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
            getAllTodos();
        });

        function getAllTodos() {
            $.ajax({
                url: '/student/todos',
                type: 'GET',
                contentType: 'application/json',
                success: function(data) {
                    for (var index = 0; index < data.length; index++) {
                        todo = data[index];

                        $('#listOfTodos').append('<tr id=\'todo-' + todo.id + '\'><td id=\'todo-id-' + todo.id + '\'>' + todo.id + '</td><td id=\'todo-name-' + todo.id + '\'>' + todo.name + '</td><td id=\'todo-description-' + todo.id +  '\'>' + todo.description + '</td><td><input type=\'button\' value=\'Edit\' onclick=\'editTodo(' + todo.id + ')\'/> | <input type=\'button\' value=\'Delete\' onclick=\'deleteTodo(' + todo.id + ')\'/></td></tr>');
                    }
                },
                error: function(error) {

                }
            });
        }  
	
        function deleteTodo(id) {
            $.ajax({
                url: '/student/todo/' + id,
                type: 'DELETE',
                contentType: 'application/json',
                success: function(data) {
                    $('#todo-' + id).remove();
                },
                error: function(error) {

                }
            });
        }
        
        function editTodo(id) {
            $('#id').val($('#todo-id-' + id).text());
            $('#name').val($('#todo-name-' + id).text());
            $('#description').val($('#todo-description-' + id).text());
        }
    
        function updateTodo() {
            id = $('#id').val();
            todo = JSON.stringify({
                "name" : $('#name').val(),
                "description": $('#description').val()
            });

            $.ajax({
                url: '/student/todo/' + id,
                type: 'PUT',
                data: todo,
                contentType: 'application/json',
                success: function(data) {
                    $('#todo-name-' + id).text(data.name);
                    $('#todo-description-' + id).text(data.description);

                    $('#name').val('');
                    $('#description').val('');
                },
                error: function(error) {

                }
            });
        }

        function createTodo() {
            todo = JSON.stringify({
                "name" : $('#name').val(),
                "description": $('#description').val()
            });

            $.ajax({
                url: '/student/todo',
                type: 'POST',
                data: todo,
                contentType: 'application/json',
                success: function(data) {
                    $('#listOfTodos').append('<tr id=\'todo-' + data.id + '\'><td id=\'todo-id-' + data.id + '\'>' + data.id + '</td><td id=\'todo-name-' + data.id + '\'>' + data.name + '</td><td id=\'todo-description-' + data.id +  '\'>' + data.description + '</td><td><input type=\'button\' value=\'Edit\' onclick=\'editTodo(' + data.id + ')\'/> | <input type=\'button\' value=\'Delete\' onclick=\'deleteTodo(' + data.id + ')\'/></td></tr>');

                    $('#name').val('');
                    $('#description').val('');
                },
                error: function(error) {

                }
            });
        }
    </script>   
</body>
</html>