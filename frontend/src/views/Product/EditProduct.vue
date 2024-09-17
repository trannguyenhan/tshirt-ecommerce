<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h4 class="pt-3">Edit Product</h4>
      </div>
    </div>

    <div class="row">
      <div class="col-3"></div>
      <div class="col-md-6 px-5 px-md-0">
        <form v-if="product">
          <div class="form-group">
            <label>Tiêu đề</label>
            <input type="text" class="form-control" v-model="product.title" required>
          </div>
          <div class="form-group">
            <label>Mô tả</label>
            <input type="text" class="form-control" v-model="product.description" required>
          </div>
          <div class="form-group">
            <label>Link ảnh sản phẩm</label>
            <input type="url" class="form-control" v-model="product.url_image" required>
          </div>
          <div class="form-group">
            <label>Giá</label>
            <input type="number" class="form-control" v-model="product.price" required>
          </div>
          <div class="form-group">
            <label>Size</label>
            <select class="form-control" v-model="product.size" required>
              <option
                v-for="(isize,i) of sizes"
                :key="i"
                :value="isize"
                v-if="isize !== product.size? 'selected' : ''"
              >
                {{ isize }}
              </option>
            </select>
          </div>
          <div class="form-group">
            <label>Chất liệu</label>
            <select class="form-control" v-model="product.material" required>
              <option
                v-for="(imaterial,i) of materials"
                :key="i"
                :value="imaterial"
                v-if="imaterial !== product.material? 'selected' : ''"
              >
                {{ imaterial }}
              </option>
            </select>
          </div>
          <div class="form-group">
            <label>Số lượng hàng</label>
            <input type="number" class="form-control" min="0" v-model="product.warehouse">
          </div>
          <button type="button" class="btn btn-primary" @click="editProduct">Submit</button>
          <br />
          <br />
          <button type="button" class="btn btn-primary" @click="deleteProduct">Xóa</button>
        </form>
      </div>
      <div class="col-3"></div>
    </div>
  </div>
</template>

<script>
import Swal from 'sweetalert2';

export default {
  data(){
    return {
      product: null,
      sizes: ["L", "M", "XL", "S"],
      materials: ["Decal", "In phản quang", "Cotton", "Polo", "Sweater","So mi" ]
    }
  },
  props : ["baseURL", "products"],
  methods : {
    async editProduct() {
      await axios({
        method: 'post',
        url: this.baseURL+"product/update/",
        data : JSON.stringify(this.product),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + localStorage.getItem('token')
        }
      }).then(res => {
        //sending the event to parent to handle
        this.$emit("fetchData");
        this.$router.push({name : 'AdminProduct'});
        Swal.fire({
          text: "Cập nhật tài khoản thành công",
          icon: "success",
          closeOnClickOutside: false,
        });
      })
      .catch(err => {
        Swal.fire({
          text: "Cập nhật sản phẩm thất bại, vui lòng điền đầy đủ thông tin",
          icon: "error",
          closeOnClickOutside: false,
        });
      });
    },
    async deleteProduct(){
      Swal.fire({
        title: 'Bạn có muốn xóa sản phẩm này',
        showDenyButton: true,
        showCancelButton: true,
        confirmButtonText: 'Xóa',
        denyButtonText: `Quay lại`,
      }).then((result) => {
        if (result.isConfirmed) {
          axios({
            method: 'post',
            url: this.baseURL+"product/delete/",
            data : JSON.stringify({id: this.product.id}),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ' + localStorage.getItem('token')
            }
          }).then((res) => {
            this.$router.push({name : 'AdminProduct'});
            Swal.fire('Xóa thành công!', '', 'success');
          }).catch((err) => {
            Swal.fire('Không thể xóa sản phẩm này', '', 'info')
          })

        } else if (result.isDenied) {

        }
      })
    }
  },
  mounted() {
    if (!localStorage.getItem('token')) {
      this.$router.push({name : 'Signin'});
      return;
    }
    this.id = this.$route.params.id;
    this.product = this.products.find(product => product.id == this.id);
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
