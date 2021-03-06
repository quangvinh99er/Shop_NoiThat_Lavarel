<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Slide;
use App\ProductType;
use App\Product;
use App\News;
use App\Cart;
use App\Customer;
use App\Bills;
use App\BillsDetail;
use App\User;
use Session;
use Auth;

class PageController extends Controller
{

	public function __construct()
	{
		$slide = Slide::all();
		view()->share('slide',$slide);

		$menu = ProductType::all();
		view()->share('menu',$menu);
	}

    public function home()
    {
    	$newproduct = Product::where('new',1)->take(8)->get();
    	$topproduct = Product::where('promotion_price','>',0)->take(8)->get();
    	return view('page.home',['newproduct'=>$newproduct,'topproduct'=>$topproduct]);
    }

    public function getLoaiSanPham($id)
    {
    	$category = ProductType::find($id);
    	$product = Product::where('id_type',$id)->paginate(9);
    	return view('page.loaisanpham',['category'=>$category,'product'=>$product]);
    }

    public function getSanPham($id)
    {
    	$product = Product::find($id);
    	$same_pro = Product::where('id_type',$product->id_type)->take(3)->get();
    	$new_pro = Product::where('new',1)->take(5)->get();
    	$best_seller = Product::where('promotion_price','>',0)->take(5)->get();
    	return view('page.sanpham',['product'=>$product,'same_pro'=>$same_pro,'new_pro'=>$new_pro,'best_seller'=>$best_seller]);
    }

    public function get404()
    {
    	return view('page.404');
    }

    public function getNews()
    {
    	$news = News::all();
    	return view('page.news',['news'=>$news]);
    }

    public function detailnews($id)
    {
    	$tintuc = News::find($id);
    	$tincungloai = News::where('id','!=',$id)->take(4)->get();
    	return view('page.detailnews',['tintuc'=>$tintuc,'tincungloai'=>$tincungloai]);
    }

    public function getContact()
    {
    	return view('page.contact');
    }

    public function getLogin()
    {
    	return view('page.login');
    }

    public function postLogin(Request $request)
    {
    	$this->validate($request,[
    			'email'=>'required|email',
    			'password'=>'required|min:3|max:100',
    		],[
    			'email.required'=>'B???n ch??a nh???p Email',
    			'email.email'=>'Email ch??a ????ng ?????nh d???ng',
    			'password.required'=>'B???n ch??a nh???p m???t kh???u',
    			'password.min'=>'M???t kh???u ph???i t??? 3 k?? t??? tr??? l??n',
    			'password.max'=>'M???t kh???u t???i ??a 100 k?? t???',
    		]);

    	if(Auth::attempt(['email'=>$request->email,'password'=>$request->password]))
    	{
    		return redirect('home');
    	}
    	else
    	{
    		return redirect('dangnhap')->with('thongbao','T??i kho???n ho???c m???t kh???u kh??ng ch??nh x??c');
    	}
    }

    public function getDangKy()
    {
    	return view('page.dangky');
    }

    public function postDangKy(Request $request)
    {
    	$this->validate($request,[
    			'full_name'=>'required|min:3|max:100',
    			'email'=>'required|email|unique:users,email',
    			'password'=>'required|min:3|max:100',
    			'passwordAgain'=>'required|same:password',
    		],[
    			'full_name.required'=>'B???n ch??a nh???p h??? t??n',
    			'full_name.min'=>'H??? t??n ph???i t??? 3 k?? t??? tr??? l??n',
    			'full_name.max'=>'H??? t??n t???i ??a 100 k?? t???',
    			'email.required'=>'B???n ch??a nh???p email',
    			'email.email'=>'Email ch??a ????ng ?????nh d???ng',
    			'email.unique'=>'Email ???? t???n t???i',
    			'password.required'=>'B???n ch??a nh???p m???t kh???u',
    			'password.min'=>'M???t kh???u ph???i t??? 3 k?? t??? tr??? l??n',
    			'password.max'=>'M???t kh???u t???i ??a 100 k?? t???',
    			'passwordAgain.required'=>'B???n ch??a nh???p l???i m???t kh???u',
    			'passwordAgain.same'=>'Nh???p l???i m???t kh???u ch??a tr??ng kh???p',
    		]);

    	$user = new User;
    	$user->full_name = $request->full_name;
    	$user->email = $request->email;
    	$user->address = $request->address;
    	$user->phone = $request->phone;
    	$user->password = bcrypt($request->password);
    	$user->save();
    	Auth::attempt(['email'=>$request->email,'password'=>$request->password]);
    	return redirect('home');
    }

    public function getLogout()
    {
    	Auth::logout();
    	return redirect('home');
    }

    public function getPricing()
    {
    	return view('page.pricing');
    }

    public function getCart()
    {
    	return view('page.giohang');
    }

    public function addCart(Request $request, $id)
    {
    	$product = Product::find($id);
    	$oldcart = Session('cart')?Session::get('cart'):null;
    	$cart = new Cart($oldcart);
    	$cart->add($product,$id);
    	$request->session()->put('cart',$cart);
    	return redirect()->back();
    }

    public function delCart($id)
    {
    	$oldcart = Session('cart')?Session::get('cart'):null;
    	$cart = new Cart($oldcart);
    	$cart->removeItem($id);
    	if(count($cart->items) > 0)
    	{
    		Session::put('cart',$cart);
    	}
    	else
    	{
    		Session::forget('cart');
    	}
    	return redirect()->back();
    }

    public function getCheckout()
    {
    	return view('page.checkout');
    }

    public function saveCart(Request $request)
    {
    	$this->validate($request,[
    			'name'=>'required|min:3|max:100',
    			'gender'=>'required',
    			'address'=>'required|min:3',
    			'phone'=>'required|min:3',
    			'email'=>'required|email',
    			'payment'=>'required',
    		],[
    			'name.required'=>'B???n ch??a nh???p h??? t??n',
    			'name.min'=>'H??? t??n ph???i t??? 3 k?? t??? tr??? l??n',
    			'name.max'=>'H??? t??n t???i ??a 100 k?? t???',
    			'gender.required'=>'B???n ch??a ch???n gi???i t??nh',
    			'address.required'=>'B???n ch??a nh???p ?????a ch???',
    			'address.min'=>'?????a ch??? ph???i t??? 3 k?? t??? tr??? l??n',
    			'phone.required'=>'B???n ch??a nh???p s??? ??i???n tho???i',
    			'phone.min'=>'S??? ??i???n tho???i ph???i t??? 3 k?? t??? tr??? l??n',
    			'email.required'=>'B???n ch??a nh???p ?????a ch??? email',
    			'email.email'=>'Email ch??a ????ng ?????nh d???ng',
    			'payment.required'=>'B???n ch??a ch???n ph????ng th???c thanh to??n',
    		]);

    	$cart = Session::get('cart');
    	$customer = new Customer;
    	$customer->name = $request->name;
    	$customer->gender = $request->gender;
    	$customer->email = $request->email;
    	$customer->address = $request->address;
    	$customer->phone = $request->phone;
    	$customer->note = $request->note;
    	$customer->save();

    	$bill = new Bills();
    	$bill->id_customer = $customer->id;
    	$bill->date_order = date('Y-m-d');
    	$bill->total = $cart->totalPrice;
    	$bill->payment = $request->payment;
    	$bill->note = $request->note;
    	$bill->save();

    	foreach ($cart->items as $key => $value) {
    		$billdetal = new BillsDetail;
    		$billdetal->id_bill = $bill->id;
    		$billdetal->id_product = $key;
    		$billdetal->quantity = $value['qty'];
    		$billdetal->unit_price = $value['price']/$value['qty'];
    		$billdetal->save();
    	}
    	Session::forget('cart');
    	return redirect('home');
    }

    public function postSearch(Request $request)
    {
    	$this->validate($request,[
    			'tukhoa'=>'required',
    		],[
    			'tukhoa.required'=>'B???n ch??a nh???p n???i dung t??m ki???m',
    		]);

    	$product = Product::where('name','like','%'.$request->tukhoa.'%')->orWhere('description','like','%'.$request->tukhoa.'%')->orWhere('content','like','%'.$request->tukhoa.'%')->get();
    	return view('page.search',['product'=>$product,'tukhoa'=>$request->tukhoa]);
    }

}
