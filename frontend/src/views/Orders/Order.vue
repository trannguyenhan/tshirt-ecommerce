<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h4 class="pt-3">Các sản phẩm đã mua</h4>
      </div>
    </div>
    <!--        for each order display -->
    <div v-for="order in orderList" :key="order.pid" class="row mt-2 pt-3 justify-content-around">
      <div class="col-2"></div>
      <div class="col-md-3 embed-responsive embed-responsive-16by9">
        <!--                display image in left-->
        <img v-bind:src="order.imageURL" class="w-100 card-img-top embed-responsive-item">
      </div>
      <div class="col-md-5 px-3">
        <div class="card-block px-3">
          <h6 class="card-title">
            ID đơn hàng: {{order.id}}
          </h6>
          <p class="mb-0">Số lượng: {{order.totalItems}} chiếc</p>
          <p id="item-price" class="mb-0 font-weight-bold">Tổng tiền : {{ formatPrice(order.totalCost) }} VND</p>
          <p id="item-total-price">Ngày mua : {{order.orderdate}}</p>
          <p id="item-total-price" >Trạng thái : {{ order.status }}</p>
        </div>
      </div>
      <div class="col-2"></div>
      <div class="col-12"><hr></div>
    </div>
  </div>

</template>

<script>
  import {formatPrice} from "@/helper/helper";

  const axios = require('axios')
  export default {

    data() {
      return {
        token: null,
        orderList : []
      }
    },
    props:["baseURL"],
    name: 'Order',
    methods: {
      // list of order histories
      listOrders(){
        axios.get(`${this.baseURL}bill/listing?order`, {
          'headers': {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + localStorage.getItem('token')
          }
        }).then((response) => {
              if(response.status === 200){
                this.orders = response.data.data

                // for each order populate orderList
                this.orders.forEach((order) => {
                  order.detail_bills.forEach((detailBill) => {
                    this.orderList.push({
                      id: detailBill.id,
                      totalCost: detailBill.price,
                      orderdate: new Date(detailBill.created_at).toLocaleDateString(),
                      imageURL: detailBill.products.url_image,
                      totalItems: detailBill.quantity,
                      status: order.status==='pending'? "Chờ xác nhận" : order.status==='delivering'? "Đang vận chuyển" : "Đã giao hàng",
                      color: order.status==='pending'? "darkgreen" : order.status==='delivering'? "chocolate" : "crimson"
                    })
                  })
                })
              }
            },
            (error)=>{
              console.log(error)
            });
      },

      formatPrice(value){
        return formatPrice(value);
      }
    },
    mounted() {
      this.token = localStorage.getItem("token");
      this.listOrders();
    },
  };

</script>

<style scoped>
  h4, h5 {
    font-family: 'Roboto', sans-serif;
    color: #484848;
    font-weight: 700;
  }

  .embed-responsive .card-img-top {
    object-fit: cover;
  }
</style>
