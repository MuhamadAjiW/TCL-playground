# TinyCore Notes
> suggoitanoshi, 18/09/2021
- `/isolinux/isolinux.cfg`
konfigurasi isolinux
  - `prompt 0` supaya tidak muncul `boot:` prompt
  - `initrd` bisa diberikan beberapa file, sehingga membuat ekstensi initrd
 dapat dilakukan dengan membuat file terpisah
  - `append` untuk menambahkan params. untuk orkom 1, dibutuhkan `cde`
 agar modul terinstal dengan benar, dan `vga=791` untuk menampilkan ascii art
 sister :D

- `/sbin/autologin`
selalu dijalankan setelah selesai boot (lihat default) 
dan setiap keluar dari session. 
bisa dimodifikasi sedemikian sehingga selalu autologin ke user tertentu.

- `core.gz`
initrd dari core. bisa dimodifikasi, namun lebih mudah untuk
membuat file "ekstensi" initrd di file gz terpisah.

contohnya ditambah `patch.gz` yang berisi lab files...

- modules
basically spicy squashfs files. hehe.
untuk menambahkan module ke bootable cd: masukkan ke `/cde/optional`.
module yang akan langsung diinstal saat boot dimasukkan ke file `/cde/onboot.lst`

- additional notes
module gcc berat banget, di ~40MB :(
