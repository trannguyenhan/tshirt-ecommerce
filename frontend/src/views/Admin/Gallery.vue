<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h4 class="pt-3">Gallery</h4>
        <router-link id="add-image" :to="{name : 'AddImage'}">
          <button class="btn">Add a new Image</button>
        </router-link>
      </div>
    </div>

    <div class="row">
      <div v-for="image of images" :key="image.name" class="col-md-6 col-xl-4 col-12 pt-3  justify-content-around d-flex">
        <ImageBox :image="image"></ImageBox>
      </div>
    </div>
  </div>
</template>

<script>
import ImageBox from '../../components/Image/ImageBox.vue'
import {hasRole} from "@/helper/helper";
import {ADMIN} from "@/constants";
export default {
  name: 'Gallery',
  components : {ImageBox},
  data() {
      return {
          images : null,
      }
  },
  props : ["baseURL"],
  methods : {
    async fetchImages(){
      // fetch products
      await axios.get(this.baseURL + "image/listing/", {
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + localStorage.getItem('token')
        }
      })
        .then(res => this.images = res.data.data)
        .catch(err => console.log(err));
      console.log(this.images);
    }
  },
  mounted() {
    if (!localStorage.getItem('token')) {
      this.$router.push({name : 'Signin'});
    } else {
      let isAdmin = hasRole(ADMIN);
      isAdmin.then((res) => {
        console.log(res);
        if(!res){
          this.$router.push({name: "Home"});
        }
      });
    }
    this.fetchImages();
  }
}
</script>

<style scoped>
h4 {
  font-family: 'Roboto', sans-serif;
  color: #484848;
  font-weight: 700;
}

#add-image {
  float: right;
  font-weight: 500;
}
</style>
