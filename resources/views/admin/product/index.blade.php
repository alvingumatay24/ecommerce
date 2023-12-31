@extends('layouts.admin')

@section('content')
      <div class="card">
          <div class="card-header">
             <h4>Product Page</h4>
          </div>
          <div class="card-body">
              <table class="table table-border table-striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Category</th>
                        <th>Name</th>
                        <th>Selling Price</th>
                        <th>Image</th>
                        <th>Action</th>
                    </tr>
                </thead>
                    <tbody>
                        @foreach ($products as  $item)
                        <tr>
                            <td>{{ $item->id }}</td>
                            <td>{{ $item->category->name }}</td>
                            <td>{{ $item->name }}</td>
                            <td>{{ $item->selling_price }}</td>
                            <td>
                                <img src="{{ asset('assets/uploads/products/'.$item->image)}}" class="image-category" alt="Image here">
                            </td>
                            <td>
                                <a href="{{ url('edit-prod/'.$item->id) }}" class="btn btn-success">Edit</a>
                                <a href="{{ url('delete-prod/'.$item->id) }}" class="btn btn-danger">Delete</a>
                            </td>
                           </tr>
                        @endforeach

                    </tbody>
                   </table>
         </div>
      </div>
@endsection
