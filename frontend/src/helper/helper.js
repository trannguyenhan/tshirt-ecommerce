import {BASE_URL} from "@/constants";

export async function hasRole(role) {
    let isRole = false;
    await axios({
        method: 'post',
        url: BASE_URL + "auth/me",
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + localStorage.getItem('token')
        }
    }).then((res) => res.data.data.roles[0].name)
        .then((irole) => {
            if(irole === role){
                isRole = true;
            }
        });

    return isRole;
}

export function formatPrice(value) {
    let val = (value/1).toFixed(2).replace('.', ',')
    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
}