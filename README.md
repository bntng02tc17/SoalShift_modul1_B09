# SoalShift_modul1_B09

<b> No. 1 </b>

Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari. 
Hint: Base64, Hexdump

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

<b> Keterangan : </b>
Script tersebut bertujuan untuk mendecode setiap gambar yang tidak bisa dibuka pada folder nature agar bisa di bukan kembali dan masuk pada folder pic dalam folder Downloads.

4. Jalankan script tersebut

       bash soal1.sh

Maka akan muncul gambar-gambar seperti berikut :

![Gambar Soal 1](/Image/1.PNG)

5. Agar file tersebut hanya akan membuka saat pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari. Maka tambahkan berikut pada crontab -e

       14 14 14 2 * /bin/bash /home/karinasraya/soal1.sh
       14 14 * 2 5 /bin/bash /home/karinasraya/soal1.sh

#
<b> No. 2 </b>

Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa: a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012. b. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a. c. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.

Jawab :
1. Download WA_Sales_Products_2012-14 di google drive
2. Untuk Soal a, buat file soal2.sh lalu isi file tersebut dengan script [Script Soal 2](/soa2.sh) Line 1 - 4

        #!/bin/bash
        echo "a. Negara dengan penjualan terbanyak"
        awk -F ',' '{ if ($7=="2012") a[$1]+=$10} END {for(x in a)print a[x] " " x}' 
        WA_Sales_Products_2012-14.csv | sort -n | tail -1
   
   Script di atas menggunakan awk dengan file-separator berupa tanda koma(,) mencari setiap baris dengan $7(tahun penjualan) sama dengan 2012  kemudian menambahkan pada suatu array a dengan indeks berupa $1(nama negara) dengan $10(penjualan) dari baris tersebut. hasilnya kemudian dipipe ke sort dan dipipe lagi ke tail sehingga hanya memunculkan negara dengan penjualan terbanyak.

3. Untuk soal b, file soal2.sh diisi lagi dengan script [Script Soal 2](/soa2.sh) Line 5 -6
        
        echo "b. Tiga product line yang memberikan penjualan terbanyak dari poin a"
        awk -F ',' '{ if ($7=="2012" && $1=="United States") a[$4]+=$10} END {for(x in a)print a[x] " " x}'     WA_Sales_Products_2012-14.csv | sort -n | tail -3
        
        Script di atas menggunakan awk dengan file-separator berupa tanda koma(,) mencari setiap baris dengan $7(tahun penjualan) sama dengan 2012 dan $1 sama dengan United States,  kemudian menambahkan pada suatu array a dengan indeks berupa $4(product line) dengan $10(penjualan) dari baris tersebut. hasilnya kemudian dipipe ke sort dan dipipe lagi ke tail sehingga hanya memunculkan 3 product line dari negara dengan penjualan terbanyak yang paling banyak terjual.
        
4. Untuk soal C, file soal2.sh diisi lagi dengan script [Script Soal 2](/soa2.sh) Line 7-8
        
        echo "c. Tiga product yang memberikan penjualan terbanyak dari poin b"
        awk -F ',' '{ if ($7=="2012" && $1=="United States" && ($4=="Outdoor Protection" || $4=="Camping Equipment" ||  $4=="Personal Accessories")) a[$6]+=$10} END {for(x in a)print a[x] " " x}' WA_Sales_Products_2012-14.csv | sort -n | tail -3

        Script di atas menggunakan awk dengan file-separator berupa tanda koma(,) mencari setiap baris dengan $7(tahun penjualan) sama dengan 2012 dan $1 sama dengan United States dan $4(product line) sama dengan Outdoor Protection / Camping Equipment atau Personal Accesories,  kemudian menambahkan pada suatu array a dengan indeks berupa $7(product name) dengan $10(penjualan) dari baris tersebut. hasilnya kemudian dipipe ke sort dan dipipe lagi ke tail sehingga hanya memunculkan 3 product dari product line yang terjual terbanyak dari negara dengan penjualan terbanyak yang paling banyak terjual.
        
        
     ![Gambar Soal 2](/Image/2.png)
   
#
<b> No. 3 </b>

Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut: 
a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt 
b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya. 
c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus. d. Password yang dihasilkan tidak boleh sama.

Jawab :

1. Buat file script

       nano soal3.sh

2. Setelah itu isikan soal3.sh dengan script sebagai berikut : [Script Soal 3](/soal3.sh)

       #!/bin/bash

       g_pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 11 | head -n 1)
       name="password"
       num=1

       while [ -f "$name$num.txt" ]
       do
       num=$((num+1))
       done

       `touch "$name$num.txt"`
       fname="$name$num.txt"
       echo "$num$g_pass" > $fname
       
       line 3 bertujuan untuk mengenerate string random dengan panjang 11
       lalu dilakukan pengechekan apakah file password$num ada atau tidak, jika ada maka num++. loop dilakkan hingga file tidak ditemukan. setelah itu membuat file dengan nama $name$num.txt dan isinya berupa $num$pass

3. Jalankan script tersebut

       bash soal3.sh

Maka akan muncul file password seperti berikut :

![Gambar Soal 3](/Image/3.png)

#
<b> No. 4 </b>

Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal- bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:
a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14. 
b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya. 
c. setelah huruf z akan kembali ke huruf a d. Backup file syslog setiap jam. e. dan buatkan juga bash script untuk dekripsinya.

Jawab :
 
 Untuk mengekripsi manual
 1. Buat file enkri.sh lalu isikan file tersebut dengan [Script Soal 4](/Soal4/soal4enkriptor.sh)
 
        #!/bin/bash

        datenow=`date +%d-%m-%Y`
        timenow=`date +%H:%M`
        rot=`date +"%H"`
        a=abcdefghijklmnopqrstuvwxyz
        b=ABCDEFGHIJKLMNOPQRSTUVWXYZ
        r=$rot
        r=`echo $r|sed 's/^0*//'`
        #echo $r
        na="$timenow $datenow"
        `mkdir -p ~/backup`
        `sudo </var/log/syslog sed "y/$a$b/${a:$r}${a::$r}${b:$r}${b::$r}/">~/"$na.txt"`
        `sudo zip -j ~/backup/"$na.zip" ~/"$na.txt"`
        `sudo rm ~/"$na.txt"`
        

        #echo $na
      
        Line 3 - 4 berguna untuk mendeklarasikan variabel dengan isi berupa tanggal dan ajm sekarang. line berikutnya berguna untuk menentukan rotasi huruf sesuai dengan jam dibuatnya file. 2 line berikutnya berguna untuk mendefinisikan huruf kecil dan besar. lalu 3 line berikutnya untuk membuat rotasi dalam variabel dengan tipedata integer 1 digit untuk 01-09. berikutnya mendeklarasikan variabel na sebagai variabel nama untuk file yang akan dibuat. kemudian dengan command sed, file syslog dimanipulasi stringnya dengan dirotasi setiap karakter hurufnya sebesar rot. hasilnya kemudian dicetakdi $na.txt. kemudian file tersebut dizip dan file sebelum dizip dihapus
        
        Agar berjalan setiap jam, tekan crontab -e lalu masukkan 
        0 * * * * /bin/bash /path/to/enkri.sh
        
         
 Untuk mendekripsi manual 
 1. Buat file dekri.sh lalu isikan file tersebut dengan [Script Soal 4](/Soal4/soal4deskriptor.sh)
        
        #!/bin/bash

        echo "Masukkan nama file zip tanpa ekstensi!"
        read filenama
        rot=${filenama:0:2}
        datenow=`date +%d-%m-%Y`
        timenow=`date +%H:%M`
        a=abcdefghijklmnopqrstuvwxyz
        b=ABCDEFGHIJKLMNOPQRSTUVWXYZ
        rot=`echo $rot|sed 's/^0*//'`
        let r=0-$rot
        #`sudo cp var/log/backup/"$filenama.zip" ~/"$filenama.zip"`
        `unzip ~/backup/"$filenama.zip" -d ~/backup/`
        #`sudo cp ~/"$filenama.txt" ~/terdekrip.txt`
        #`chmod 777 terdekrip.txt`
        `sudo <~/backup/"$filenama.txt"  sed "y/$a$b/${a:$r}${a::$r}${b:$r}${b::$r}/" > ~/backup/terdekrip"$filenama".txt`
        #`sudo mv ~/"$filenama.txt" /var/log/backup/decrypted.txt` 
        #`sudo rm ~/"$filenama.zip"`
        #`zip -j ~/lat/tjn/\$timenow\ \$datenow\decript.zip ~/lat/asl/coba2d.txt`
        #`sudo rm coba2d.txt`
        
        Line ketiga meminta user untuk memasukkan file yang akan didekrip. line kelima bertujuan untuk mengambil 2 digit awal dari file nama (jam pembuatan file). Line ke 10 untuk menghilangkan digit 0 pada digit pertama variabel rot. kemudian file tadi akan diunzip dan dengan menggunakan command sed dengan rotasi kebalikan dari rot string file dimanipulasi. Hasilmanipulasi disimpan di ~/backup/terderkrip"$filenama".txt 
        
      ![Gambar Soal 4](/Image/soal4enkri.png)
 
#
<b> No. 5 </b>

Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut: 
a. Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah. 
b. Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13. 
c. Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1. d. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.

Jawab :

1. Buat folder modul1 di home

       mkdir modul1

2. Buat file script

       nano soal5.sh

3. Setelah itu isikan soal5.sh dengan script sebagai berikut : [Script Soal 5](/soal5.sh)

       awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog | awk 'NF <13' >> /home/karinasraya/modul1/syslog5.log

<b> Keterangan : </b>

Mengandung string cron

       $0 ~ /cron/

Tidak mengandung string sudo

        $0 !~ /sudo/ 

Jumlah number of field kurang dari 13

       'NF <13'

Masukkan record tadi ke file log pada direktori

       /home/karinasraya/modul1/syslog5.log

4. Jalankan script tersebut

       bash soal5.sh

Maka akan muncul file syslog5 pada folder modul1 seperti berikut :

![Gambar Soal 5](/Image/5.PNG)

5. Agar script berjalan setiap 6 menit dari menit ke 2 hingga 30, tambahkan berikut pada crontab -e

       2-30/6 * * * * /bin/bash /home/karinasraya/soal5.sh


