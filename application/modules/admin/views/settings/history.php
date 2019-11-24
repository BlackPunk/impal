<h1><img src="<?= base_url('assets/imgs/timer.png') ?>" class="header-img" style="margin-top:-3px;">Histori</h1>
<hr>
<?php if ($history === false) { ?>
    <div class="alert alert-danger">Histori distop! Pergi ke config.php dan setel <b>admin_history</b> ke <b>TRUE</b></div>
<?php } ?>
<div class="table-responsive">
    <table class="table table-condensed table-bordered table-striped custab">
        <thead>
            <tr>
                <th>Pengguna</th>
                <th>Aksi</th>
                <th>Waktu</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if ($actions->result()) {
                foreach ($actions->result() as $action) {
                    ?>
                    <tr>
                        <td><?= $action->username ?></td>
                        <td><?= $action->activity ?></td>
                        <td><?= date('H:i:sa / d-m-Y', $action->time) ?></td>
                    </tr>
                <?php
                    }
                } else {
                    ?>
                <tr>
                    <td colspan="3">No history found!</td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
</div>
<?= $links_pagination ?>