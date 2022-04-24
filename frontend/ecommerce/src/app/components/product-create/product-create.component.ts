import { Component, OnInit } from '@angular/core';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-product-create',
  templateUrl: './product-create.component.html',
  styleUrls: ['./product-create.component.css']
})
export class ProductCreateComponent implements OnInit {
  product = {
    name: '',
    categories_id: '',
    title: '',
    description: '',
    price: '',
    quantity: ''
  };
  submitted = false;

  constructor(private productService: ProductService) { }

  ngOnInit(): void {
  }

  createProduct(): void {
    const data = {
      name: this.product.name,
      categories_id: this.product.categories_id,
      title: this.product.title,
      description: this.product.description,
      price: this.product.price,
      quantity: this.product.quantity,
      variants_id: 5
    };

    console.log("data", data);

    this.productService.create(data)
      .subscribe(
        response => {
          console.log(response);
          this.submitted = true;
        },
        error => {
          console.log(error);
        });
  }

  newProduct(): void {
    this.submitted = false;
    this.product = {
      name: '',
      categories_id: '',
      title: '',
      description: '',
      price: '',
      quantity: ''
    };
  }

}