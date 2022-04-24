import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProductService } from 'src/app/services/product.service';


@Component({
  selector: 'app-product-edit',
  templateUrl: './product-edit.component.html',
  styleUrls: ['./product-edit.component.css']
})
export class ProductEditComponent implements OnInit {
  product = {
    name: '',
    categories_id: '',
    title: '',
    description: '',
    price: '',
    quantity: ''
  };
  productId:any;
  submitted = false;

  constructor(
    private route: ActivatedRoute,
    private productService: ProductService
    ) {
   }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    this.productId =  id;
    this.productService.read(id)
      .subscribe(
        response => {
          console.log("product", response);
          this.product =  response;
        },
        error => {
          console.log(error);
        });

  }

  editProduct(){
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

    this.productService.update(this.productId, data)
      .subscribe(
        response => {
          console.log(response);
          this.submitted = true;
        },
        error => {
          console.log(error);
        });
      }

}
