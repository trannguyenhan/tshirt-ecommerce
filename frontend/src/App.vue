<template>
  <Navbar
    :cartCount="cartCount"
    @resetCartCount="resetCartCount"
    v-if="!['Signup', 'Signin'].includes($route.name)"
    @search="search"
  />
  <div style="min-height: 60vh">
    <router-view
      v-if="products"
      :baseURL="baseURL"
      :products="products"
      @fetchData="fetchData"
    >
    </router-view>
  </div>
  <Footer v-if="!['Signup', 'Signin'].includes($route.name)" />
</template>

<script>
import Navbar from './components/Navbar.vue';
import Footer from './components/Footer.vue';
import {BASE_URL} from "@/constants";
import axios from "axios";

export default {
  data() {
    return {
      baseURL: BASE_URL,
      products: null,
      key: 0,
      token: null,
      cartCount: 0,
      keywordSearch: ""
    };
  },

  components: { Footer, Navbar },
  methods: {
    async fetchData() {
      // fetch products
      await axios
        .get(this.baseURL + 'product/listing?keyword=' + this.keywordSearch)
        .then((res) => res.data.data)
        .then((data) => {
          this.products = data;
        })
        .catch((err) => console.log(err));

      //fetch cart items
      if (this.token) {
        await axios({
          method: 'post',
          url: `${this.baseURL}auth/me`,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + localStorage.getItem('token')
          }
        }).then(
          (response) => {
            if (response.status === 200) {
              this.cartCount = Object.keys(response.data.data.cart).length;
            }
          },
          (error) => {
            console.log(error);
          }
        );
      }
    },
    resetCartCount() {
      this.cartCount = 0;
    },
    search(keyword){
      this.keywordSearch = keyword;
      this.fetchData();
    }
  },
  mounted() {
    this.token = localStorage.getItem('token');
    this.fetchData();
  },
};
</script>

<style>
html {
  overflow-y: scroll;
}
</style>
