<!doctype html>
<html lang="{{ str_replace('_', '_', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>
        @yield('title')
    </title>

    <link rel="apple-touch-icon" sizes="76x76" href="{{ asset('assets/img/apple-icon.png') }}">
    <link rel="icon" type="image/png" href="{{ asset('assets/img/favicon.png') }}">
    <title>{{ config('app.name', 'Ecommerce') }}</title>

   <link rel="stylesheet" href="{{ asset('assets/css/owl.carousel.min.css')}}">
   <link rel="stylesheet" href="{{ asset('assets/css/owl.theme.default.min.css')}}">
   <link href="{{ asset('font-awesome-4.7.0/css/font-awesome.css') }}" rel="stylesheet">
   <link rel="stylesheet" href="{{ asset('assets/css/css3.css')}}">

   <link href="{{ asset('css/custom.css') }}" rel="stylesheet">
   {{-- <script src="{{ asset('assets/js/jquery-3.2.1.slim.min.js')}}"></script> --}}
      <script src="{{ asset('assets/js/jquery.slim.min.js')}}"></script>
   <script src="{{ asset('assets/js/popper.min.js')}}"></script>
   <script src="{{ asset('assets/js/bootstrap.min.js')}}"></script>
   <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min2.css')}}">
   <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css')}}">
   <link rel="stylesheet" href="{{ asset('assets/css/jquery-ui.css')}}">
   <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <!-- Styles -->

     <!-- Font Awesome Icons -->

  <link href="{{ asset('font-awesome-4.7.0/css/font-awesome.css')}}" rel="stylesheet">

     <!-- Font Awesome Icons -->
  <style>
    /* Make the image fully responsive */
    .carousel-inner img {
      width: 100%;
      height: 380px;
    }
    a {
        text-decoration: none !important;
    }
    </style>
</head>
<body class="g-sidenav-show  bg-gray-200">
   @include('layouts.inc.frontnavbar')
<div class="content">
    @yield('content')
</div>

   <div class="chatto">
     <a href="https://wa.me/+639273134016?text=I'm%20interested%20in%20your%20car%20for%20sale" target="_blank"> <img src="{{ asset('assets/images/phone.png')}}" alt="whatsapp-logo" width="80px" height="80px"></a>
   </div>

<script src="{{ asset('assets/js/jquery.min.js') }}"></script>
<script src="{{ asset('assets/js/jquery-3.6.0.min.js') }}"></script>
<script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('assets/js/owl.carousel.min.js') }}"></script>
<script src="{{ asset('assets/js/custom.js') }}"></script>
<script src="{{ asset('assets/js/checkout.js') }}"></script>
<script src="{{ asset('assets/js/sweetalert.min.js') }}"></script>
<script src="{{ asset('assets/js/jquery-ui.js') }}"></script>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
    var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
    (function(){
    var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
    s1.async=true;
    s1.src='https://embed.tawk.to/64d3019fcc26a871b02e2208/1h7c3slr9';
    s1.charset='UTF-8';
    s1.setAttribute('crossorigin','*');
    s0.parentNode.insertBefore(s1,s0);
    })();
    </script>
    <!--End of Tawk.to Script-->
<script>
      var availableTags = [ ];
     $.ajax({
        method: "GET",
        url: "http://localhost/ecommerce/public/product-list",
        success: function (response) {
            startAutoComplete(response)
        }
     });
     function startAutoComplete(availableTags)
     {
        $("#search_product").autocomplete({
        source: availableTags
      });
     }
    </script>

    @if(session('status'))
         <script>
            swal("{{ session('status')}}");
         </script>
    @endif
    @yield('scripts')
</body>

</html>
