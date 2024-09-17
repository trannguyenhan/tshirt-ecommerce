<template>
  <div class="card h-100 w-100">
    <div class="embed-responsive embed-responsive-16by9">
      <img
        class="card-img-top embed-responsive-item"
        :src="product.url_image"
        alt="Product Image"
      />
    </div>
    <div class="card-body">
      <router-link :to="{ name: 'ShowDetails', params: { id: product.id } }"><h5 class="card-title">{{ product.title }}</h5></router-link>
      <p class="card-text">{{ formatPrice(product.price) }}<sup>VND</sup></p>
      <p class="card-text font-italic">
        {{ product.description.substring(0, 65) }}...
      </p>
      <router-link
        id="edit-product"
        :to="{ name: 'EditProduct', params: { id: product.id } }"
        v-show="$route.name == 'AdminProduct'"
      >
        Chỉnh sửa
      </router-link>
    </div>
  </div>
</template>

<script>
import {formatPrice} from "@/helper/helper";

export default {
  name: "ProductBox",
  props: ["product"],
  methods: {
    showDetails() {
      this.$router.push({
        name: "ShowDetails",
        params: { id: this.product.id },
      });
    },
    formatPrice(value) {
      return formatPrice(value);
    }
  },
};
</script>

<style scoped>
.embed-responsive .card-img-top {
  object-fit: cover;
}

a {
  text-decoration: none;
}

.card-title {
  color: #484848;
  font-size: 1.1rem;
  font-weight: 400;
}

.card-title:hover {
  font-weight: bold;
}

.card-text {
  font-size: 0.9rem;
}

#edit-product {
  float: right;
}
</style>
