function runtime(){
            slide();
            requestAnimationFrame(runtime);
        }
        function slide(){
            for(let i = 1;i<6;i++){
                var shop = document.getElementById("shop"+i);
                shop.style.marginLeft = parseInt(shop.style.marginLeft)+1+"px";
                if(parseInt(shop.style.marginLeft)>2300){
                    shop.style.marginLeft = "-200px";
                }
            }
        }
        runtime();