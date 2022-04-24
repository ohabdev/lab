const Products = require("../models/products.model.js");
// Create and Save a new Tutorial
exports.create = (req, res) => {
    // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }
  // Create a Tutorial
  // categories_id
  // name
  // title
  // description
  // price
  // quantity
  // variants_id
  const products = new Products({
    categories_id: req.body.categories_id,
    name: req.body.name,
    title: req.body.title,
    description: req.body.description,
    price: req.body.price,
    quantity: req.body.quantity,
    variants_id: req.body.variants_id
  });
  // Save products in the database
  Products.create(products, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the CardItems."
      });
    else res.send(data);
  });
};
// Retrieve all CardItems from the database (with condition).
exports.findAll = (req, res) => {
    const id = req.query.id;
    Products.getAll(id, (err, data) => {
        if (err)
        res.status(500).send({
            message:
            err.message || "Some error occurred while retrieving CardItems."
        });
        else res.send(data);
    });
};
// Find a single Products with a id
exports.findOne = (req, res) => {
  Products.findById(req.params.id, (err, data) => {
        if (err) {
          if (err.kind === "not_found") {
            res.status(404).send({
              message: `Not found Tutorial with id ${req.params.id}.`
            });
          } else {
            res.status(500).send({
              message: "Error retrieving Tutorial with id " + req.params.id
            });
          }
        } else res.send(data);
      });
};

// Update a Products identified by the id in the request
exports.update = (req, res) => {
  // Validate Request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }
  Products.updateById(
    req.params.id,
    new Products(req.body),
    (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(404).send({
            message: `Not found Card Items with id ${req.params.id}.`
          });
        } else {
          res.status(500).send({
            message: "Error updating Card Items with id " + req.params.id
          });
        }
      } else res.send(data);
    }
  );
};
// Delete a Products with the specified id in the request
exports.delete = (req, res) => {
  Products.remove(req.params.id, (err, data) => {
        if (err) {
          if (err.kind === "not_found") {
            res.status(404).send({
              message: `Not found Products with id ${req.params.id}.`
            });
          } else {
            res.status(500).send({
              message: "Could not delete Products with id " + req.params.id
            });
          }
        } else res.send({ message: `Products was deleted successfully!` });
      });
};
// Delete all Products from the database.
exports.deleteAll = (req, res) => {
  Products.removeAll((err, data) => {
        if (err)
          res.status(500).send({
            message:
              err.message || "Some error occurred while removing all Products."
          });
        else res.send({ message: `All Products were deleted successfully!` });
      });
};