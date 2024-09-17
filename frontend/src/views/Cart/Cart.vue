<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h3 class="pt-3">Giỏ hàng của bạn</h3>
      </div>
    </div>
    <!--    loop over all the cart items and display one by one-->
    <div
      v-for="cartItem in cartItems"
      :key="cartItem.id"
      class="row mt-2 pt-3 justify-content-around"
    >
      <div class="col-2"></div>
      <!-- display image -->
      <div class="col-md-3 embed-responsive embed-responsive-16by9">
        <router-link
          :to="{ name: 'ShowDetails', params: { id: cartItem.id } }"
        >
          <img
            v-bind:src="cartItem.url_image"
            class="w-100 card-img-top embed-responsive-item"
            :alt="cartItem.description"
          />
        </router-link>
      </div>
       {{ cartItem.title }}
      <div class="col-md-5 px-3">
        <div class="card-block px-3">
          <h6 class="card-title">
            <router-link
              :to="{ name: 'ShowDetails', params: { id: cartItem.id } }"
              >{{ cartItem.name }}
            </router-link>
          </h6>
          <p id="item-price" class="mb-0 font-weight-bold">
            {{ formatPrice(cartItem.price)}} VNĐ / chiếc
          </p>
          <p id="item-quantity" class="mb-0">
            Số lượng :
            <input
              size="1"
              class="p-0 h-25 border-bottom border-top-0 border-left-0 border-right-0"
              v-model="cartItem.pivot.quantity"
            />
          </p>
          <p id="item-total-price" class="mb-0">
            Đơn giá:
            <span class="font-weight-bold">
              {{ formatPrice(cartItem.price * cartItem.pivot.quantity) }} VNĐ</span
            >
          </p>
          <br /><a href="#" class="text-right" @click="deleteItem(cartItem.id)"
            >Xóa sản phẩm khỏi giỏ hàng</a
          >
        </div>
      </div>
      <div class="col-2"></div>
      <div class="col-12"><hr /></div>
    </div>

    <!-- display total price -->
    <div class="total-cost pt-2 text-right">
      <h5>Tổng tiền : {{ formatPrice(totalcost.toFixed(2)) }} VNĐ</h5>
      <button
        type="button"
        class="btn btn-primary confirm"
        @click="hiddenInfo"
      >
        Thông tin đặt hàng
      </button>
      &nbsp;&nbsp;
      <button
        :disabled="isDisabled()"
        type="button"
        class="btn btn-primary confirm"
        @click="checkout"
      >
        Xác nhận đơn hàng
      </button>
    </div>
    <div>
      <div id="myDIV" style="display: none">
        <table id="customers">
          <tr>
            <th>Email</th>
            <th>{{this.me.email}}</th>
          </tr>
          <tr>
            <th>Tên đăng nhập</th>
            <th>{{this.me.username}}</th>
          </tr>
          <tr>
            <th>Tên</th>
            <th>{{this.me.name}}</th>
          </tr>
          <tr>
            <th>Phương thức thanh toán</th>
            <th>Thanh toán bằng tiền mặt khi nhận hàng</th>
          </tr>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import Swal from "sweetalert2";
import {formatPrice} from "@/helper/helper";

const axios = require('axios');
export default {
  data() {
    return {
      cartItems: [],
      token: null,
      totalcost: 0,
      me: []
    };
  },
  name: 'Cart',
  props: ['baseURL'],
  methods: {
    hiddenInfo() {
      let x = document.getElementById("myDIV");
      if (x.style.display === "none") {
        x.style.display = "block";
      } else {
        x.style.display = "none";
      }
    },
    isDisabled() {
      if (this.cartItems.length === 0) {
        return true;
      }
      return false;
    },
    // fetch all the items in cart
    async listCartItems() {
      await axios({
        method: 'post',
        url: `${this.baseURL}auth/me`,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + localStorage.getItem('token')
        }
      }).then(
        (response) => {
          this.me = response.data.data;
          return this.me;
        }
      ).then(
        (data) => (data.cart)
      ).then(
        (cart) => {
          this.cartItems = cart;
          console.log(this.cartItems);
          for(let i=0; i<this.cartItems.length; i++){
            this.totalcost += this.cartItems[i].price;
          }
        }
      );
    },
    // go to checkout page
    checkout() {
      let dataBody = [];
      for(let i=0; i<this.cartItems.length; i++){
        if(this.cartItems[i].pivot.quantity > this.cartItems[i].warehouse){
          Swal.fire({
            text: "Số lượng sản phẩm cần mua lớn hơn số lượng sản phẩm trong kho, vui lòng chọn lại",
            icon: "error",
          });
          return;
        }

        dataBody.push({
          product_id: this.cartItems[i].id,
          quantity: this.cartItems[i].pivot.quantity
        })
      }

      axios({
        method: 'post',
        url: `${this.baseURL}bill/store`,
        data: JSON.stringify({products: dataBody}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + localStorage.getItem('token')
        }
      }).then((response) => {
        if(response.status === 200){
          this.$router.push({name: "Order"});
        }
        // delete all cart when create bill
        axios({
          method: 'post',
          url: `${this.baseURL}cart/delete-all`,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + localStorage.getItem('token')
          }
        });
        this.$emit("fetchData");
      });
    },
    deleteItem(itemId) {
      axios({
        method: 'post',
        url: `${this.baseURL}cart/delete`,
        data: JSON.stringify({product_id: itemId}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + localStorage.getItem('token')
        }
      }).then(
          (response) => {
            if (response.status === 200) {
              this.$router.go(0);
            }
            this.$emit('fetchData');
          },
          (error) => {
            console.log(error);
          }
        );
    },
    showDetails(productId) {
      this.$router.push({
        name: 'ShowDetails',
        params: { id: productId },
      });
    },
    formatPrice(value){
      return formatPrice(value);
    }

  },
  mounted() {
    if (!localStorage.getItem('token')) {
      this.$router.push({name : 'Signin'});
    }

    this.token = localStorage.getItem('token');
    this.listCartItems();
  },
};
</script>

<style scoped>
h4,
h5 {
  font-family: 'Roboto', sans-serif;
  color: #484848;
  font-weight: 700;
}

.embed-responsive .card-img-top {
  object-fit: cover;
}

#item-price {
  color: #232f3e;
}

#item-quantity {
  float: left;
}

#item-total-price {
  float: right;
}

.confirm {
  font-weight: bold;
  font-size: larger;
}

#myDIV {
  width: 100%;
  padding: 50px 0;
  margin-top: 20px;
}

#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
}
</style>
