$(document).ready(function () {
    /// -add-to-cart ///
    $('.addToCartBtn').click(function (e){
          e.preventDefault();

          var product_id =  $(this).closest('.product_data').find('.prod_id').val();
          var product_qty =  $(this).closest('.product_data').find('.qty-input').val();
        //    alert(product_id);
        //    alert(product_qty);
          $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),

                          }
                     });

         $.ajax({
            method: "POST",
            url: "http://localhost/ecommerce/public/add-to-cart",
            dataType: 'json',
            data: {
                'product_id': product_id,
                'product_qty': product_qty,

            },
            success: function (response){
              swal(response.status);
              loadcart();
            }
          });

    });
   /// -add-to-wishlist ///
    $('.addToWishlist').click(function (e) {
        e.preventDefault();

        var product_id =  $(this).closest('.product_data').find('.prod_id').val();

        $.ajax({
            method: "POST",
            url: "http://localhost/ecommerce/public/add-to-wishlist",
            data: {
                'product_id': product_id,
            },
            success: function (response){
              swal(response.status);
              loadwishlist();
            }
          });
    });
    /// - increment btn - ///
        $(document).on('click','.increment-btn', function (e) {
        e.preventDefault();

        var inc_value = $(this).closest('.product_data').find('.qty-input').val();
        var value =  parseInt(inc_value, 10);
        value = isNaN(value) ? 0 : value;
        if (value < 10)
        {
             value++;
            $(this).closest('.product_data').find('.qty-input').val(value);
        }
    });
    /// -decrement btn - ///
    // $('.decrement-btn').click(function (e){
        $(document).on('click','.decrement-btn', function (e) {
        e.preventDefault();

        var dec_value = $(this).closest('.product_data').find('.qty-input').val();
        var value =  parseInt(dec_value, 10);
        value = isNaN(value) ? 0 : value;
        if (value > 1)
        {
          value--;
          $(this).closest('.product_data').find('.qty-input').val(value);
        }
    });

    loadcart();
    loadwishlist();

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),

                  }
             });
        /// -loadcart - ///
    function loadcart()
    {
       $.ajax({
        method: "GET",
        url: "http://localhost/ecommerce/public/load-cart-data",
        success: function (response) {
               $('.cart-count').html('');
               $('.cart-count').html(response.count);
                // console.log(response.count)
        }
       });
    }

    /// -loadwishlist - ///

    function loadwishlist()
    {
       $.ajax({
        method: "GET",
        url: "http://localhost/ecommerce/public/load-wishlist-count",
        success: function (response) {
               $('.wishlist-count').html('');
               $('.wishlist-count').html(response.count);
                // console.log(response.count)
        }
       });
    }
    /// -delete - ///
    //  $('.delete-cart-item').click( function(e){
        $(document).on('click','.delete-cart-item', function (e) {
        e.preventDefault();

         var prod_id  = $(this).closest('.product_data').find('.prod_id').val();
         $.ajax({
            method: "POST",
            url: "http://localhost/ecommerce/public/delete-cart-item",
            data: {
                'prod_id': prod_id,

            },
            dataType:'json',
            success: function (response){
                // window.location.reload();
                loadcart();
             $('.cartitems').load(location.href + " .cartitems");
              swal("", response.status, "success");
            }
          });
    });
    /// -remove-wishlist - ///
    // $('.remove-wishlist-item').click(function (e) {
        $(document).on('click','.remove-wishlist-item', function (e) {
        e.preventDefault();
        var prod_id  = $(this).closest('.product_data').find('.prod_id').val();
        $.ajax({
            method: "POST",
            url: "http://localhost/ecommerce/public/remove-wishlist-item",
            data: {
                'prod_id': prod_id,

            },
            dataType:'json',
            success: function (response){
                // window.location.reload();
                loadwishlist();
                $('.wishlistitems').load(location.href + " .wishlistitems");
              swal("", response.status, "success");
            }
          });
     });
    /// -changeQuantity - ///
        $(document).on('click','.changeQuantity', function (e) {
        e.preventDefault();
        var prod_id  = $(this).closest('.product_data').find('.prod_id').val();
        var qty =  $(this).closest('.product_data').find('.qty-input').val();
        data = {
            'prod_id' : prod_id,
            'prod_qty' : qty,
               }
        $.ajax({
            method: "POST",
            url: "update-cart",
            data: data,
            success: function (response) {
                $('.cartitems').load(location.href + " .cartitems");
            //    window.location.reload();
            }
        });
     });

});
