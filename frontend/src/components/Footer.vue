<template>
  <footer>
    <div class="container pt-5">
      <div class="row">
        <div class="col-md-3 col-6">
          <ul style="list-style-type: none">
            <li class="text-light font-weight-bold pb-2">Về chúng tôi</li>
            <li><a class="footer-link font-weight-light" href="#">Liên lạc</a></li>
            <li><a class="footer-link font-weight-light" href="#">Android App</a><br></li>
            <li><a class="footer-link font-weight-light" href="#">iOS App</a><br></li>
          </ul>
        </div>

        <div class="col-md-3 col-6">
          <ul style="list-style-type: none">
            <li class="text-light font-weight-bold">Kết nối với chúng tôi</li>
            <li><a class="footer-link font-weight-light" href="#">Facebook</a></li>
            <li><a class="footer-link font-weight-light" href="#">Twitter</a><br></li>
            <li><a class="footer-link font-weight-light" href="#">Instagram</a><br></li>
          </ul>
        </div>

        <div class="col-md-3 col-6">
          <ul style="list-style-type: none">
            <li class="text-light font-weight-bold">Kiếm tiền với chúng tôi</li>
            <li><a class="footer-link font-weight-light" href="#">Bán hàng cùng chúng tôi</a></li>
            <li><a class="footer-link font-weight-light" href="#">Trở thành Affiliate</a><br></li>
            <li><a class="footer-link font-weight-light" href="#">Quảng cáo cho sản phẩm</a><br></li>
          </ul>
        </div>

        <div class="col-md-3 col-6">
          <ul style="list-style-type: none">
            <li class="text-light font-weight-bold">Trợ giúp</li>
            <li><a class="footer-link font-weight-light" href="#">Trung tâm trợ giúp</a></li>
            <li><a class="footer-link font-weight-light" href="#">100% bảo vệ mua hàng</a><br></li>
            <li><a class="footer-link font-weight-light" href="#">App Download</a><br></li>
          </ul>
        </div>
      </div>

      <div class="row">
        <div class="col-12">
          <div class="text-center py-5">
            <img id="logo" src="../assets/icon.png" />
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  name : "Footer"
}
</script>

<style>
footer {
  margin-top : 100px;
  background-color:#232F3E;
  font-size:16px;
}

li {
  padding-left: 0;
  padding-bottom: 10px;
}

a {
  text-decoration: none;
}

.footer-link {
  color: #DDD;
}

#logo {
  width: 150px;
}

footer {
  font-family: 'Roboto', sans-serif;
}


</style>
