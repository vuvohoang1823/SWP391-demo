/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const toggleSubnav = document.querySelector(".subnav-toggle")
const subnav = document.querySelector(".subnav")
const triangle = document.querySelector(".triangle")

toggleSubnav.addEventListener('click', function(){
    subnav.style.display = subnav.style.display === 'none' ? 'block' : 'none'
    triangle.style.display = triangle.style.display === 'none' ? 'block' : 'none'
})