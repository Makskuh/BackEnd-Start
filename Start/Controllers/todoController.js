const { ToDo } = require('../models');

module.exports.getToDos = (req, res, next) => {
  ToDo.findAll().then((todos) => {
    res.send(todos);
  });
};
module.exports.getToDo = (req, res, next) => {
  const {
    query,
    params: { id: todoId},
  } = req;
  ToDo.findOne(todoId).then((todo) => {
    res.send(todo);
  });
};
module.exports.creaeteToDo = (req, res, next) => {
  new ToDo(req.body).then((todo) => {
    res.send(todo);
  });
};
module.exports.deleteTodo = (req, res, next) => {
  const {
    params: { id },
  } = req;

  ToDo.deleteById(id).then((isDeleted) => {
    res.send(isDeleted);
  });
};
