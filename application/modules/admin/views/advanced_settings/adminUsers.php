<div id="users">
    <h1><img src="<?= base_url('assets/imgs/admin-user.png') ?>" class="header-img" style="margin-top:-3px;"> Admin</h1>
    <hr>
    <?php if (validation_errors()) { ?>
        <hr>
        <div class="alert alert-danger"><?= validation_errors() ?></div>
        <hr>
    <?php
    }
    if ($this->session->flashdata('result_add')) {
        ?>
        <hr>
        <div class="alert alert-success"><?= $this->session->flashdata('result_add') ?></div>
        <hr>
    <?php
    }
    if ($this->session->flashdata('result_delete')) {
        ?>
        <hr>
        <div class="alert alert-success"><?= $this->session->flashdata('result_delete') ?></div>
        <hr>
    <?php
    }
    ?>
    <a href="javascript:void(0);" data-toggle="modal" data-target="#add_edit_users" class="btn btn-primary btn-xs pull-right" style="margin-bottom:10px;"><b>+</b> Add new user</a>
    <div class="clearfix"></div>
    <?php
    if ($users->result()) {
        ?>
        <div class="table-responsive">
            <table class="table table-striped custab">
                <thead>
                    <tr>
                        <th>#ID</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Email</th>
                        <th>Pemberitahuan</th>
                        <th>Login Terakhir</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                </thead>
                <?php foreach ($users->result() as $user) { ?>
                    <tr>
                        <td><?= $user->id ?></td>
                        <td><?= $user->username ?></td>
                        <td><b>*****</b></td>
                        <td><?= $user->email ?></td>
                        <td><?= $user->notify ?></td>
                        <td><?= date('d.m.Y - H:i:s', $user->last_login) ?></td>
                        <td class="text-center">
                            <div>
                                <a href="?delete=<?= $user->id ?>" class="confirm-delete">Hapus</a>
                                <a href="?edit=<?= $user->id ?>">Edit</a>
                            </div>
                        </td>
                    </tr>
                <?php } ?>
            </table>
        </div>
    <?php } else { ?>
        <div class="clearfix"></div>
        <hr>
        <div class="alert alert-info">Tidak ada pengguna yang ditemukan!</div>
    <?php } ?>

    <!-- add edit users -->
    <div class="modal fade" id="add_edit_users" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="" method="POST" enctype="multipart/form-data">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Tambah admin</h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="edit" value="<?= isset($_GET['edit']) ? $_GET['edit'] : '0' ?>">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" name="username" value="<?= isset($_POST['username']) ? $_POST['username'] : '' ?>" class="form-control" id="username">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" name="password" class="form-control" value="" id="password">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="text" name="email" class="form-control" value="<?= isset($_POST['email']) ? $_POST['email'] : '' ?>" id="email">
                        </div>
                        <div class="form-group">
                            <label for="notify">Pemberitahuan</label>
                            <input type="text" name="notify" class="form-control" value="<?= isset($_POST['notify']) ? $_POST['notify'] : '' ?>" placeholder="Dapatkan pemberitahuan melalui email: 1 / 0 (ya atau tidak)" id="notify">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
                        <input type="submit" class="btn btn-primary" value="Simpan">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    <?php if (isset($_GET['edit'])) { ?>
        $(document).ready(function() {
            $("#add_edit_users").modal('show');
        });
    <?php } ?>
</script>