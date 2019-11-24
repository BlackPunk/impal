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
                    <div class="form-group">
                        <!-- name -->
                        <input type="text" name="name" class="form-control" placeholder="Name">
                    </div>

                    <!-- E-mail -->
                    <div class="form-group">
                        <input type="text" class="form-control mb-4" placeholder="E-mail" name="email">
                    </div>

                    <!-- Phone number -->
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Phone number" name="phone">
                    </div>
                    <!-- Password -->
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Password" name="pass">
                    </div>
                    <!-- Repeat Password -->
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Password repeat" name="pass_repeat">
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