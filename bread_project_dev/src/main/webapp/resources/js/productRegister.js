        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('product_img1').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }