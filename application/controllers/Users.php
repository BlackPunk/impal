<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Users extends MY_Controller
{

    private $registerErrors = array();
    private $user_id;
    private $num_rows = 5;

    public function __construct()
    {
        parent::__construct();
        $this->load->library('email');
        $this->load->library('form_validation');
    }

    public function index()
    {
        show_404();
    }

    public function login()
    {
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email', [
            'valid_email' => 'Email tidak valid!'
        ]);
        $this->form_validation->set_rules('pass', 'Password', 'trim|required');

        if ($this->form_validation->run() == false) {
            $head = array();
            $data = array();
            $head['title'] = lang('user_login');
            $head['description'] = lang('user_login');
            $head['keywords'] = str_replace(" ", ",", $head['title']);
            $this->render('login', $head, $data);
        } else {
            $result = $this->Public_model->checkPublicUserIsValid($_POST);
            if ($result !== false) {
                $_SESSION['logged_user'] = $result; //id of user
                redirect(LANG_URL);
            } else {
                redirect(LANG_URL . '/login');
            }
        }
    }

    public function register()
    {
        $this->form_validation->set_rules('name', 'Nama', 'required|trim');
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[users_public.email]', [
            'is_unique' => 'Email sudah terdaftar!',
            'valid_email' => 'Email tidak valid!'
        ]);
        $this->form_validation->set_rules('phone', 'No handphone', 'required|trim');
        $this->form_validation->set_rules('pass', 'Kata sandi', 'required|trim');
        $this->form_validation->set_rules('pass_repeat', 'Kata sandi', 'required|trim|matches[pass]', [
            'matches' => 'Kata sandi tidak sama!'
        ]);

        if ($this->form_validation->run() == false) {
            $head = array();
            $data = array();
            $head['title'] = lang('user_register');
            $head['description'] = lang('user_register');
            $head['keywords'] = str_replace(" ", ",", $head['title']);
            $this->render('signup', $head, $data);
        } else {
            $_SESSION['logged_user'] = $this->Public_model->registerUser($_POST); //id of user
            redirect(LANG_URL);
        }
    }

    public function myaccount($page = 0)
    {
        $this->form_validation->set_rules('name', 'Nama', 'required|trim');
        $this->form_validation->set_rules('phone', 'No handphone', 'required|trim');
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email', [
            'valid_email' => 'Email tidak valid!',
        ]);
        if ($this->form_validation->run() != false) {
            $this->Public_model->updateProfile($_POST);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Update Sukses!</div>');
            redirect(LANG_URL . '/myaccount');
        }
        if ($_SESSION['logged_user']) {
            $head = array();
            $data = array();
            $head['title'] = lang('my_acc');
            $head['description'] = lang('my_acc');
            $head['keywords'] = str_replace(" ", ",", $head['title']);
            $data['userInfo'] = $this->Public_model->getUserProfileInfo($_SESSION['logged_user']);
            $rowscount = $this->Public_model->getUserOrdersHistoryCount($_SESSION['logged_user']);
            $data['orders_history'] = $this->Public_model->getUserOrdersHistory($_SESSION['logged_user'], $this->num_rows, $page);
            $data['links_pagination'] = pagination('myaccount', $rowscount, $this->num_rows, 2);
            $this->render('user', $head, $data);
        } else {
            redirect(LANG_URL . '/login');
        }
    }

    public function logout()
    {
        unset($_SESSION['logged_user']);
        redirect(LANG_URL);
    }
    // Untuk validasi manual
    private function registerValidate()
    {
        $errors = array();
        if (mb_strlen(trim($_POST['name'])) == 0) {
            $errors[] = lang('please_enter_name');
        }
        if (mb_strlen(trim($_POST['phone'])) == 0) {
            $errors[] = lang('please_enter_phone');
        }
        if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
            $errors[] = lang('invalid_email');
        }
        if (mb_strlen(trim($_POST['pass'])) == 0) {
            $errors[] = lang('enter_password');
        }
        if (mb_strlen(trim($_POST['pass_repeat'])) == 0) {
            $errors[] = lang('repeat_password');
        }
        if ($_POST['pass'] != $_POST['pass_repeat']) {
            $errors[] = lang('passwords_dont_match');
        }

        $count_emails = $this->Public_model->countPublicUsersWithEmail($_POST['email']);
        if ($count_emails > 0) {
            $errors[] = lang('user_email_is_taken');
        }
        if (!empty($errors)) {
            $this->registerErrors = $errors;
            return false;
        }
        $this->user_id = $this->Public_model->registerUser($_POST);
        return true;
    }
}
