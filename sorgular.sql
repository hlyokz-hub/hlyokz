CREATE TABLE oyuncaklar (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    isim TEXT NOT NULL,
    cesit TEXT,
    fiyat REAL CHECK (fiyat > 0),
    renk TEXT DEFAULT 'kırmızı'
);

-- Rengini yazmadığımız için varsayılan (DEFAULT) olarak 'kırmızı' atanacaktır.
INSERT INTO oyuncaklar (isim, cesit, fiyat)
VALUES ('Şimşek', 'araba', 50);

-- Tek komutla dört oyuncağın eklenmesi:
INSERT INTO oyuncaklar (isim, cesit, fiyat, renk)
VALUES 
    ('Ayıcık', 'peluş', 80, 'kahverengi'),
    ('Kale Seti', 'lego', 150, 'gri'),
    ('Zıpzıp', 'top', 20, 'sarı'),
    ('Barbi', 'bebek', 90, 'pembe');
	
	
	-- Kutudaki tüm oyuncakları göster
SELECT * FROM oyuncaklar;

-- Fiyatı 80 lira ve üstü olanların sadece ismi ve fiyatı
SELECT isim, fiyat FROM oyuncaklar WHERE fiyat >= 80;

-- En pahalı 2 oyuncak
SELECT * FROM oyuncaklar ORDER BY fiyat DESC LIMIT 2;

-- İsmi Z harfiyle başlayan oyuncaklar
SELECT * FROM oyuncaklar WHERE isim LIKE 'Z%';

-- Sadece araba ve toplar
SELECT * FROM oyuncaklar WHERE cesit IN ('araba', 'top');

-- Fiyatı 20 ile 60 lira arasında olanlar
SELECT * FROM oyuncaklar WHERE fiyat BETWEEN 20 AND 60;


-- Şimşek'in rengini mavi yap
UPDATE oyuncaklar SET renk = 'mavi' WHERE isim = 'Şimşek';

-- Zıpzıp'ı kutudan çıkar
DELETE FROM oyuncaklar WHERE isim = 'Zıpzıp';


Bonus Sorunun Cevabı (DELETE FROM oyuncaklar;):
Bu komut çalıştırıldığında oyuncaklar tablosunun yapısı ve sütunları korunur ancak içindeki tüm kayıtlar (veriler) silinir. 
Tablo tamamen boşalır.


-- Yeni sütun ekleme
ALTER TABLE oyuncaklar ADD COLUMN kimin TEXT;

-- Kale Seti'nin sahibini Ali yapma
UPDATE oyuncaklar SET kimin = 'Ali' WHERE isim = 'Kale Seti';

-- cesit sütununun adını tur olarak değiştirme
ALTER TABLE oyuncaklar RENAME COLUMN cesit TO tur;