<div id="languages">
    <h1><img src="<?= base_url('assets/imgs/small-globe.png') ?>" class="header-img" style="margin-top:-3px;"> Bahasa</h1>
    <hr>
    <?php
    if (isset($writable)) {
        ?>
        <div class="alert alert-danger"><?= $writable ?></div>
    <?php
    }
    if (validation_errors()) {
        ?>
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
    if (!isset($writable)) {
        ?>
        <a href="javascript:void(0);" data-toggle="modal" data-target="#addLanguage" class="btn btn-primary btn-xs pull-right" style="margin-bottom:10px;"><b>+</b> Tambahkan bahasa baru</a>
        <div class="clearfix"></div>
    <?php
    }
    if ($languages) {
        ?>
        <div class="table-responsive">
            <table class="table table-striped custab">
                <thead>
                    <tr>
                        <th>#ID</th>
                        <th>Bendera</th>
                        <th>Singkatan</th>
                        <th>Nama</th>
                        <th>Mata Uang</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                </thead>
                <?php foreach ($languages as $language) { ?>
                    <tr>
                        <td><?= $language->id ?></td>
                        <td><img src="<?= base_url('attachments/lang_flags/' . $language->flag) ?>" alt="No country flag" style="width:16px; height:11px;"></td>
                        <td><?= strtoupper($language->abbr) ?></td>
                        <td><?= ucfirst($language->name) ?></td>
                        <td><?= $language->currency ?></td>
                        <td class="text-center">
                            <?php if (MY_DEFAULT_LANGUAGE_ABBR != $language->abbr) { ?>
                                <a href="<?= base_url('admin/languages/?delete=' . $language->id) ?>" class="btn btn-danger btn-xs confirm-delete"><span class="glyphicon glyphicon-remove"></span> Hapus</a>
                            <?php } else { ?>
                                Its default
                            <?php } ?>
                            <a href="<?= base_url('admin/languages/?editLang=' . $language->name) ?>" class="btn btn-info btn-xs"><span class="glyphicon glyphicon-pencil"></span> Edit</a>
                    </tr>
                <?php } ?>
            </table>
        </div>
    <?php } else { ?>
        <div class="clearfix"></div>
        <hr>
        <div class="alert alert-info">Tidak ada bahasa yang ditemukan!</div>
    <?php } ?>
    <div class="alert alert-warning">
        <b>Bagaimana cara menambahkan bahasa dalam 2 step mudah</b>
        <ul>
            <li>Tambahkan bahasa disini (atur singkatan, nama, dan bendera)</li>
            <li>Edit bahasa yang telah ditambahkan dan tetapkan isinya</li>
        </ul>
    </div>

    <?php
    if (isset($_GET['editLang'])) {
        ?>
        <form method="POST" id="saveLang">
            <input type="hidden" name="goDaddyGo" value="">
            <div class="alert alert-info"><span class="glyphicon glyphicon-alert"></span> Sekarang kamu mengedit bahasa: <b><?= ucfirst($_GET['editLang']) ?></b></div>
            <?php
                $o = 1;
                $countValuesForEdit = 0;
                foreach ($arrPhpFiles as $phpFile => $langFinal) {
                    if (!empty($langFinal)) {
                        foreach ($langFinal as $key => $val) {
                            ?>
                        <div class="divLangs">
                            <span><b><?= $o ?>.</b> <?= $val ?></span>
                            <input type="hidden" name="php_files[]" value="<?= $phpFile ?>">
                            <input type="hidden" name="php_keys[]" value="<?= $key ?>">
                            <input type="text" value="<?= $val ?>" class="form-control" name="php_values[]">
                        </div>
                    <?php
                                    $o++;
                                    $countValuesForEdit++;
                                }
                            }
                        }

                        foreach ($arrJsFiles as $jsFile => $langFinal) {
                            $i = 0;
                            foreach ($langFinal[1] as $aaIam) {
                                ?>
                    <div class="divLangs">
                        <span><b><?= $o ?>.</b> <?= $langFinal[2][$i] ?></span>
                        <input type="hidden" name="js_files[]" value="<?= $jsFile ?>">
                        <input type="hidden" name="js_keys[]" value="<?= trim(str_replace(':', '', $aaIam)) ?>">
                        <input type="text" class="form-control" value="<?= $langFinal[2][$i] ?>" name="js_values[]">
                    </div>
                <?php
                            $i++;
                            $o++;
                            $countValuesForEdit++;
                        }
                    }
                    if ($countValuesForEdit * 6 > $max_input_vars) {
                        ?>
                <div class="alert alert-danger">
                    You can't edit this language because the
                    server have restriction for <b>max_input_vars</b>, it must be more than
                    <b><?= $countValuesForEdit * 6 ?></b> and now is <b><?= $max_input_vars ?></b>.<br>
                    Please contact your system administrator.
                </div>
            <?php } else { ?>
                <a href="javascript:void(0);" data-form-id="saveLang" style="margin-left: 10px;" class="btn btn-lg btn-info confirm-save">Simpan</a>
            <?php } ?>
            <a href="<?= base_url('admin/languages') ?>" class="btn btn-lg btn-default">Batal</a>
        </form>
    <?php
    }
    ?>

    <!-- add edit languages -->
    <div class="modal fade" id="addLanguage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="" method="POST" enctype="multipart/form-data">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Tambah Bahasa</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="abbr">Singkatan</label>
                            <input type="text" name="abbr" class="form-control" id="abbr">
                        </div>
                        <div class="form-group">
                            <label for="name">Nama</label>
                            <input type="text" name="name" class="form-control" id="name">
                        </div>
                        <div class="form-group">
                            <label for="currency">Mata Uang</label>
                            <input type="text" name="currency" class="form-control" id="currency">
                        </div>
                        <div class="form-group">
                            <label class="control-label">Kode Mata Uang:</label>
                            <select class="selectpicker form-control" data-live-search="true" name="currencyKey">
                                <?php
                                $curr = currencies();
                                foreach ($curr as $key => $val) {
                                    ?>
                                    <option value="<?= $key ?>"><?= $key ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="file" name="userfile"">
                        </div>
                    </div>
                    <div class=" modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
                            <button type="submit" class="btn btn-primary">Simpan</button>
                        </div>
                </form>
            </div>
        </div>
    </div>
</div>