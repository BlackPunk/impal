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
                <h1><?= lang('login_to_acc') ?></h1><br>
                <?= $this->session->flashdata('message'); ?>
                <form method="POST" action="" class="text-center border border-light p-5">
                    <div class="form-group">
                        <input type="text" name="email" class="form-control mb-4" placeholder="Email" value="<?= set_value('email') ?>">
                        <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <input type="password" name="pass" class="form-control mb-4" placeholder="Password">
                        <?= form_error('pass', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                    <button class="btn btn-danger btn-block my-4 login loginmodal-submit" type="submit" name="login" value="<?= lang('login') ?>">Sign in</button>

                    <!-- Register -->
                    <p>Bukan member?
                        <a href="<?= LANG_URL . '/register' ?>"><?= lang('register') ?></a>
                    </p>
                </form>
                <!-- Default form login -->
            </div>
        </div>
    </div>
</div>