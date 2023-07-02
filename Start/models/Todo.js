const db = new Map();

class ToDo {
  constructor(todo) {
    const { text } = todo;

    this.text = text;


    this.createdAt = new Date();

    this.id = db.size + 1;
    db.set(this.id, this);

    return Promise.resolve(this);
  }

  static findAll() {
    return Promise.resolve([...db.values()]);
  }

  static findOne(id) {
    return Promise.resolve(db.get(+id));
  }

  static deleteById(id) {
    return Promise.resolve(db.delete(+id));
  }
}

module.exports = ToDo;
