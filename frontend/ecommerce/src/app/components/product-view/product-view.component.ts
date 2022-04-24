import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-product-view',
  templateUrl: './product-view.component.html',
  styleUrls: ['./product-view.component.css']
})
export class ProductViewComponent implements OnInit {
  product = {
    name: '',
    categories_id: '',
    title: '',
    description: '',
    price: '',
    quantity: ''
  };
  constructor(
    private route: ActivatedRoute,
    private productService: ProductService
    ) {
   }
  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
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

}
