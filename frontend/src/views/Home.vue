<template>
  <div id="home">
    <div id="background-div" class="page-holder bg-cover">
      <div class="container py-5">
        <header class="text-left text-white py-5">
          <h3 class="mb-4 rounded">Bắt đầu mua sắm tại trung tâm VH4H</h3>
          <p id="content" class="lead mb-0 bg-dark p-1 rounded">Thời trang VH4H – Phong cách và phong cách</p>
        </header>
      </div>
    </div>

    <hr>
    <div class="container">
      <div class="row">
        <div class="col-12 text-left">
          <h2 class="pt-3">Sản phẩm phổ biến</h2>
        </div>
      </div>
      <div class="row">
        <div v-for="index in this.productSize" :key="index" class="col-md-6 col-xl-4 col-12 pt-3  justify-content-around d-flex">
          <ProductBox :product="products[index-1]">
          </ProductBox>
        </div>
      </div>

      <div v-for="category in categories">
        <div class="row">
          <div class="col-12 text-left">
            <h2 class="pt-3">{{ category.name }}</h2>
          </div>
        </div>
        <div class="row">
          <div v-for="index in category.products.length" :key="index" class="col-md-6 col-xl-4 col-12 pt-3  justify-content-around d-flex">
            <ProductBox :product="category.products[index-1]">
            </ProductBox>
          </div>
        </div>
        <br />
      </div>

      <div class="row">
        <div class="col-12 text-left">
          <h2 class="pt-3">Thương hiệu</h2>
        </div>
      </div>
      <div id="list-brand">
        <div class="row" v-for="brand in brands">
          <img :src="brand.image" :alt="brand.name"/>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import ProductBox from "../components/Product/ProductBox";
import axios from "axios";
import ImageBox from "@/components/Image/ImageBox";
export default {
  name: 'Home',
  components : {ImageBox, ProductBox},
  props : ["baseURL", "products"],
  data(){
    return{
      productSize:0,
      categories: [],
      brands: []
    }
  },
  async mounted() {
    this.productSize = this.products.length;
    this.productSize = Math.min(3, this.productSize);

    await axios
        .get(this.baseURL + 'category/listing')
        .then((res) => res.data.data)
        .then((data) => {
          this.categories = data;
        })
        .catch((err) => console.log(err));

    this.categories = this.categories.filter(function (item){
      return item.products.length !== 0;
    });

    await axios
        .get(this.baseURL + 'brand/listing')
        .then((res) => res.data.data)
        .then((data) => {
          this.brands = data;
        })
        .catch((err) => console.log(err));
  }
}
</script>

<style>
.page-holder {
  min-height: 50vh;
}

.bg-cover {
  background-size: cover !important;
}

#background-div {
  background: url(../assets/home.png);
}

#content {
  opacity: 0.8;
}

h2 {
  font-family: 'Josefin Sans', sans-serif;
}

#list-brand{
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

#list-brand img {
  max-height: 10vh;
}
</style>
