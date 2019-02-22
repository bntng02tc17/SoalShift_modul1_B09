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

![Gambar Soal 1](/Image/1.PNG)
        
5. Agar file tersebut hanya akan membuka saat pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari. Maka tambahkan berikut pada crontab -e

        14 14 14 2 * /bin/bash /home/karinasraya/soal1.sh
        14 14 * 2 5 /bin/bash /home/karinasraya/soal1.sh
        
#
<b> No. 2 </b>

Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa: *Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012. *Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a. *Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.

Jawab :

#
<b> No. 3 </b>

Membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, kecil, dan angka. File berekstensi .txt dengan syarat disimpan dalam bentuk password1.txt, file selanjutnya tidak boleh sama dengan file sebelumnya dan urutan yang sudah terhapus harus terbuat lagi jika dijalankan, dan pastinya password tidak boleh sama.

Jawab :

#
<b> No. 4 </b>

Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal- bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:

a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14. 
b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya. 
c. setelah huruf z akan kembali ke huruf a d. Backup file syslog setiap jam. e. dan buatkan juga bash script untuk dekripsinya.

Jawab :

#
<b> No. 5 </b>

Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:

Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.

Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.

Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.

Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.

Jawab :
