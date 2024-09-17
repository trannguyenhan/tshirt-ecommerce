<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h4 class="pt-3">Thêm sản phẩm mới</h4>
      </div>
    </div>

    <div class="row">
      <div class="col-3"></div>
      <div class="col-md-6 px-5 px-md-0">
        <form>
          <div class="form-group">
            <label>Tiêu đề</label>
            <input type="text" class="form-control" v-model="title" required>
          </div>
          <div class="form-group">
            <label>Mô tả</label>
            <input type="text" class="form-control" v-model="description" required>
          </div>
          <div class="form-group">
            <label>Link ảnh sản phẩm</label>
            <input type="url" class="form-control" v-model="urlImage" required>
          </div>
          <div class="form-group">
            <label>Giá</label>
            <input type="number" class="form-control" v-model="price" required>
          </div>
          <div class="form-group">
            <label>Size</label>
            <select class="form-control" v-model="size" required>
              <option v-for="(isize,i) of sizes" :key="i" :value="isize">{{ isize }}</option>
            </select>
          </div>
          <div class="form-group">
            <label>Chất liệu</label>
            <select class="form-control" v-model="material" required>
              <option v-for="(imaterial,i) of materials" :key="i" :value="imaterial">{{ imaterial }}</option>
            </select>
          </div>
          <div class="form-group">
            <label>Số lượng hàng</label>
            <input type="number" class="form-control" min="0" v-model="warehouse">
          </div>
          <button type="button" class="btn btn-primary" @click="addProduct">Submit</button>
        </form>
      </div>
      <div class="col-3"></div>
    </div>
  </div>
</template>

<script>
import {hasRole} from "@/helper/helper";
import {ADMIN} from "@/constants";
import Swal from 'sweetalert2';

export default {
  data(){
    return {
      id : null,
      title : null,
      urlImage : null,
      description : null,
      size : null,
      material: null,
      price: null,
      sizes: ["L", "M", "XL", "S"],
      materials: ["Decal", "In phản quang", "Cotton", "Polo", "Sweater","So mi" ],
      warehouse: null
    }
  },
  props : ["baseURL", "products"],
  methods : {
    async addProduct() {
      const newProduct = {
        id : this.id,
        title : this.title,
        description : this.description,
        url_image : this.urlImage,
        price : this.price,
        size: this.size,
        material: this.material,
        warehouse: this.warehouse
      }

      await axios({
        method: 'post',
        url: this.baseURL+"product/store",
        data : JSON.stringify(newProduct),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + localStorage.getItem('token')
        }
      })
      .then(res => {
        if(res.status === 200){
          //sending the event to parent to handle
          this.$emit("fetchData");
          this.$router.push({name : 'AdminProduct'});
          Swal.fire({
            text: "Thêm sản phẩm thành công",
            icon: "success",
          });
        } else {
          Swal.fire({
            text: "Thêm sản phẩm vào giỏ hàng thất bại, vui lòng thử lại",
            icon: "error",
          });
        }
      })
      .catch(err => {
        Swal.fire({
          text: "Thêm sản phẩm thất bại, vui lòng điền đầy đủ thông tin",
          icon: "error",
        });
      });
    }
  },
  mounted() {
    if (!localStorage.getItem('token')) {
      this.$router.push({name : 'Signin'});
    } else {
      let isAdmin = hasRole(ADMIN);
      isAdmin.then((res) => {
        if(!res){
          this.$router.push({name: "Home"});
        }
      })
    }
  }
}
</script>

<style scoped>
h4 {
  font-family: 'Roboto', sans-serif;
  color: #484848;
  font-weight: 700;
}

</style>
