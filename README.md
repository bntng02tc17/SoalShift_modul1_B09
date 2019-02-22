# SoalShift_modul1_B09
<b> No. 1 </b>

Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari. Hint: Base64, Hexdump

Jawab :

1. Download nature.zip kemudian di ekstrak
2. Buat file script

        nano soal1.sh

3. Setelah itu isikan soal1.sh dengan script sebagai berikut : [Script Soal 1](/soal1.sh)
        
        #!/bin/bash

        iter=0
        for pic in /home/karinasraya/Downloads/nature/*.jpg
        do
        base64 -d $pic | xxd -r > /home/karinasraya/Downloads/pic/$iter.jpg
        iter=$((iter+1))

        done
        
Script tersebut bertujuan untuk mendecode setiap gambar yang tidak bisa dibuka agar bisa di bukan kembali.

4. Jalankan script tersebut

        bash soal1.sh
        
Maka akan muncul gambar-gambar seperti berikut :
        
5. Agar file tersebut hanya akan membuka saat pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari. Maka tambahkan berikut pada crontab -e

        14 14 14 2 * /bin/bash /home/karinasraya/soal1.sh
        14 14 * 2 5 /bin/bash /home/karinasraya/soal1.sh
