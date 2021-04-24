<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
        	'full_name'=>'nguyenhoangkhuong',
        	'email'=>'admin@gmail.com',
        	'password'=>bcrypt('123456'),
        	'phone'=>'0367543124',
        	'quyen'=>'1',
        	'address'=>'TP.HCM',
        	'remember_token'=>'',
        	'created_at'=>new Datetime(),
        	'updated_at'=>new Datetime(),

        ];
        DB::table('users')->insert($data); 
    }
}
