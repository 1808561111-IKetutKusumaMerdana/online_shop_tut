<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductApiController extends Controller
{
    public function index()
    {
        $products = Product::all();
        return response() -> json(['message' => 'success', 'data' => $products]);
    }

    public function show($id)
    {
        $product = Product::find($id);
        return response() -> json(['message' => 'succes show', 'data' => $product]);
    }

    public function store(Request $request)
    {
        // dd($request->all());
        $product = Product::create($request->all());
        return response() -> json(['message' => 'succes store', 'data' => $product]);
    }

    public function update(Request $request, $id)
    {
        // dd($request->all());
        $product = Product::find($id);
        $product -> update($request->all());
        return response() -> json(['message' => 'succes update', 'data' => $product]);
    }

    public function destroy($id)
    {
        $product = Product::find($id);
        $product -> delete();
        return response() -> json(['message' => 'succes update', 'data' => null]);
    }

}
