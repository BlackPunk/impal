<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>
<div class="inner-nav">
    <div class="container">
        <a href="<?= LANG_URL ?>"><?= lang('home') ?></a> <span class="active"> > <?= lang('user_login') ?></span>
    </div>
</div>
<div class="container user-page">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
            <div class="loginmodal-container">
                <h1><?= lang('user_register') ?></h1><br>
                <!-- Default form register -->
                <form class="text-center border border-light p-5" method="POST" action="">
                    <!-- name -->
                    <div class="form-group">
                        <input type="text" name="name" class="form-control" placeholder="Nama" value="<?= set_value('name') ?>">
                        <?= form_error('name', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>

                    <!-- E-mail -->
                    <div class="form-group">
                        <input type="text" class="form-control mb-4" placeholder="E-mail" name="email" value="<?= set_value('email') ?>">
                        <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>

                    <!-- Phone number -->
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="No handphone" name="phone" value="<?= set_value('phone') ?>">
                        <?= form_error('phone', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                    <!-- Password -->
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Kata sandi" name="pass">
                        <?= form_error('pass', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                    <!-- Repeat Password -->
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Ulangi kata sandi" name="pass_repeat">
                        <?= form_error('pass_repeat', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>

                    <!-- Sign up button -->
                    <button class="btn btn-danger my-4 btn-block login loginmodal-submit" name="signup" type="submit"><?= lang('register_me') ?></button>

                    <!-- Register -->
                    <p>Sudah ada akun?
                        <a href="<?= LANG_URL . '/login' ?>"><?= lang('login') ?></a>
                    </p>

                </form>
                <!-- Default form register -->
            </div>
        </div>
    </div>
</div>