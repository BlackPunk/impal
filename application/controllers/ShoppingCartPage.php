<?php

defined('BASEPATH') or exit('No direct script access allowed');

class ShoppingCartPage extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->Model('Public_model');
    }

    public function index()
    {
        $data = array();
        $head = array();
        $head['title'] = 'Keranjang belanja';
        $head['description'] = 'Bukes, toko buku online';
        $head['keywords'] = str_replace(" ", ",", $head['title']);
        $this->render('shopping_cart', $head, $data);
    }
}
