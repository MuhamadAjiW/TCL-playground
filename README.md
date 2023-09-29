# Build ISO untuk praktikan
> suggoitanoshi, 18/09/2021<br/>
> marfgold1, 20/09/2022

## Prereq (by marfgold1)
- Linux
- Install `advdef` dan `mkisofs` terlebih dahulu (atau any package yg belum diinstall pas jalanin `prepISO.sh`)
    > Untuk advdef sama mkisofs bisa diinstall dengan command berikut:<br/>
        ```
        sudo apt install advancecomp genisoimage
        ```

## How to (by marfgold1)
1. Ubah soal pada `Orkom-DatalabISO`. Lakukan generate `datalab-handout`.
    > Baca README pada folder yang bersangkutan untuk info lebih lanjut.
    > atau extract `tar -vxf datalab-handout.tar`
2. Copy `datalab-handout.tar` yang telah di-generate sebelumnya ke dalam folder ini (`Orkom-DatalabISO-isobuilder`).
3. Ubah banner user praktikum pada `sister/etc/motd` (dan `labsister-module/usr/local/lib/lab_sister/init` untuk banner sister).
4. Jalankan `prephandout.sh` untuk mengambil file-file yang diperlukan pada `datalab-handout` ke lib user + skel.
5. Jalankan `getfiles.sh` untuk mendapatkan base iso + modules.
6. Jalankan `prepISO.sh` untuk generate iso. Hasil iso ada di `${OUTPUT_ISO_FILENAME}` (`orkom.iso`, unless kalian specify otherwise).
7. Ketika mau hapus-hapus file, bisa pake `clean.sh`. Dengan menjalankan clean, kalian harus ulang lagi dari tahap 3 (karena folder lib akan direset)
    >Langkah 4-6 bisa digabung menjadi jalankan `build.sh` untuk langsung generate .iso


## Config:
### vars.sh
Konfigurasi global beberapa nama

### module.txt
Konfigurasi daftar module yang dimasukkan ke iso. Daftar module yang bisa dimasukkan didapat dari [sumber](http://tinycorelinux.net/14.x/x86/tcz/).

### inject.txt
Konfigurasi daftar file external yang dimasukkan ke iso. Format di dalamnya berupa url download dari web atau api.

## Scripts:
### prephandout.sh
Mengambil file-file yang diperlukan pada `datalab-handout` ke lib user + skel.

### getfiles.sh
Mendownload file-file yang dibutuhkan ke folder yang sesuai

### prepISO.sh
Membuat file ISO

### build.sh
Memanggil `prephandout.sh`, `getfiles.sh`, dan `prepIso.sh` sekaligus untuk membuat file .iso

### clean.sh
Membersihkan file-file tidak berguna

## Also Read
[TinyCore Notes](tc-notes.md)<br/>
[Changelog](changelog.md)