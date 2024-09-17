<template>
  <div class="container">
    <div class="row pt-5">
      <div class="col-md-1"></div>
      <div class="col-md-4 col-12">
        <img :src="product.url_image" :alt="product.title" class="img-fluid" />
      </div>
      <div class="col-md-6 col-12 pt-3 pt-md-0">
        <h4>{{ product.title }}</h4>
        <h6 class="font-weight-bold">{{ formatPrice(product.price) }} VND</h6>
        <p>
          {{ product.description }}
        </p>

        <div class="d-flex flex-row justify-content-between">
          <div class="input-group col-md-3 col-4 p-0">
            <div class="input-group-prepend">
              <span class="input-group-text" id="basic-addon1">Số lượng</span>
            </div>
            <input class="form-control" type="number" v-model="quantity" />
          </div>

          <div class="input-group col-md-3 col-4 p-0">
            <button
              type="button"
              id="add-to-cart-button"
              class="btn"
              @click="addToCart(this.id)"
            >
              Thêm vào giỏ hàng
              <ion-icon name="cart-outline" v-pre></ion-icon>
            </button>
          </div>
        </div>

        <div class="features pt-3">
          <h5><strong>Thông báo</strong></h5>
          <ul>
            <li>Sản phẩm được hoàn trả trong 5 ngày.</li>
            <li>Mọi thông tin liên hệ vh4h@gmail.com</li>
          </ul>
        </div>
        <button
          id="show-cart-button"
          type="button"
          class="btn mr-3 p-1 py-0"
          @click="showCart()"
        >
          Hiển thị giỏ hàng

          <ion-icon name="cart-outline" v-pre></ion-icon>
        </button>
      </div>
      <div class="col-md-1"></div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";
import {formatPrice} from "@/helper/helper";

export default {
  data() {
    return {
      product: {},
      category: {},
      id: null,
      token: null,
      isAddedToWishlist: false,
      quantity: 1,
    };
  },
  props: ["baseURL", "products"],
  methods: {
    addToCart(productId) {
      if (!this.token) {
        this.$router.push({name : 'Signin'});
      }
      if(this.quantity > this.product.warehouse){
        Swal.fire({
          text: "Số lượng sản phẩm cần mua lớn hơn số lượng sản phẩm trong kho, vui lòng chọn lại",
          icon: "error",
        });
      } else {
        axios({
          method: 'post',
          url: `${this.baseURL}cart/store`,
          data: JSON.stringify({
            product_id: productId,
            quantity: this.quantity,
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + localStorage.getItem('token')
          }
        }).then(
          (response) => {
            if (response.status === 200) {
              this.$emit("fetchData");
              this.$router.push({name : 'Cart'});
              Swal.fire({
                text: "Thêm sản phẩm thành công, theo dõi giỏ hàng của bạn",
                icon: "success",
              });
            }
          },
          (error) => {
            console.log(error);
          }
        );
      }
    },

    showCart() {
      this.$router.push("/cart");
    },

    formatPrice(value){
      return formatPrice(value);
    }
  },
  mounted() {
    this.id = this.$route.params.id;
    this.product = this.products.find((product) => product.id == this.id);
    this.token = localStorage.getItem("token");
  },
};
</script>

<style>
.category {
  font-weight: 400;
}

/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type="number"] {
  -moz-appearance: textfield;
}

#add-to-cart-button {
  background-color: #febd69;
}

#wishlist-button {
  background-color: #b9b9b9;
  border-radius: 0;
}

#show-cart-button {
  background-color: #131921;
  color: white;
  border-radius: 0;
}
</style>
