CREATE TABLE oyuncaklar (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    isim TEXT NOT NULL,
    cesit TEXT,
    fiyat REAL CHECK (fiyat > 0),
    renk TEXT DEFAULT 'kırmızı'
);


-- Şimşek'i ekleme (Renk yazılmadı, otomatik 'kırmızı' olur)
INSERT INTO oyuncaklar (isim, fiyat) 
VALUES ('Şimşek', 50);

-- Tek komutla dört oyuncağı birden ekleme
INSERT INTO oyuncaklar (isim, cesit, fiyat, renk) VALUES 
('Ayıcık', 'peluş', 80, 'kahverengi'),
('Kale Seti', 'lego', 150, 'gri'),
('Zıpzıp', 'top', 20, 'sarı'),
('Barbi', 'bebek', 90, 'pembe');


-- Kutudaki tüm oyuncakları göster
SELECT * FROM oyuncaklar;

-- Fiyatı 80 lira ve üstü olan oyuncakların sadece ismini ve fiyatını göster
SELECT isim, fiyat FROM oyuncaklar 
WHERE fiyat >= 80;

-- En pahalı 2 oyuncağı listele
SELECT * FROM oyuncaklar 
ORDER BY fiyat DESC 
LIMIT 2;

-- İsmi Z harfiyle başlayan oyuncakları bul
SELECT * FROM oyuncaklar 
WHERE isim LIKE 'Z%';

-- Sadece araba ve topları göster
SELECT * FROM oyuncaklar 
WHERE cesit IN ('araba', 'top');

-- Fiyatı 20 ile 60 lira arasında olanları listele (Sınırlar dahil)
SELECT * FROM oyuncaklar 
WHERE fiyat BETWEEN 20 AND 60;

-- Şimşek'in rengini mavi yap
UPDATE oyuncaklar 
SET renk = 'mavi' 
WHERE isim = 'Şimşek';

-- Zıpzıp'ı kutudan çıkar (sil)
DELETE FROM oyuncaklar 
WHERE isim = 'Zıpzıp';

-- Tabloya 'kimin' adında yeni bir sütun ekle
ALTER TABLE oyuncaklar 
ADD COLUMN kimin TEXT;

-- Kale Seti'nin sahibini Ali yap
UPDATE oyuncaklar 
SET kimin = 'Ali' 
WHERE isim = 'Kale Seti';

-- 'cesit' sütununun adını 'tur' olarak değiştir (SQLite 3.25.0+ sürümlerinde desteklenir)
ALTER TABLE oyuncaklar 
RENAME COLUMN cesit TO tur;






