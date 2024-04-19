const navbar_burger = document.querySelector(".navbar-burger");
const navbar_menu = document.querySelector(".navbar-menu");
const html = document.querySelector("html")
const is_overflow = html.classList.contains("overflow-hidden");
// funcionalidade de aparecer o menu
navbar_burger.onclick= () =>{
    navbar_burger.classList.toggle("is-active")
    navbar_menu.classList.toggle("hero")    
    navbar_menu.classList.toggle("is-active")
    navbar_menu.classList.toggle("is-fullheight")
    if(!is_overflow){
        html.classList.toggle("overflow-hidden")

    } 
}