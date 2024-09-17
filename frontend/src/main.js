import { createApp } from 'vue'
import App from './App.vue'
import router from './router/index.js'

//using axios as a global object
window.axios = require('axios')

createApp(App).use(router).mount('#app');
