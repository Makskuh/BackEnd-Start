const yup = require('yup');

const TODO_CREATION_SCHEMA = yup.object({
  text:yup.string().required(),
});

module.exports.TODO_CREATION_SCHEMA = TODO_CREATION_SCHEMA;