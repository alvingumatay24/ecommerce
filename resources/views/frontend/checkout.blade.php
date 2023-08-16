@extends('layouts.front')

@section('title')
   Checkout
@endsection

@section('content')
    <div class="py-3 mb-4 shadow-sm bg-warning border-top">
      <div class="container">
          <h6 class="mb-0">
            <a href="{{ url('/')}}" style="color:#fff">
               Home  /
            </a>
            <a href="{{ url('checkout')}}" style="color:#fff">
                Checkout
            </a>

          </h6>
      </div>
    </div>

     <div class="container mt-3">
        <form action="{{ url('place-order') }}" method="POST" enctype="multipart/form-data">
            {{ csrf_field() }}
           <div class="row">
                <div class="col-md-7">
                    <div class="card">
                         <div class="card-body">
                              <h6>Basic Details</h6>
                            <hr/>
                           <div class="row checkform-out">
                               <div class="col-md-6">
                                   <label for="">First Name</label>
                                   <input type="text" name="fname" value="{{ Auth::user()->name }}" class="form-control firstname" placeholder="Enter Your First Name">
                                   <span id="fname_error" class="text-danger"></span>
                                </div>
                              <div class="col-md-6">
                                   <label for="">Last Name</label>
                                   <input type="text" name="lname" value="{{ Auth::user()->lname }}" class="form-control lastname" placeholder="Enter Your Last Name">
                                   <span id="lname_error" class="text-danger"></span>
                              </div>
                              <div class="col-md-6">
                                   <label for="">Email</label>
                                   <input type="text" name="email" value="{{ Auth::user()->email }}" class="form-control email" placeholder="Enter Your  Email">
                                   <span id="email_error" class="text-danger"></span>
                              </div>
                              <div class="col-md-6">
                                  <label for="">Phone No</label>
                                  <input type="text" name="phone" value="{{ Auth::user()->phone }}" class="form-control phone" placeholder="Enter Your Phone No">
                                  <span id="phone_error" class="text-danger"></span>
                              </div>
                              <div class="col-md-6">
                                  <label for="">Address 1</label>
                                  <input type="text" name="address1" value="{{ Auth::user()->address1 }}" class="form-control address1" placeholder="Enter Your Address 1">
                                  <span id="address1_error" class="text-danger"></span>
                              </div>
                              <div class="col-md-6">
                                <label for="">Address 2</label>
                               <input type="text" name="address2" value="{{ Auth::user()->address2 }}" class="form-control address2" placeholder="Enter Your Address 2">
                               <span id="address2_error" class="text-danger"></span>
                              </div>

                              <div class="col-md-6">
                                <label for="">City</label>
                               <input type="text" name="city" value="{{ Auth::user()->city }}" class="form-control city" placeholder="Enter Your City">
                               <span id="city_error" class="text-danger"></span>
                              </div>
                              <div class="col-md-6">
                                <label for="">State</label>
                               <input type="text" name="state" value="{{ Auth::user()->state }}" class="form-control state" placeholder="Enter Your State">
                               <span id="state_error" class="text-danger"></span>
                              </div>
                              <div class="col-md-6">
                                <label for="">Country</label>
                               <input type="text" name="country" value="{{ Auth::user()->country }}" class="form-control country" placeholder="Enter Your Country">
                               <span id="country_error" class="text-danger"></span>
                              </div>
                              <div class="col-md-6">
                                <label for="">Pin Code</label>
                               <input type="text" name="pincode" value="{{ Auth::user()->pincode  }}" class="form-control pincode" placeholder="Enter Your Pin Code">
                               <span id="pincode_error" class="text-danger"></span>
                              </div>
                          </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="card">
                        @php $total = 0; @endphp
                        @if($cartitems->count() > 0)
                        <div class="card-body">
                            <h6> Order Details </h6>
                            <hr/>
                            <table class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th> Name</th>
                                        <th> Qty</th>
                                        <th> Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  @foreach ($cartitems as $item)
                                  <input type="hidden"   value="{{ $item->prod_id }}" class="prod_id" />
                                    @if( $item->products->qty >= $item->prod_qty )
                                    <tr>
                                         <td>{{ $item->products->name }}</td>
                                         <td>{{ $item->prod_qty }}</td>
                                         <td>{{ $item->products->selling_price }}</td>
                                    </tr>
                                    @php $total += $item->products->selling_price * $item->prod_qty; @endphp
                                    @else
                                <h6>Out of Stock</h6>
                            @endif
                                @endforeach
                                </tbody>
                                  <thead>
                                    <tr>
                                        <td>Total Price:</td>
                                        <td><input type="text" name="total_price" value="{{ $total }}" class="form-control" disabled="disabled"></td>
                                    </tr>
                                  </thead>
                            </table>
                               <hr/>
                               <input type="hidden" name="payment_mode" value="COD">
                              <button type="submit" class="btn btn-primary w-100"> Place Order | COD</button>
                              <button type="button" class="btn btn-success w-100 mt-3 rzp-button1">Pay with Razorpay</button>
                              <div id="paypal-button-container"></div>
                        </div>
                        {{-- @php $total += $item->products->selling_price * $item->prod_qty; @endphp --}}
                       @else
                    <div class="card-footer text-center">
                        <h3> No Products in Cart..</h3>

                    </div>
                 @endif
                    </div>
                </div>
           </div>
        </form>
     </div>
@endsection

@section('scripts')
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script data-sdk-integration-source="integrationbuilder_sc"></script>

<!-- <script src="https://www.paypal.com/sdk/js?client-id="></script> -->
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script src="https://www.paypal.com/sdk/js?client-id=Ae8mT3DESqbjlQkvOn0DdkqK396N8mkNJbcSo0E1NvRzvH4Ukx03YC_Jme17gEX5KLjQaTWRqRyicaK6"></script>
<script>
      paypal.Buttons({

        createOrder: function (data, actions)  {
            return actions.order.create({
                 purchase_units:[{
                    amount: {
                        value: '{{ $total }}'
                    }
                 }]
            });

        },
        onApprove: function(data, actions)  {

            var  firstname = $('.firstname').val();
            var  lastname  = $('.lastname').val();
            var  email     = $('.email').val();
            var  phone     = $('.phone').val();
             var  address1  = $('.address1').val();
             var  address2  = $('.address2').val();
             var  city      = $('.city').val();
             var  state     = $('.state').val();
             var  country   = $('.country').val();
             var  pincode   = $('.pincode').val();
            $.ajax({
                            method : "POST",
                            url: "http://localhost/ecommerce/public/place-order",
                            data: {
                                      'fname':firstname,
                                      'lname':lastname,
                                      'email':email,
                                      'phone':phone,
                                      'address1':address1,
                                      'address2':address2,
                                      'city':city,
                                      'state':state,
                                      'pincode':pincode,
                                      'payment_mode':"Paid by Paypal",
                                      'payment_id':details.id,

                            },
                            success: function (response) {
                                // alert(responseb.status);
                                swal(response.status)
                                .then((value)=>{
                                    window.location.href="http://localhost/ecommerce/public/place-order/my-orders";
                                })

                            }
                          });

        },
      }).render("#paypal-button-container");
  </script>
@endsection


