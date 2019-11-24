<script src="<?= base_url('assets/ckeditor/ckeditor.js') ?>"></script>
<h1><img src="<?= base_url('assets/imgs/shop-cart-add-icon.png') ?>" class="header-img" style="margin-top:-3px;"> Terbitkan Produk</h1>
<hr>
<?php
$timeNow = time();
if (validation_errors()) {
    ?>
    <hr>
    <div class="alert alert-danger"><?= validation_errors() ?></div>
    <hr>
<?php
}
if ($this->session->flashdata('result_publish')) {
    ?>
    <hr>
    <div class="alert alert-success"><?= $this->session->flashdata('result_publish') ?></div>
    <hr>
<?php
}
?>
<form method="POST" action="" enctype="multipart/form-data">
    <input type="hidden" value="<?= isset($_POST['folder']) ? $_POST['folder'] : $timeNow ?>" name="folder">
    <?php
    $i = 0;
    foreach ($languages as $language) {
        ?>
        <div class="locale-container locale-container-<?= $language->abbr ?>" <?= $language->abbr == MY_DEFAULT_LANGUAGE_ABBR ? 'style="display:block;"' : '' ?>>
            <input type="hidden" name="translations[]" value="<?= $language->abbr ?>">
            <div class="form-group">
                <label id="smallflag">Judul</label>
                <input type="text" name="title[]" value="<?= $trans_load != null && isset($trans_load[$language->abbr]['title']) ? $trans_load[$language->abbr]['title'] : '' ?>" class="form-control">
            </div>
            <div class="form-group">
                <label id="smallflag" for="description<?= $i ?>">Deskripsi</label>
                <textarea name="description[]" id="description<?= $i ?>" rows="50" class="form-control"><?= $trans_load != null && isset($trans_load[$language->abbr]['description']) ? $trans_load[$language->abbr]['description'] : '' ?></textarea>
                <script>
                    CKEDITOR.replace('description<?= $i ?>');
                    CKEDITOR.config.entities = false;
                </script>
            </div>
            <div class="form-group for-shop">
                <label id="smallflag">Harga</label>
                <input type="text" name="price[]" placeholder="contoh : 100000" value="<?= $trans_load != null && isset($trans_load[$language->abbr]['price']) ? $trans_load[$language->abbr]['price'] : '' ?>" class="form-control">
            </div>
            <div class="form-group for-shop">
                <label id="smallflag">Harga lama</label>
                <input type="text" name="old_price[]" placeholder="contoh : 100000" value="<?= $trans_load != null && isset($trans_load[$language->abbr]['old_price']) ? $trans_load[$language->abbr]['old_price'] : '' ?>" class="form-control">
            </div>
        </div>
    <?php
        $i++;
    }
    ?>
    <div class="form-group bordered-group">
        <?php
        if (isset($_POST['image']) && $_POST['image'] != null) {
            $image = 'attachments/shop_images/' . $_POST['image'];
            if (!file_exists($image)) {
                $image = 'attachments/no-image.png';
            }
            ?>
            <p>Current image:</p>
            <div>
                <img src="<?= base_url($image) ?>" class="img-responsive img-thumbnail" style="max-width:300px; margin-bottom: 5px;">
            </div>
            <input type="hidden" name="old_image" value="<?= $_POST['image'] ?>">
            <?php if (isset($_GET['to_lang'])) { ?>
                <input type="hidden" name="image" value="<?= $_POST['image'] ?>">
        <?php
            }
        }
        ?>
        <label for="userfile">Cover buku</label>
        <input type="file" id="userfile" name="userfile">
    </div>
    <div class="form-group bordered-group">
        <div class="others-images-container">
            <?= $otherImgs ?>
        </div>
        <a href="javascript:void(0);" data-toggle="modal" data-target="#modalMoreImages" class="btn btn-default">Upload gambar tambahan</a>
    </div>
    <div class="form-group for-shop">
        <label>Kategori</label>
        <select class="selectpicker form-control show-tick show-menu-arrow" name="shop_categorie">
            <?php foreach ($shop_categories as $key_cat => $shop_categorie) { ?>
                <option <?= isset($_POST['shop_categorie']) && $_POST['shop_categorie'] == $key_cat ? 'selected=""' : '' ?> value="<?= $key_cat ?>">
                    <?php
                        foreach ($shop_categorie['info'] as $nameAbbr) {
                            if ($nameAbbr['abbr'] == $this->config->item('language_abbr')) {
                                echo $nameAbbr['name'];
                            }
                        }
                        ?>
                </option>
            <?php } ?>
        </select>
    </div>
    <div class="form-group for-shop">
        <label>Kuantitas</label>
        <input type="text" placeholder="number" name="quantity" value="<?= @$_POST['quantity'] ?>" class="form-control" id="quantity">
    </div>
    <div class="form-group for-shop">
        <label>Jumlah halaman</label>
        <input type="text" placeholder="number" name="pages" value="<?= @$_POST['pages'] ?>" class="form-control" id="pages">
    </div>
    <div class="form-group for-shop">
        <label>Tanggal terbit</label>
        <input type="text" name="datePublish" value="<?= isset($_POST['datePublish']) ? @$_POST['datePublish'] : 'Choose'; ?>" class="form-control form_datetime " id="datePublish" readonly>
    </div>
    <div class="form-group for-shop">
        <label>ISBN</label>
        <input type="text" placeholder="ISBN" name="isbn" value="<?= @$_POST['isbn'] ?>" class="form-control" id="isbn">
    </div>
    <div class="form-group for-shop">
        <label>Penerbit</label>
        <input type="text" placeholder="Publisher" name="publisher" value="<?= @$_POST['publisher'] ?>" class="form-control" id="publisher">
    </div>
    <div class="form-group for-shop">
        <label>Berat</label>
        <input type="text" placeholder="kg" name="weight" value="<?= @$_POST['weight'] ?>" class="form-control" id="weight">
    </div>
    <div class="form-group for-shop">
        <label>Lebar</label>
        <input type="text" placeholder="cm" name="width" value="<?= @$_POST['width'] ?>" class="form-control" id="width">
    </div>
    <div class="form-group for-shop">
        <label>Panjang</label>
        <input type="text" placeholder="cm" name="length" value="<?= @$_POST['length'] ?>" class="form-control" id="length">
    </div>
    <div class="form-group for-shop">
        <label>Posisi</label>
        <input type="text" placeholder="Nomor posisi" name="position" value="<?= @$_POST['position'] ?>" class="form-control">
    </div>
    <button type="submit" name="submit" class="btn btn-lg btn-default btn-publish">Terbitkan</button>
    <?php if ($this->uri->segment(3) !== null) { ?>
        <a href="<?= base_url('admin/products') ?>" class="btn btn-lg btn-default">Batal</a>
    <?php } ?>
</form>
<!-- Modal Upload More Images -->
<div class="modal fade" id="modalMoreImages" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Upload more images</h4>
            </div>
            <div class="modal-body">
                <form id="uploadImagesForm">
                    <input type="hidden" value="<?= isset($_POST['folder']) ? $_POST['folder'] : $timeNow ?>" name="folder">
                    <label for="others">Select images</label>
                    <input type="file" name="others[]" id="others" multiple />
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default finish-upload">
                    <span class="finish-text">Finish</span>
                    <img src="<?= base_url('assets/imgs/load.gif') ?>" class="loadUploadOthers" alt="">
                </button>
            </div>
        </div>
    </div>
</div>