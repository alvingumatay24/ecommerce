@extends('layouts.front')

@section('title')
   My Orders
@endsection

@section('content')
     <div class="container">
        <div class="row">
            <div class="col-md-12">
              <div class="card">
                  <div class="card-header bg-primary">
                       <h4 class="text-white">My Order
                         <a href="{{url('my-orders')}}" class="btn  btn-warning float-end">Back</a>
                       </h4>
                  </div>
                  <div class="card-body">
                     <div class="row">
                         <div class="col-md-6">
                               <label for="">First Name</label>
                                <div class="border pt-2"> {{ $orders->fname}}</div>
                                <label for="">Last Name</label>
                                <div class="border pt-2"> {{ $orders->lname}}</div>
                                <label for="">Email</label>
                                <div class="border pt-2"> {{ $orders->email}}</div>
                                <label for="">Contact No.</label>
                                <div class="border pt-2"> {{ $orders->phone}}</div>
                                <label for="">Shipping Address</label>
                                <div class="border pt-2">
                                 {{ $orders->address1}},
                                 {{ $orders->address2}},
                                 {{ $orders->city}},
                                 {{ $orders->state}},
                                 {{ $orders->country}},
                                </div>
                                <label for="">Zip Code</label>
                                <div class="border pt-2"> {{ $orders->pincode}}</div>
                         </div>
                         <div class="col-md-6">
                            <table class=" table table-bordered">
                                <thead>
                                 <tr>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Image</th>
                                 </tr>
                                </thead>
                                <tbody>
                                     @foreach ($orders->orderitems as $item)
                                            <tr>
                                                <td>{{ $item->products->name}}</td>
                                                <td>{{ $item->qty }}</td>
                                                <td>{{ $item->price }}</td>
                                                <td>
                                                      <img src="{{ asset('assets/uploads/products/'.$item->products->image ) }}" width="50px" alt="Product Image">
                                                </td>
                                            </tr>
                                      @endforeach
                                </tbody>
                            </table>
                            <h4 class="px-2">Grand Total Orders: <span>&#8369;</span> {{  $orders->total_price }}.00</h4>
                            <h6 class="px-2">Payment Mode:  {{  $orders->payment_mode }}</h6>
                        </div>
                     </div>

                  </div>
              </div>

            </div>
        </div>
     </div>
@endsection
