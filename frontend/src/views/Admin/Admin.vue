<template>
  <div class="adminPanel container">
      <router-link :to="{name : 'AdminProduct'}">
        <button type="button" class="btn btn-primary btn-lg">Quản lý sản phẩm</button>
      </router-link>
  </div>
</template>

<script>
import {hasRole} from "@/helper/helper";
import {ADMIN, ADMIN_URL} from "@/constants";

export default {
  mounted() {
    window.location.href=ADMIN_URL;

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
  }
}
</script>

<style>
.adminPanel{
  display : flex;
  flex-direction: column;
  align-items: center;
}
.adminPanel button{
  font-size: 30px;
  width: fit-content;
  margin: 55px 0;
}
</style>