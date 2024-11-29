import { Component, OnInit } from '@angular/core';
import { Product } from '../../common/product';
import { ProductService } from '../../services/product.service';
import { CartItem } from '../../common/cart-item';
import { CartService } from '../../services/cart.service';
import { HttpClient } from '@angular/common/http';


@Component({
  selector: 'app-all-product-list',
  templateUrl: './all-product-list.component.html',
  styleUrls: ['./all-product-list.component.css'],
})

export class AllProductListComponent implements OnInit {
  products: any[] = [];  // Initialize as an empty array

  constructor(
    private service: ProductService,
    private cartService: CartService,
    private http: HttpClient
  ) {}

  ngOnInit() {
    // Fetch data from the API
    this.http.get<any>('http://localhost:8181/api/products').subscribe(
      (response) => {
        // Log the API response to inspect its structure
        console.log('API response:', response);
        
        // Extract the products array from _embedded
        if (response && response._embedded && Array.isArray(response._embedded.products)) {
          this.products = response._embedded.products;
        } else {
          console.error('Expected products array, but received:', response);
        }
      },
      (error) => {
        console.error('Error fetching products:', error);
        console.error('Response body:', error.error); // Log the error body for debugging
      }
    );
  }

  listProducts() {
    this.service.getAllProducts().subscribe((data) => {
      this.products = data; // Assign all products to the array
    });
  }

  // Add to cart
  addToCart(theProduct: Product) {
    const theCartItem = new CartItem(theProduct);
    this.cartService.addToCart(theCartItem);
  }
}
