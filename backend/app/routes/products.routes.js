module.exports = app => {
    const products = require("../controllers/products.controller.js");
    var router = require("express").Router();
    // Create a new products
    router.post("/", products.create);
    // Retrieve all cardItems
    router.get("/", products.findAll);
    // Retrieve a single cardItems with id
    router.get("/:id", products.findOne);
    // Update a cardItems with id
    router.put("/:id", products.update);
    // Delete a cardItems with id
    router.delete("/:id", products.delete);
    // Delete all cardItems
    router.delete("/", products.deleteAll);
    app.use('/api/products', router);
  };