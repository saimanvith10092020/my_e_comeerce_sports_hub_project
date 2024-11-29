import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Product } from '../common/product';
import { map } from 'rxjs/operators';
import { ProductCategory } from '../common/product-category';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ProductService {
  baseUrl = 'http://localhost:8181/api/products';

  categoryUrl = 'http://localhost:8181/api/product-category';

  constructor(private http: HttpClient) {}

  getProductList(theCategoryId: number) {
    let searchUrl =
      'http://localhost:8181/api/products/search/findByCategoryId?id=' +
      theCategoryId;

    return this.http
      .get<GetResponseProducts>(searchUrl)
      .pipe(map((response) => response._embedded.products));
  }

  getProductCategories() {
    return this.http
      .get<GetResponseProductCategory>(this.categoryUrl)
      .pipe(map((response) => response._embedded.productCategory));
  }

  searchProducts(theKeyword: string) {
    let searcProductUrl =
      'http://localhost:8181/api/products/search/findByNameContaining?name=' +
      theKeyword;

    return this.http
      .get<GetResponseProducts>(searcProductUrl)
      .pipe(map((response) => response._embedded.products));
  }

  getProduct(theProductId: number) {
    let productDetailsUrl = 'http://localhost:8181/api/products/' + theProductId;

    return this.http.get<Product>(productDetailsUrl);
  }

  getAllProducts(): Observable<Product[]> {
    let AllproductDetailsUrl = 'http://localhost:8181/api/products';

    return this.http.get<Product[]>(AllproductDetailsUrl);
  }
}

interface GetResponseProducts {
  _embedded: {
    products: Product[];
  };
}

interface GetResponseProductCategory {
  _embedded: {
    productCategory: ProductCategory[];
  };
}
