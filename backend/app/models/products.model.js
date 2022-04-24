const sql = require("./db.js");
// constructor
const Products = function(products) {
  this.categories_id = products.categories_id;
  this.name = products.name;
  this.title = products.title;
  this.description = products.description;
  this.price = products.price;
  this.quantity = products.quantity;
  this.variants_id = products.variants_id;
};

Products.create = (newProducts, result) => {
  sql.query("INSERT INTO products SET ?", newProducts, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }
    console.log("created card items: ", { id: res.insertId, ...newProducts });
    result(null, { id: res.insertId, ...newProducts });
  });
};

Products.findById = (id, result) => {
  sql.query(`SELECT * FROM products WHERE id = ${id}`, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }
    if (res.length) {
      console.log("found  items: ", res[0]);
      result(null, res[0]);
      return;
    }
    // not found products with the id
    result({ kind: "not_found" }, null);
  });
};

Products.getAll = (id, result) => {
  let query = "SELECT *, products.id as pro_id FROM products, categories WHERE products.categories_id = categories.id ORDER BY pro_id DESC";
  sql.query(query, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }
    console.log("products: ", res);
    result(null, res);
  });
};

Products.updateById = (id, products, result) => {
  console.log();

  sql.query(
    "UPDATE products SET categories_id = ?, name = ?, title = ?, description = ?, price = ?, quantity = ?, variants_id = ? WHERE id = ?",
    [products.categories_id, products.name, products.title, products.description, products.price, products.quantity, products.variants_id, id],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }
      if (res.affectedRows == 0) {
        // not found products with the id
        result({ kind: "not_found" }, null);
        return;
      }
      console.log("updated products: ", { id: id, ...products });
      result(null, { id: id, ...products });
    }
  );
};
Products.remove = (id, result) => {
  sql.query("DELETE FROM products WHERE id = ?", id, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }
    if (res.affectedRows == 0) {
      // not found products with the id
      result({ kind: "not_found" }, null);
      return;
    }
    console.log("deleted products with id: ", id);
    result(null, res);
  });
};
Products.removeAll = result => {
  sql.query("DELETE FROM products", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }
    console.log(`deleted ${res.affectedRows} card items`);
    result(null, res);
  });
};
module.exports = Products;