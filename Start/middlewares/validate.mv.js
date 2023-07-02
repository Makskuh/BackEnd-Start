const {TODO_CREATION_SCHEMA} = require("../validation/todoChemas")

function validateToDo(req,res,next) {
  TODO_CREATION_SCHEMA.validate(req.body).then((validateUser) => {
    console.log('todo is valid');
    next();
  }).catch((err) => {
    console.log('todo is not valid');
    res.send(err.message)
  })
}
module.exports.validateToDo = validateToDo;