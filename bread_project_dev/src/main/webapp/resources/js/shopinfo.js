function execDaumPostcode() {
            new daum.Postcode( {
                oncomplete: function (data) {
                    document.getElementById('bakery_postcode').value = data.zonecode;
                    document.getElementById('bakery_address').value = data.address;
                    document.getElementById('bakery_detail_address').focus();
                }
            }).open();
        }