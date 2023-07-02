const express = require('express');
const { validateToDo } = require('./middlewares/validate.mv');
const todoController = require('./Controllers/todoController');
const app = express();

const bodyParser = express.json();
app.get('/', todoController.getToDos);
app.post('/todo', bodyParser, validateToDo, todoController.creaeteToDo)
app.get('/todo', todoController.getToDos);
app.get('/todo/:id', todoController.getToDo);
app.delete('/todo/:id', todoController.deleteTodo)
app.get('*', (req, res) => {
  res.send(`Cant find ${req.path} at method ${req.method}`);
});

app.listen(5000, () => {
  console.log('Server started on port 5000');
});
