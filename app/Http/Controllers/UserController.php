<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Api\BaseController as BaseController;
use Validator;

class UserController extends Controller
{

	public function adduser(Request $request)
	{
		$Name=$request->input('Name');
		$Address=$request->input('Address');
		$DOB=$request->input('DOB');
		$result=DB::select('call sproc_adduser(?,?,?)',[$Name,$Address,$DOB]);

		return response()->json(['User'=>$result,'status'=>200]);
	}


	public function addfather(Request $request)
	{
		$User_Id=$request->input('User_Id');
		$Name=$request->input('Name');
		$Age=$request->input('Age');
		$DOB=$request->input('DOB');
		$result=DB::select('call pro_add_father(?,?,?,?)',[$User_Id,$Name,$Age,$DOB]);

		return response()->json(['AddFather'=>$result,'status'=>200]);
	}


	public function addmother(Request $request)
	{
		$User_Id=$request->input('User_Id');
		$Name=$request->input('Name');
		$Age=$request->input('Age');
		$DOB=$request->input('DOB');
		$result=DB::select('call pro_add_mother(?,?,?,?)',[$User_Id,$Name,$Age,$DOB]);

		return response()->json(['AddMother'=>$result,'status'=>200]);
	}


	public function Ulist(Request $request)
	{
		
		$result=DB::select('call pro_list_show()');

		return response()->json(['UserList'=>$result,'status'=>200]);
	}


	public function familylist(Request $request)
	{
		$result=DB::select('call pro_family_list()');

		return response()->json(['UsersFamilyList'=>$result,'status'=>200]);
	}

	public function userlist(Request $request)
	{
		$DOB=$request->input('DOB');
		$result=DB::select('call pro_user_list(?)',[$DOB]);

		return response()->json(['mstruserlist'=>$result,'status'=>200]);
	}

	public function images(Request $request)

     {
        //$response = array();
         $this->validate($request, [
            'img' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:1024',
         ]);
     	
           $name =$request->img->getClientOriginalName();
        $request->img->move(public_path('img/profile'), $name);
        $response['error']=false;
        $response['message']='Image uploaded';
        $response['name']=$name;
        $response['url']='http://192.168.43.110/myfirstlaravelproject/public/img/profile'.$name;
        return response()->json(['Response'=>$response]);
    }


    public function testimage(Request $request)
    {
    	$this->validate($request,[
    		'img'=>'required|image|mimes:jpeg,png,jpg,gif,svg|max:1024',
    	]);
    	$name=$request->img->getClientOriginalName();
    	$request->img->move(public_path('img/newprofile'),$name);
    	$response['error']=false;
    	$response['message']='Image Uploaded';
    	$response['name']=$name;
    	$response['url']='http://192.168.43.110/myfirstlaravelproject/public/img/newprofile'.$name;
    	return response()->json(['Response'=>$response]);
    }
}