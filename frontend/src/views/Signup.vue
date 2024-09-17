<template>
  <div class="container">
    <!--    Logo Div-->
    <div class="row">
      <div class="col-12 text-center pt-3">
        <router-link :to="{ name: 'Home' }">
          <img id="logo" src="../assets/icon.png" />
        </router-link>
      </div>
    </div>

    <div class="row">
      <div class="col-12 justify-content-center d-flex flex-row pt-5">
        <div id="signup-div" class="flex-item border">
          <h2 class="pt-4 pl-4">Tạo tài khoản mới</h2>
          <form @submit="signup" class="pt-4 pl-4 pr-4">
            <div class="form-group">
              <label>Email</label>
              <input
                type="email"
                class="form-control"
                v-model="email"
                required
              />
            </div>
            <div class="form-group">
              <label>Username</label>
              <input
                type="text"
                class="form-control"
                v-model="username"
                required
              />
            </div>
            <div class="form-row">
              <div class="col">
                <div class="form-group">
                  <label>Tên</label>
                  <input
                    type="name"
                    class="form-control"
                    v-model="firstName"
                    required
                  />
                </div>
              </div>
              <div class="col">
                <div class="form-group">
                  <label>Họ</label>
                  <input
                    type="name"
                    class="form-control"
                    v-model="lastName"
                    required
                  />
                </div>
              </div>
            </div>
            <div class="form-group">
              <label>Mật khẩu</label>
              <input
                type="password"
                class="form-control"
                v-model="password"
                required
              />
            </div>
            <div class="form-group">
              <label>Nhập lại mật khẩu</label>
              <input
                type="password"
                class="form-control"
                v-model="passwordConfirm"
                required
              />
            </div>
            <button type="submit" class="btn btn-primary mt-2 py-0">
              Tạo tài khoản
            </button>
          </form>
          <hr />
          <small class="form-text text-muted pt-2 pl-4 text-center"
            >Bạn đã có tài khoản chưa?</small
          >
          <p class="text-center">
            <router-link
              class="btn btn-dark text-center mx-auto px-5 py-1 mb-2"
              :to="{ name: 'Signin' }"
              >Đăng nhập ở đây</router-link
            >
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Swal from 'sweetalert2';

export default {
  name: "Signup",
  props: ["baseURL"],
  data() {
    return {
      email: null,
      firstName: null,
      lastName: null,
      password: null,
      passwordConfirm: null,
      username: null
    };
  },
  methods: {
    async signup(e) {
      e.preventDefault();
      // if the password matches
      if (this.password === this.passwordConfirm) {
        // make the post body
        const user = {
          email: this.email,
          name: this.firstName + this.lastName,
          password: this.password,
          username: this.username
        };

        // call the API
        await axios
          .post(`${this.baseURL}auth/register`, user)
          .then(() => {
            // redirect to home page
            this.$router.replace("/signin");
            Swal.fire({
              text: "Đăng kí thành công, xin lời đăng nhập",
              icon: "success",
              closeOnClickOutside: false,
            });
          })
          .catch((err) => {
            console.log(err);
          });
      } else {
        // passwords are not matching
        await Swal.fire({
          text: "Lỗi! mật khẩu không khớp!",
          icon: "error",
          closeOnClickOutside: false,
        });
      }
    },
  },
};
</script>

<style scoped>
.btn-dark {
  background-color: #e7e9ec;
  color: #000;
  font-size: smaller;
  border-radius: 0;
  border-color: #adb1b8 #a2a6ac #a2a6ac;
}

.btn-primary {
  background-color: #f0c14b;
  color: black;
  border-color: #a88734 #9c7e31 #846a29;
  border-radius: 0;
}

#logo {
  width: 150px;
}

@media only screen and (min-width: 992px) {
  #signup-div {
    width: 40%;
  }
}
</style>
