# apl_osis

_Deskripsi_

# Usage

## Akses file

**File yang bisa di akses oleh user ada dalam ``` ./htdocs/ ```**

File akan di akses sesuai URL yang di tuliskan
Contoh:
> http://host/home/index
Maka akan mengakses file
``` ./htdocs/home/index.php ```

> file ./htdocs di atas bukan merupakan bagian dari XAMPP

## Mengirim data lewat URL

> http://host/home/index/1/2/3
URL diatas akan mengakses file
``` ./htdocs/home/index.php ```
Dengan mengirim data array
```php 
$url = ['1', '2', '3']
```
> Data bisa di akses langsung dalam file yang di akses

## Yang harus di perhatikan

### Initial function

Setiap pemanggilan file lewat URL berikut code otomatis berjalan
- Pengecekan autentikasi user (Apakah user sudah login atau belum)
- Pemanggilan file template header, menu & footer

> Jika tidak ingin secara otomatis melakukan hal - hal di atas, maka anda harus merubah file ``` ./app/config/config.php ```

### Struktur folder
Struktur folder dalam ``` ./htdocs ``` tidak boleh bersarang
contoh benar:
``` ./htdocs/home/index.php ```
contoh salah:
``` ./htdocs/menu/home/index.php ```

### CSS & JS
**File css dan file js harus di simpan di ``` ./public/ ```**
File bisa di panggil pada file ``` header.php ``` dan ``` footer.php ```
namun disarankan untuk memanggil lewat file ``` config.php ```

## Konfigurasi

**File konfigurasi berada dalam ``` ./app/config/ ```**
### Kegunaan file - file konfigurasi
- config.php
    Konfigurasi file mana saja yang bisa di perlakukan seperti apa
- database.php
    Konfigurasi koneksi database
- variabel.php
    Deklarasi variable yang bisa di akses di semua file ``` ./htdocs/ ```

#### config.php
```php
$config['default']
```
_File yang dipanggil pada URL root (Halaman default)_
```php
$config['no_auth']
```
_Halaman yang tidak memerlukan autentikasi_

```php
$config['no_menu']
```
_Halaman yang tidak memerlukan menu tapi memerlukan header dan footer_

```php
$config['process']
```
_Halaman yang tidak memerlukan template_

```php
$config['css'];
$config['js'];
```
_Halaman yang memerlukan Javascript dan CSS_

## Fungsi

**File fungsi berada dalam ``` ./app/function/function.php ```**
Function yang di deklarasikan bisa di akses di semua file ``` ./htdocs/ ```
