<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h4 class="pt-3">Add a new Image</h4>
      </div>
    </div>

    <div class="row">
      <div class="col-3"></div>
      <div class="col-md-6 px-5 px-md-0 pt-5">
        <div class="form-group">
          <label for="myfile">Select image :</label>
          <input type="file" id="myfile" class="form-control-file" @change="onFileSelected">
        </div>
        <button type="button" class="btn btn-info" @click="onUpload">Upload</button>
      </div>
      <div class="col-3"></div>
    </div>
  </div>
</template>

<script>
import Swal from 'sweetalert2';
import {hasRole} from "@/helper/helper";
import {ADMIN} from "@/constants";

export default {
    data(){
        return {
            selectedFile : null
        }
    },
    props : ["baseURL"],
    methods : {
        onFileSelected(event){
            //this will always update the selected file whenever user changes files
            this.selectedFile = event.target.files[0];
        },
        async onUpload(){
            if(!this.selectedFile) {
                await Swal.fire({
                  text: "Select a file first",
                  icon: "warning",
                  closeOnClickOutside: false,
                });
                return;
            }
            if(this.selectedFile.type !== "image/jpeg" && this.selectedFile.type !== "image/png" &&
               this.selectedFile.type !== "image/jpg") {
                //file format is not correct
                await Swal.fire({
                  text: "Select a image/jpeg file!",
                  icon: "error",
                  closeOnClickOutside: false,
                });
                return;
            }
            const formData = new FormData();
            formData.append('image', this.selectedFile);

            await axios({
                method: 'post',
                url: this.baseURL + "image/store/",
                data : formData,
                headers: {
                  'Content-Type': 'application/json',
                  'Authorization': 'Bearer ' + localStorage.getItem('token')
                }
            })
            .then(res => {
                this.$router.push({name : "Gallery"});
                Swal.fire({
                    text: "Image Added Successfully!",
                    icon: "success",
                    closeOnClickOutside: false,
                });
            })
            .catch(err => console.log(err))
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
