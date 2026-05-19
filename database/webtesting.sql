-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 29 Apr 2026 pada 09.34
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Basis data: `webtesting`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `image`, `price`) VALUES
(583, 'Promo pisang', 'Terbaru Terdekat jangan Sepatu Original.', 'promo_pisang_657.heic', 269000),
(584, 'bagaimana nanas paling helm', 'itu Terbaik mana oke Nanas banget aduh Terbaru Sepatu. Pisang Durian Alpukat Premium deh aduh Promo Kemeja Terbaik Berkualitas. Semangka itu bagaimana Kulkas aja Alpukat Terbaik. Helm lah Nanas siap apa itu Monitor Jeruk Berkualitas Laptop. kenapa siap Smartphone Kamera kok aduh Melon Apel Jeruk.', 'bagaimana_nanas_887.png', 270000),
(585, 'Sih siap lah', 'kok Promo sih aja Apel Nanas. Kemeja Pisang Terbaru Kulkas boleh Melon.', 'sih_siap_lah_381.png', 271000),
(586, 'BANGET SIH', 'Helm Semangka jangan Sepatu Terdekat.', 'banget_sih_238.jpg', 272000),
(587, 'jangan', 'Pisang Original deh kok mana Smartphone Berkualitas. ini Alpukat Premium Blender Apel kok siap Original Mangga Terbaru. mantap Helm oke siap Grosir.', 'jangan_557.jpg', 273000),
(588, 'Nmaa produk', 'deskripsi beberapa kaliamt saja', 'Screenshot_2025-06-30_06_34_35.png', 10000),
(589, 'IRFAN', 'halo ini adalah seminoar porposana', 'Desktop_-_LOGs_color.png', 200200),
(590, 'topik penelitian Anda sangat menarik dan', 'topik penelitian Anda sangat menarik dandaacc deskripsi', 'Desktop_-_3_blacklist.png', 200000),
(591, 'IRFAN produkkkk', 'ini harga ya', 'Screenshot_2026-01-02_010932.png', 10000),
(592, 'tetsting paylaod', '<a id=x tabindex=1 onactivate=alert(1)>ini halo</a>', 'Screenshot_2025-07-03_10_06_37.png', 10000),
(594, 'Smart TV ProMax', 'Smart TV ProMax menghadirkan pengalaman sinematik tingkat tinggi dengan layar 4K Crystal Display yang mampu menyajikan gambar ultra-jernih dan detail yang nyata. Dilengkapi dengan Sistem Operasi Cerdas, TV ini memungkinkan akses cepat ke berbagai layanan streaming populer seperti Netflix dan YouTube, serta didukung oleh ProMax Audio System untuk kualitas suara surround yang mendalam. Konektivitas nirkabel yang stabil melalui Wi-Fi 6 dan Bluetooth 5.0 memastikan pengalaman hiburan di rumah menjadi lebih modern dan tanpa hambatan.', 'smart_tv.jpeg', 8500000),
(595, 'Speaker Aktif Polytron Tower', 'Speaker Aktif Polytron Tower dirancang untuk memberikan performa suara yang menggelegar dengan desain tower yang kokoh dan elegan. Produk ini menawarkan fleksibilitas tinggi dengan berbagai pilihan input seperti USB, SD Card, Bluetooth, dan Aux In, serta dilengkapi fitur FM Radio untuk pilihan hiburan tambahan. Sangat cocok untuk aktivitas hiburan keluarga, speaker ini juga memiliki Mic Input yang mendukung fungsi karaoke serta kontrol jarak jauh yang praktis menggunakan remote.', 'speaker_3_lantai.webp', 2200000),
(596, 'Kulkas Polytron FlexUp', 'Kulkas Polytron FlexUp hadir dengan sistem pendingin 5-in-1 yang inovatif, memastikan suhu tetap stabil, pendinginan lebih cepat, namun tetap hemat energi. Desain eksterior metalik yang elegan tidak hanya mempercantik dapur tetapi juga tahan karat untuk penggunaan jangka panjang. Dengan kapasitas Big Liter yang luas, kulkas ini memberikan ruang penyimpanan maksimal untuk bahan makanan, ditambah fitur rak FlexUp yang posisinya dapat disesuaikan dengan kebutuhan penyimpanan Anda.', 'Kulkas-2-PINTU.png', 4100000),
(597, 'Speaker Nikai LED Rainbow', 'Speaker Nikai LED Rainbow adalah perpaduan sempurna antara kualitas audio dan visual yang menarik berkat lampu LED Rainbow dinamis yang bergerak mengikuti irama musik. Meskipun memiliki desain yang compact dan modern, speaker ini mampu menghasilkan suara yang jernih dengan bass yang dalam dan bertenaga. Dukungan konektivitas Bluetooth memudahkan Anda untuk melakukan streaming musik secara nirkabel dari perangkat apa pun, menjadikannya pilihan ideal untuk melengkapi ruang kerja atau kamar tidur.', 'speaker.jpg', 1500000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`) VALUES
(1, 'USER', 'user@gmail.com', 'pbkdf2:sha256:1000000$CiJhlKzfULfl7xFm$c9cc8756ac5f6c8a2ae4cea185f11dc0ee589e73828f4c4c13f9632c744d6e3b', 'user'),
(2, 'ADMINl', 'admin@gmail.com', 'pbkdf2:sha256:1000000$62C9DMsKwPnAOfzt$92cd017105d76ea2ad060a927293e1c32b5e45871c4fd890266bf9f6ae2804f0', 'admin'),
(3, 'IRFANn', 'irfan@gmail.com', 'scrypt:32768:8:1$NZ7VFQ3vUZCldVZ1$6ae12d1e1230461739ac8189f3bb0c3489ac465a80f8dfb027041941d6c8b1fc9f8945470471391c624fc3c14e8cb907d11cbbbd8e1adcf3ba9ca77fb4db2d0e', 'user'),
(4, 'IRFAN', 'irfan@mail.com', 'scrypt:32768:8:1$bUGofcAW09n86kc7$b2c2472eaee4716c364029605ee8d5b32551cacc3b8d048dd6c35f67a1e523b6e822c04e97a604a909e9e022ea92dc2bfddac068e12360c79a1c6401048bd089', 'user'),
(5, 'budi', 'budi@mail.com', 'scrypt:32768:8:1$JVF1jtENKS1xMxwN$e94ca5182103c98d3e27b81154ecbae68c7e1329ff610177a6b8ab07f5a931d91007ef4199e7eb1179f60d752c09b710c41553208cb3150c4fd8e0a7fe2002c9', 'user'),
(6, 'Sumiati2', 'Sulastri1@uho.ac.id', 'scrypt:32768:8:1$2h6aFQbN1d1i1WXg$0156b03e7df46007da6132d74639f88387f164f0608e4caf89795456347b7d6db3d04f42b32d393aed215a7966501a117df5b779029a60152d34df42ad4e98a8', 'user'),
(7, 'SriWahyuni3', 'Sumiati2@yahoo.com', 'scrypt:32768:8:1$v5MTa7pLTnOzhZcA$e5866e1ff2f02db4383d7343f2a0b5cd5562af9222968156c5adcb858a2ecc9353840fc92751c18d586beb4f8ceafb4a6c960af9006740421f3f0a05a9cada4a', 'user'),
(8, 'Sumarni4', 'SriWahyuni3@gmail.com', 'scrypt:32768:8:1$CqbPDzjeWK5JDzmX$28bb5a507405d7d3b047b95552124ff718e80b482f58ebf07a0766631389b3fa6c64b1bd1d77efd7616159a1112290b97a02ca3e81295e7bc68a42dc78d15f5a', 'user'),
(9, 'Sunarti5', 'Sumarni4@uho.ac.id', 'scrypt:32768:8:1$ZoaT6JRPIP6bjFoc$64ae4b7ecda3dbe005000010571665833b6cbf92aa5a2d57a955722cf1bdbc46e6c16d6a7fc60c917133f82d974b46df48c35a6e4fda3390f412375de46096e7', 'user'),
(10, 'SitiAminah6', 'Sunarti5@yahoo.com', 'scrypt:32768:8:1$SM26OVBdSD6R8z9R$d8f7b32879aeacbc265976bdafa9177f9f44f4effa014dfa25668da3964414cff9d330485a6f608fe282141d552eded72105f57fb153b1261e47cfa0d8a9ca53', 'user'),
(11, 'Ernawati7', 'SitiAminah6@gmail.com', 'scrypt:32768:8:1$b8o71JpZWos7KKJ6$b15678987299b6c97e9d043aa43e3ed1a5f1584c5cdc15fe7920e61e5a38e9e45f207c47d232a0bc87a07eb2fc780c285332325758deb2aa6bc73ff7be6bbddc', 'user'),
(12, 'Rahayu8', 'Ernawati7@uho.ac.id', 'scrypt:32768:8:1$T7kdRY9vV1Ns9dY0$9205e7388b4e1e874b4779aaa1afcf6a359ab7d250d9d6622899190376a2a43fded0dc5257f0afc9ab91fff0f9d0ebee99c0b5b63994c61d3854616302d51903', 'user'),
(13, 'Yunita9', 'Rahayu8@yahoo.com', 'scrypt:32768:8:1$TGpDC6QhpUVsvYmJ$e44577769b5a43471de153a342d6ef95342fef9e0957323d84ac293563db5b9db4b870257601e6149337a1dac4116ad967748166010507acf3e10051507b6c4d', 'user'),
(14, 'Rina10', 'Yunita9@gmail.com', 'scrypt:32768:8:1$iRlzuxnpSTAYunb3$f0972821ed2517e365add90635ca1a85f26981f3b406a3432b7c3318c76ba6d20471332d6202f0588bf0b3d78b482748e395dc5a18c87bdc359de6ae96708892', 'user'),
(15, 'Widya11', 'Rina10@uho.ac.id', 'scrypt:32768:8:1$nAaShTy9u9H92CPM$ff197b178488cf8f52266c91c971976f4d6aa7e54afd4f690dee1eb467d6e5364a285f374666cf7f4698337f01ecec871c8d433e1c4d9f6781fc72f210f41023', 'user'),
(16, 'Intan12', 'Widya11@yahoo.com', 'scrypt:32768:8:1$XdT4r8qDdsI2PalT$b65f5f5dd506b490309b4d286b9363cac67338fc1a1c0f3296691c671c92bae58c862c0818734b83ffd7193ea1e575d8a635db60ada45057ba65510abd85a7a0', 'user'),
(17, 'Diah13', 'Intan12@gmail.com', 'scrypt:32768:8:1$ZmgClI4E1E4zBt6k$8f8febd698c285807f11cb18f6b9b63aab53b2e6b87f321c46d46e2e78b86fac6e1c038b63a205bec846d6d5117c698abc7df34f767fb9ac6bdd724ec32b9dcf', 'user'),
(18, 'Agustina14', 'Diah13@uho.ac.id', 'scrypt:32768:8:1$UaCkirmSjgYjObya$5d7b13c0fe966e0dd5f1dccd34702ab6f4d5f4fe2588807b5eb39f003aa808bda7d40a2dce8e2760225df051f4d4c0c60951e269c319d8ee2f97e5af34bd84ac', 'user'),
(19, 'Rini15', 'Agustina14@yahoo.com', 'scrypt:32768:8:1$VEGKVxjtBPRhJrCP$f8ce694f492c203aa6d5468334df0d02303507b1bff2b5e42a0cbbdb7982f9024b7bc8d60411746eaf4d52221f40f2286144b71fbcaf3a52ea05ab18e30f2654', 'user'),
(20, 'Yulia16', 'Rini15@gmail.com', 'scrypt:32768:8:1$qfg2XqobDkJ9JNOu$ada9028e5d3c4b9bca3520a5c685391238979640d82ee383d2913bdb7dc6a4bf379ef2a9583761d5568ffbbccc90858b6bfe622b526236eb0786bdb1df0766ae', 'user'),
(21, 'Puji17', 'Yulia16@uho.ac.id', 'scrypt:32768:8:1$cXWEGM4JuhHjf5Tt$452e7ff897f2829c8675a0288bb292d9cdbd8080dac37dc3ca0f21adf4b788ddfca46ea2d412240df5de5a056445d32b6332c1fd35fa4d3c8c7e522abf94c931', 'user'),
(22, 'Utami18', 'Puji17@yahoo.com', 'scrypt:32768:8:1$n2WJ8KDCZaMR8sQo$7700ad73d3c68a79ad5430fab1139367644f923bfbd96e7ec746faf15a633727a8b686901aef5b18f0e9f83075ab58030e1f46854c928f10ffa9087785503d43', 'user'),
(23, 'Amalia19', 'Utami18@gmail.com', 'scrypt:32768:8:1$anmry2TVSwKv6lGC$39cf4bd78d2a04cf52642f679242482801173199819e79472df9792a9d24b0bbfc021e4e0fd4be86bad163b158f0af9eaca99d83ffcb33594238cf8e7b216391', 'user'),
(24, 'Dina20', 'Amalia19@uho.ac.id', 'scrypt:32768:8:1$I85oIcBlFwm8KBuq$897664a3f051b9dad8bf46ea60b19fcfad7c1de2ef5ea47ef15ea9ee9a61fa04af1cbec3be83155951904561cd6b866973a7e4ffda1ef3fd01e0043ea42920a2', 'user'),
(25, 'Dini21', 'Dina20@yahoo.com', 'scrypt:32768:8:1$2p7uIjYurJWRB1xR$5678a5b2ab70368aa7254db49f4cab1cd1d68bc573d549512082bf437617f5d87b50b6eb1e3a51f378d3ba8dac7b9c81ef6e61f3bfe5b2f43190195d6a4399eb', 'user'),
(26, 'Devi22', 'Dini21@gmail.com', 'scrypt:32768:8:1$Wkpd8SH11d5oy56A$47457e781cf4990e8942faf390f6b5ee8a961d71652c87ff9004c4cb14614c50800cbfdf1762264e2fcc1f482269fb17d68c3401dcf9435ee4ab57b5d3c84d56', 'user'),
(27, 'Citra23', 'Devi22@uho.ac.id', 'scrypt:32768:8:1$LfHe7Q54sJEYBNHG$2adcefba2a6b3c856ef2ca7c15dda2ec926c0f0ff19b1a3ddf26708377cf2a07928701fa5a6a9116f2ab49d4bf61601b5c2c8167419f6423083ff53518561a56', 'user'),
(28, 'Eva24', 'Citra23@yahoo.com', 'scrypt:32768:8:1$HUWNGnIdHK2zrugR$ca869d5d8bee31b9fc962458a1079a89f6983fca40af51c68ea85d9f622f287310c10c45324d90162036a513dbc4a33aefd7467ad5a1bfd1d6cbd8068b0b1784', 'user'),
(29, 'Endah25', 'Eva24@gmail.com', 'scrypt:32768:8:1$SBBiJGLas8XyhF8K$98ec9c382b4e364350a9c4608ddfc73bba5d37bd435deb3e16f59a7e88677a5bfc454366a41d8260f8f0142ce8ab6b350f1accbfa1667d1892bab1c75b4a9f6e', 'user'),
(30, 'Novi26', 'Endah25@uho.ac.id', 'scrypt:32768:8:1$KrFYTnv1aTC06O5V$364331b2f0a39b88e533c71fb2041a9a9e18a9da7abed78a0967d82a6c93dbcf714a959ea0457c467e85218803b9b9e877feef06bd3d94fb3ae90c6c68f09795', 'user'),
(31, 'Irma27', 'Novi26@yahoo.com', 'scrypt:32768:8:1$VsQ0SgNJvopqy7dq$a319b8120c0972572d1a0837f361373af3ce799b175dc2d174d373db89dde349fe1ee1458afbb08fbacc47fe839a4684b5f3b178d5481f6130ca08dd4800b540', 'user'),
(32, 'Astuti28', 'Irma27@gmail.com', 'scrypt:32768:8:1$CBG7I27afq7uj9xn$2060ab2bb6c8784bb430aeefe7aeb7c7e1e3fd05d53f50f99bfbe32a4707037b42d1fbe31ef00bf2e565e0d3ded8147bc384bc485993ae7cdd49c1acaa8f56f4', 'user'),
(33, 'Aulia29', 'Astuti28@uho.ac.id', 'scrypt:32768:8:1$vWfpOL6jHLsnyNCy$58d00f14cc74a0afcd53534dc543210c75f22a1f5ad463edfb2b38d0ee2d2eaf033f5eb97a4d474e7814fda4253b05a01b721607d609dd315bba8c5495c80f3f', 'user'),
(34, 'Amelia30', 'Aulia29@yahoo.com', 'scrypt:32768:8:1$qHPGA0cxPOACkycE$6dbc683d7635ae51d0e3da920687b65d20f15e8a4acf54f69bcd04e6ee1b2c73b20adb6598e5908cbb5f374800714f891d74bf7fe092c39cd3a098dd70d53cb9', 'user'),
(35, 'Anggraini31', 'Amelia30@gmail.com', 'scrypt:32768:8:1$YQzz9dyMu5kz7yZy$7b436c19ec67b4ee99eca771873090ae97dd2a99b874a456e7ce600ab67a70857c5f120531cd1896fe7d9f8ec3eda8f98c25fe146413de31a65ebdcf64ba21da', 'user'),
(36, 'Wulan32', 'Anggraini31@uho.ac.id', 'scrypt:32768:8:1$gJZJkdXPXsQo4SNj$a3ef266cd59a45d19052e733ee9e712ac79985ca922e40501be247f527bee67a16a7aa266295099c0764046d0205aa732e2f96d574e7fe60427ebe757f875836', 'user'),
(37, 'Indah33', 'Wulan32@yahoo.com', 'scrypt:32768:8:1$r40F0OaPhf9fHKvg$2d29228cefe2a8a822af72b60fef2f358759a03aa5e91696bcd06fc79b1a825d645fcfd14ed6204cd7340c7209fd127e3e8ca4351e8d85fa9ba86d9945db34e1', 'user'),
(38, 'Yuni34', 'Indah33@gmail.com', 'scrypt:32768:8:1$q4WUyZw1DPrc9Yh2$bd0279eed907c7764b4d1939f9d13e4415087278cd9b981f93e86f091d724daa378a0533efbdad5ce55bc021b4cb2064b629e1d144d787404ed8f54da051185b', 'user'),
(39, 'Dinda35', 'Yuni34@uho.ac.id', 'scrypt:32768:8:1$CiCaLXypoOSqLxfG$da32eb3437956c69ca1c4989ccd2d135c03050306cd4275ab173d3bc47c28aef69704ece64da5c0ba17b86518084ee8ec622a039ca171dd693b0761accd5eee4', 'user'),
(40, 'Annisa36', 'Dinda35@yahoo.com', 'scrypt:32768:8:1$1jxCcEIq2SGHooHX$eef1847d76472ae344f887fa736dc5caeae7dfaa6380fff8ee374c49cc0668e3f2990f226888d48bbffd196ecd8ac87b6a5129de89af151a815e468caf36601c', 'user'),
(41, 'Dewi37', 'Annisa36@gmail.com', 'scrypt:32768:8:1$0mysMcopYF9IBhZY$b7f2a6cf95967a30bda9babb9d9d131478e367140f2c332ae307994f8f21cfd855afcde1f2d6b9dd51a2734681d281cbc094a8b12073dd884ca5e7407ed9f30e', 'user'),
(42, 'Desi38', 'Dewi37@uho.ac.id', 'scrypt:32768:8:1$n3CvPAQeESdCuj89$f0e64eaeeef286a5483850c6b2331221e9f10cfa1532f71f8a7f026b0ce8e0bc5600557a7996318d20b1e4c960199acf5e15c3264c118e03992fae31e0e431c8', 'user'),
(43, 'Putri39', 'Desi38@yahoo.com', 'scrypt:32768:8:1$CKhLKLPh5LwwQY1r$0d14edb940b8881f38be1ece92f139f6567b3114bc9dfcf6312a00daa511af5e3d5f7ac6b4257a9b8c70e33a8699c0068ec69d37d0adb60a5f56d3c61d3c83b4', 'user'),
(44, 'Ratna40', 'Putri39@gmail.com', 'scrypt:32768:8:1$MV7M5BSc2eGJY4hV$57bea416f51c6ef563f66ca3b03268dd5b39f1f3c78f2e695cd5a2511f52d67f7e8d729aa45a1778d606960c7a6487b318256749b4204cc7ccf4267fd7d78e20', 'user'),
(45, 'Fitri41', 'Ratna40@uho.ac.id', 'scrypt:32768:8:1$mUYXhhvyWE2uXz9q$2c2f3651f30b7396e89217c858a66d22cdaeb082afe29674ea4e65fa421f3b51debe2f5da54a8ca407eae63a05a69acd243847eb62e2d16fefe50e0dbbc10133', 'user'),
(46, 'Nurul42', 'Fitri41@yahoo.com', 'scrypt:32768:8:1$arJFQwFmy2FZPqqn$14a3780d1584a3fa5fd2c1d898a010b4acc80789c4acb095c21bae5b77c860633c76dc4c01f5c618a7a126efd1c411dd607f2e501c0e2fb15da82715d31f43a4', 'user'),
(47, 'Ani43', 'Nurul42@gmail.com', 'scrypt:32768:8:1$s35OPxHFBntCuCsT$94247f1783f7ba29d5a84e87ca19cf3da635868855cc104b3a05e4218ba885767ff3d10947d460cb860f7ca4aa244180f001e11f237926a109d7b0de504a71ff', 'user'),
(48, 'Puspita44', 'Ani43@uho.ac.id', 'scrypt:32768:8:1$Mw38PENr1mBb5nfa$aea16b4aa5276afebf6037b58f309d53e43a66a06b4c49dbe280dc2309fec3faa304ab8237a80827681ca205f368159531c910c4039225cf392cb2a70b47ab46', 'user'),
(49, 'Maria45', 'Puspita44@yahoo.com', 'scrypt:32768:8:1$PdZ7lVKGWibnRPY9$42c2b875499107f108b05edb25ae5b538d64bdfd0caffb8fcfc25a1fc74a044eda17b365b8ecbc084de164941bd1d6817f3ddfeaaa7b15db826a70216fc12511', 'user'),
(50, 'Ratih46', 'Maria45@gmail.com', 'scrypt:32768:8:1$TtZpFW02eyh8ZAaX$d7c25ae6e5ec4d31ba1f7568074a464319725c46ea4c488805fc666b9e80466c2d9db7ccb6d11d40b223c42f704b9257345df5cd2139fc71fe732dcb3d4f7d0a', 'user'),
(51, 'Kartika47', 'Ratih46@uho.ac.id', 'scrypt:32768:8:1$13xVZbL9oygNgWBQ$b1180005b5d8ef1a33fc6cb838c46ea53717ffbf9a82b8e9ebe720df101d03499d52e5da9535e4f94578331513c7df0a9faf82e94b6d297aa25393226a82a183', 'user'),
(52, 'Wulandari48', 'Kartika47@yahoo.com', 'scrypt:32768:8:1$Kj9YArBnQnC6ISnQ$96bb1d65825a910260c3cb39611d1b010b38f85b7728dff7d7003945619fd1240444a71e3f6a47f52c4f83323ab8866b13059fe1a40f9ffa3b5b218d15e9f56e', 'user'),
(53, 'Lestari49', 'Wulandari48@gmail.com', 'scrypt:32768:8:1$2P54gbYyiRSaww1o$0d67bc0aeebda602c0356ff31013053b3aacbb750552d0e00fbf66ad74573281b25a208d1e5a0b0f747598589f4c90a8a28e269a94bff9d5b15eab4f3346e6bc', 'user'),
(54, 'Agus50', 'Lestari49@uho.ac.id', 'scrypt:32768:8:1$xdFa3jY1T9LpgAbD$4714a752726abc53d9881433cff4e48af6e0d5d833fe5f6da5bdd60bb0bd7bf28a386a38af50aaf8b4cb7e587d4e38590e05e1cd09adc2abdc3242cd2390761e', 'user'),
(55, 'Asep51', 'Agus50@yahoo.com', 'scrypt:32768:8:1$TtjmhUhGLztG7f57$1b922ba37882fb0a86ad10ebe62f64d85dd204cc8af7b8dffcf51ad933d7f26b2aa3c4e066377efb7ede07fafe98ec782c487768038c4db0876d988eaa991013', 'user'),
(56, 'Wawan52', 'Asep51@gmail.com', 'scrypt:32768:8:1$n3GJnD0iINsBpSTf$5adf8012dd68bc3edd86baa1541dc231ce4d7d90638a4c46edb94837d0eed722ec4b9622ff46e8168a70afc59f2fb3189fb078d21128b60f5bf694e03f660821', 'user'),
(57, 'Budi53', 'Wawan52@uho.ac.id', 'scrypt:32768:8:1$9WdrEd5dDY1y8dhq$b0635c67289c6bc3a6955997e5b10dc89e64fdcc76a2c7ca316eecdef09ed1d4b5fd7b5ef1ecf5d85db4df60fefe3988d01bd66973b04b17c413dd9374690782', 'user'),
(58, 'Bambang54', 'Budi53@yahoo.com', 'scrypt:32768:8:1$Ft9B3kTtM6Gqyigc$44052236feb5b02298e1b290fec9ad7af11b842a3cdd31e95f5e8292e6a01ca9d8de97c09d5c69e7913efefa0f3c069d2c6e466f42ab1804f2562a4029858d74', 'user'),
(59, 'Slamet55', 'Bambang54@gmail.com', 'scrypt:32768:8:1$rtx94NMWDqpaLpAm$59b620c633a943b5e0028afaf854a772ffed45c1d9931854dca308705fb4de99d39a0877e117e1807648420171d4cac5e18cc78e024ec8ce596a8e611d9b868c', 'user'),
(60, 'Udin56', 'Slamet55@uho.ac.id', 'scrypt:32768:8:1$CkQ4ubY15gr9fWWx$1f457d251da4dfe0d14e56d2710c2e3e80fe210927e05277382faaf94b37a9de41cc45173a4e7f14d0f3503bbeab94c1878360ff2d109e88daadd27777aece38', 'user'),
(61, 'Yadi57', 'Udin56@yahoo.com', 'scrypt:32768:8:1$9ksf5nzQdMDM5ext$3773f283bdc5eff888c17c9b7b98c6e83761d7ea972fe10bf282373dfc9704b4f879e919eaad39e07290b180bda9cb8d91c93f2229fec3bd405c7b31762fb200', 'user'),
(62, 'Yono58', 'Yadi57@gmail.com', 'scrypt:32768:8:1$MaTl1uLuZ0Bj5b8g$5eca29b0e504116ec746ddeeb1efc69d841843eb675f39383bac6c57033a4b79d494273ce28c60a20f036f81b4881431e2ab60e152e2278a9aa19fbabb3a8700', 'user'),
(63, 'Dadang59', 'Yono58@uho.ac.id', 'scrypt:32768:8:1$Wqf2Urv3Q1FIaZ9a$5dcdd7e4ff55f56830784832084f1f6658738a8bdf9ea3febd0c51e088cf86d6f3a2a74a0c04f5161e34bc63c4a9b192e955915ac670671f39de9fac912e760c', 'user'),
(64, 'Supri60', 'Dadang59@yahoo.com', 'scrypt:32768:8:1$Wy3kw9n543aCSANs$5cda1088afbf1cb55484a9799e036d65906c5f3094b1e1027f7f91deaacfe6bafe79a84436b2492c8bd11e014d550b130c9e9d8de8fcd83de81d107ff457ec7a', 'user'),
(65, 'Amin61', 'Supri60@gmail.com', 'scrypt:32768:8:1$FfyJnAuEh17VsI15$3dfddd039e539fbd747716f350efbe61d5c557664ac888e0c9cb3fbe34f73aa4d90ce85eb2d829152669851c61954484d9c3dca96814e3721f6f1344fe9dbdb5', 'user'),
(66, 'Joko62', 'Amin61@uho.ac.id', 'scrypt:32768:8:1$teVNkdYONeRisOF7$57842039633e15faf207fe729e342b668facc267074ed85a16924250bca567daa76736656d47d550b065ce0f10487fad8642d366ad9d8d3c93f9074a30129027', 'user'),
(67, 'Saiful63', 'Joko62@yahoo.com', 'scrypt:32768:8:1$8AeG7A3XNpiabJUO$17a7738c0e865c498b1d71222f074661e1a1cadbf28bbd153fe533a9235780a3871abc5e3b68e02f28ca33866b383c26de40c2c4202b68cac92f9478e32f4cd6', 'user'),
(68, 'Muhammad64', 'Saiful63@gmail.com', 'scrypt:32768:8:1$2BsPNYH9JbAKgO64$0f8a445c586444da1b664ecd9a42a85fb7e5fdd096ac5091dc027f65a3bb439b93c0d558299025d72f266431fdba94b5bac5525fddaff8d23a6f80b9ab34ca39', 'user'),
(69, 'Putra65', 'Muhammad64@uho.ac.id', 'scrypt:32768:8:1$TH4gXdzbiWPeRQGG$2aceaf5cc63ebc28aa76f2a976d345202d6de8faf0a7958a269e7d71d7aaf680d7948148cf0b3ba86f93c8d504ad84da24dc19a083c0a552c8772a43a9876784', 'user'),
(70, 'Dimas66', 'Putra65@yahoo.com', 'scrypt:32768:8:1$IgEYdwcsSd2EvMm3$3640b188277267cc8b5c48b5a8636e74aa3ad3ec4690714205f07ecc5580841b3798ccbbac213b911e91be0d0f4bbcd6f24c536e0b7e63bd813a521d91d55b85', 'user'),
(71, 'Wahyu67', 'Dimas66@gmail.com', 'scrypt:32768:8:1$oUwqiJzDwodb7Rgf$f995e8d950b5dafdfeadb4b78826976f7a097957d00288ae361f7fbd508d874710cead8ae158f4db9661992609f5e89a4ceb89b5a7636c2bfbdb6ae953f0bb52', 'user'),
(72, 'Andi68', 'Wahyu67@uho.ac.id', 'scrypt:32768:8:1$Gn3jOze9SOkSepMM$e9759ae7cef7f4814b878b06fd384a4ff414b92d7b65fdb4326b67f008519c77a164eccf74e4689fcd8f8db7f21c15e6bf914793f3064b1685554da9ddbc6d62', 'user'),
(73, 'Agung69', 'Andi68@yahoo.com', 'scrypt:32768:8:1$L0qqWcj0T24ysut3$778f79e7bb355e0ea696983695108778f95a7618269758c5e6e73ae0136a162f040285a2b4291e5f67e1358c5dbf642a84169839901d6ba263cd9c648ebd4b21', 'user'),
(74, 'Fandi70', 'Agung69@gmail.com', 'scrypt:32768:8:1$SB3OULEjR5GvPD8X$2cdcc0c423566a0d7f782a4f87dfcdf6a08d561c3b7bf3a50f29f603b14b7b5e086fed64628755e868d2067df8f9246d96dc72b3083f1456398757a8c8976709', 'user'),
(75, 'Nurhayati71', 'Fandi70@uho.ac.id', 'scrypt:32768:8:1$mmHxpLHyXjCsxOc1$edd0218e72bd3db9d873bb2a139dcfd881fd141202fc72f46d2cd070b432676f998d97d3b0ae3b4fa1b30369d4c2646cf6c8b9ace628fe45b8b87f0446aa1e7e', 'user'),
(76, 'Sulastri72', 'Nurhayati71@yahoo.com', 'scrypt:32768:8:1$bfZcOjmmdXSpgb2O$ea0eec2006c97d4ce9391b9a6c2209930527254e6d5f3846fbf2ec5eac3af7871cae3b40f9f5f0752dfcec243902f722f3b298621871a489d422f98911b4d7ca', 'user'),
(77, 'Sumiati73', 'Sulastri72@gmail.com', 'scrypt:32768:8:1$hnZ1TRSN73Z0P33Y$23b04d53ca04ea72db61bdb1773629605b150edaaf66a45cff944d98ba0addf4da06662049cb51af4ced0b724c40c40bd76be5561e46a63ee765df56ad5db411', 'user'),
(78, 'SriWahyuni74', 'Sumiati73@uho.ac.id', 'scrypt:32768:8:1$ABpxxeQT2ZVyo7Cp$677f895a768f86b30f3679a396274fc3c6d88abbf3ec95328dfd5ddc692598cf42c11f0c11f97017dad5c16be7daff834229f91085e7c03edce0f4b3db02fff4', 'user'),
(79, 'Sumarni75', 'SriWahyuni74@yahoo.com', 'scrypt:32768:8:1$eqPIB1ShetKwSern$cd8a0621b8c88a07eba2d9c91d15b72a6719e820aac8a95dc9ded416ad0bfa02c1435b12441af6f42a570b53129133569b99359437cb0dea89e482ac7d39168d', 'user'),
(80, 'Sunarti76', 'Sumarni75@gmail.com', 'scrypt:32768:8:1$Rb82p2LDRSxcPypd$19ccd695888e26941fd3c10ede1f9c939ab17c4fa82d95658b182d85924ffd272110fe25ab6eede65919f8947d62e01d69e71805bc3abbd59812925324bd12f1', 'user'),
(81, 'SitiAminah77', 'Sunarti76@uho.ac.id', 'scrypt:32768:8:1$MnXNIqovsY7iNjQj$87a808d7ad0f003c986f7186a2f67876e2fd2d72ed90c399669158abd1c75a9e2a638d3fad6efc0580e0afa79c654d623a17046406edf640b89fa7a740b532ea', 'user'),
(82, 'Ernawati78', 'SitiAminah77@yahoo.com', 'scrypt:32768:8:1$VAJSR9ZKRW5VNgtX$a20f847c3928951566cd3dc4a5f59017c1c46ce484a2a069adc195c29d9815926174535821ecc9408d1bd271756c841a54328e8e61ae12eb07a9a983ca14f186', 'user'),
(83, 'Rahayu79', 'Ernawati78@gmail.com', 'scrypt:32768:8:1$FhrpGqos2HXBirFM$5520c29510931c1707a3431ff278cc034f19eb1af2e4a7d1586a4e8c42c7b4ffd5e4165b8b2b00068bce3305f3eb79f5e7ca180faa8f9fc68aaa7024beda1978', 'user'),
(84, 'Yunita80', 'Rahayu79@uho.ac.id', 'scrypt:32768:8:1$bT9iyUem1DK1rf89$cc11754f16176ac985c06e5c8d8cb3869fbcd76a3c4a94db22fa2052d64e7aa308e7b165f9f3d4787d163d20f04440c144824bf625bb6f462ce544dec792702f', 'user'),
(85, 'Rina81', 'Yunita80@yahoo.com', 'scrypt:32768:8:1$8VwU6aWzKYcXcTE1$7e38b04f0418d8ea1b14a72b2ebd7bec223d25e2179669cac1a79d8c7698f484745d8b263643b644951caf3096b834c0a78342f527c36f5b7f30e0b284b1a8e4', 'user'),
(86, 'Widya82', 'Rina81@gmail.com', 'scrypt:32768:8:1$spjSqi1obli8IucH$4eeedc05bdd612ece3ab399647e69a2271f3409e8e4ef236e56ec9ff6ffa5f8d5bd90fd48085bd808e3b67830e3bb67671db599192f158d6acb27486f19904fa', 'user'),
(87, 'Intan83', 'Widya82@uho.ac.id', 'scrypt:32768:8:1$MT9xUc8HBSQxB8WK$6971a8ab8bf2f76a1b125a9dba56b5092872298a390214c3587ebfed79254e04838e868722d44c7b1a77ba39af10cf78e0c45d854678b2b6a1e20573a4c1f5d3', 'user'),
(88, 'Diah84', 'Intan83@yahoo.com', 'scrypt:32768:8:1$vxhhKwqgkouxX1Pe$6387cd8d9e392ec62a7bcf6c1cda216fb7ac9d1357d307f6134598ac1b719948ab3e23e7088670dab6c5cd8738869c5da562d23c60c4e2a436cf11efd5c10e87', 'user'),
(89, 'Agustina85', 'Diah84@gmail.com', 'scrypt:32768:8:1$oJoCp66wySQsRtjD$88f7fedc8b06f40f5f38318e6ad92bd2c5ca5255aa493de21ea371e45cb2c882602bdac1d99ea88804d741122948288529147f5873d1e4cce24c81b30b079c7d', 'user'),
(90, 'Rini86', 'Agustina85@uho.ac.id', 'scrypt:32768:8:1$AbEjFqJkRryEfuuT$8104f270ff8c26c25a93a6762b4ca63b6978a073796636117c3ec6f0195b8d2b3883a4c07b4ae04717c0a54d97a6ec29eb52c53d446e5b50d35f74d313c27fb2', 'user'),
(91, 'Yulia87', 'Rini86@yahoo.com', 'scrypt:32768:8:1$FGbdt8IGnwqPz07J$03865809af52708dff4e449751fd6274694327f59686ff5a38b64a898b166b7ca89fa6732cf5dca16f18e4a2a7f6f30cc2868fa00c7c97165f40d43d54f7817c', 'user'),
(92, 'Puji88', 'Yulia87@gmail.com', 'scrypt:32768:8:1$wO8ju938H2VmKfyj$d29e9419b55e13164fdf221f7811961f7df8d37b4f6bd6240a62cef3b6250cbf32b6f3fc70bd8e83f286beef89a7cd19bb4bf0c3662283947423c2434b6230d1', 'user'),
(93, 'Utami89', 'Puji88@uho.ac.id', 'scrypt:32768:8:1$VuZoJv7Xa0f0DRgq$3c96733dd7ccf1f06d54f0b997ee3444049fbe6d92d18d1ce9e2125bbd9c34327593c0178e967a071339d052787162d19b2adc23c192bda8a3a71a5f354b4eff', 'user'),
(94, 'Amalia90', 'Utami89@yahoo.com', 'scrypt:32768:8:1$OZ1iDPeedsjDhUae$548967691bed471af7f23fb6934b32dc5b3bb7b28f8fcdf972486b17fcef49c36c1916fb391cf333a1e8c64ddc2fdf912fef4b24461da4151c8d6e4c79496860', 'user'),
(95, 'Dina91', 'Amalia90@gmail.com', 'scrypt:32768:8:1$uUUNYlKE3mxbasGa$e02472f48b42f7c040f36966078c8d4690fce34861aa1b17e2810514f4d0226583e5fe8145947931a008dff779d569fb95c3978fe5289953ccb59858a4b572f5', 'user'),
(96, 'Dini92', 'Dina91@uho.ac.id', 'scrypt:32768:8:1$0XcTkBm4IZpaMc7Q$97d04d7ff24079a24f98887dbcb4a2b8a58d6004b5f6aa02c7ac5a75543eac035fc55deedd40b28c6c321672a400b0dd490726a099d3981fbf3e21789c1d16e9', 'user'),
(97, 'Devi93', 'Dini92@yahoo.com', 'scrypt:32768:8:1$Z9XMu3dGadxmlYWb$a38d07aafcc73bdb85ce5b4e40c6633c4f98d4c1a6b273c916dec1432e36e06224967c12b7303c6bb57ed33715f033b7886e433063c83ea0a91d47dd5802e816', 'user'),
(98, 'Citra94', 'Devi93@gmail.com', 'scrypt:32768:8:1$4AmOFSiAJr6mhNFL$5296466cee292a47c429bf7353aa02d2639687b0b94fbf35b1d8375ccaee6580613ebee556c44005d5ef7582bc2dea86d2d18e168db2fa43e8c8a3947dc1792f', 'user'),
(99, 'Eva95', 'Citra94@uho.ac.id', 'scrypt:32768:8:1$mQ7ULPrXbD6wdQ8o$5ef2835b65012dcf24b02b34577a213fd02c1fdc5f186911f8222f8fea440cb4b41802761d9f1f67a4f27104f925d48507f39c80e66d39e5249fe8ced7be547b', 'user'),
(100, 'Endah96', 'Eva95@yahoo.com', 'scrypt:32768:8:1$zApJ9T6995uWPjlB$e4c5bcf4dbc1416440ba97422231ec4c08dfbded5a60ef99f664b92dd689a935aee5666715994b8c7679edd8cd1cf5b7a78dd2a76410aa2aededf78a67fb43d5', 'user'),
(101, 'Novi97', 'Endah96@gmail.com', 'scrypt:32768:8:1$yMltCYYJFSPBn5rg$cb055347ba2f9d37ef0199eb4873d2418bf3113c1bf19f6301138c922bf6f6b843ee23cbe517eb1cf85693bac818084b67df6d05016e5e2c5cc4f473a04336c8', 'user'),
(102, 'Irma98', 'Novi97@uho.ac.id', 'scrypt:32768:8:1$LdVuGos8asn9Wn5b$ee76ba828c4d9956005196343e64fde854ea9ec367762e22bdcb5a793d772e67b3fa150efc5e4fead6aaeacd7e8f7374da7b3f790a407aefeb26a799708e270d', 'user'),
(103, 'Astuti99', 'Irma98@yahoo.com', 'scrypt:32768:8:1$QVWQZqEpHa4F8jwt$e7ed100c4d35abfd09f927de764104f301b7e829e964ea99dcef810d34d8aa7310cc4bc4df80dbc41c4b7be50a6be547ccca9f887887840951c3d0cf9df7541d', 'user'),
(104, 'Aulia100', 'Astuti99@gmail.com', 'scrypt:32768:8:1$4UnQo4hCsVAEfzjw$49c99b402aa23115f7c199c7c1415bd77e5716df0eb3e836139bdd426ca082b00875f7f58514c7422e89da7cdffb4eced15f9dcd6221238540fc3247fee97216', 'user'),
(105, 'Amelia101', 'Aulia100@uho.ac.id', 'scrypt:32768:8:1$3B7QKZhgHkPxGeCk$67a6f3fed21d338fb6fcde6cd7efa60ef4697b553ebddd8a50d5bc110c3521620f97c1f8401d86999d60c18eb7eaba86831b117b531285cc49f6d4a44016b332', 'user'),
(106, 'Anggraini102', 'Amelia101@yahoo.com', 'scrypt:32768:8:1$7Pj3xSxDoMiZgyjq$e3bd3bbe24c5d59df11a500e1ee1283f125e0628588b675852e183551f1ac729b62f597f8d5bb6acd99e254bb068f372098012b49fed96b026bd6cbb948bf435', 'user'),
(107, 'Wulan103', 'Anggraini102@gmail.com', 'scrypt:32768:8:1$4larUSVTJszOP9AO$de44897253da0df7c3d2f99a46a6359b002c43e7ffe27f67ca07d1690f2e047041864e87505810c67193fd4bbe02e174c521b404ee27f6954af758443f241d0b', 'user'),
(108, 'Indah104', 'Wulan103@uho.ac.id', 'scrypt:32768:8:1$n8DU6ehz212Oq2xS$732303937999ff05c0ac42bd771b2a3948c9b1faf8587a89a37ad3d04a3e89ef1d2e24e892f64be19028b4360a50a7321e01e3d9e4777270f0c0dbdeda837e45', 'user'),
(109, 'Yuni105', 'Indah104@yahoo.com', 'scrypt:32768:8:1$NIfbo8NR2antoJDI$80748c919fe43ba91d046b9dadfca0e5e8a4a040f9616932a0c6d6903d6f82df59813a7110cfc2a7e725e8c0856ffce748218b29ff1e903b2a5f45aff9bfd2fb', 'user'),
(110, 'Dinda106', 'Yuni105@gmail.com', 'scrypt:32768:8:1$SY74B5HUQ5hN0fYh$adc329b360f351bedfc2e2216aca11ab9703980cfd673be8a701b76c0595da61eedf9d30dfb44077ef5df1cd6706a948c102b442911b0ce37458892bcf46072c', 'user'),
(111, 'Annisa107', 'Dinda106@uho.ac.id', 'scrypt:32768:8:1$V7BriN0zhcSaA1ni$cf98c627fa99683e7684e13893c5028842a5706882e1900f6dc5c2edf00c6b74a390bc488dc7aad2f0b9e87ec951b21da81aa1a6259283b07293ac0ab4c379be', 'user'),
(112, 'Dewi108', 'Annisa107@yahoo.com', 'scrypt:32768:8:1$g5603j28fpM2xf3u$e83fc7bc559fb0f70b3bd0220840bc4487f8084441685347fac3bc7c5b3a3989516954e6daca52a050da315ecf2f01dac7d0df7c144206d8c8eb5f43b207307a', 'user'),
(113, 'Desi109', 'Dewi108@gmail.com', 'scrypt:32768:8:1$e9JrOKxKTBceKd9M$0edbc42641f5690207b380204369f161b80a34a6c92f10b2a5f560dc89a03249a41551c2bf4d907936b3c8b940ea59264aa752e7f6eb0b4a91e6d5219e91b4f0', 'user'),
(114, 'Putri110', 'Desi109@uho.ac.id', 'scrypt:32768:8:1$t412ZF6fgFeaMfe0$deff16fb918231a9e9556357c464c0452027b46a34f7e5c4daf9a37c084ab5f88e86840b5747bdf350324eaf8a04133952ba07f3129985354ffec96d60b363ff', 'user'),
(115, 'Ratna111', 'Putri110@yahoo.com', 'scrypt:32768:8:1$SlBV5uM70jiR0F1N$0b5bfe52b38ffb416f0df8527d842d96090f058ff1fa926a85edcc5ec36e7b18412c1d3106cb35d1a283f172d73ef33d6c40dbff6152613247582a125e8541cc', 'user'),
(116, 'Fitri112', 'Ratna111@gmail.com', 'scrypt:32768:8:1$mZuGZPbeTmWEiAFu$064fd435dcd38b2cc82ff2085107658eef83807bd9279d4c5675c835a4fafe78bf74688fbac80a424784115e20ca3fcda448d113bb69354e06cab695758069ec', 'user'),
(117, 'Nurul113', 'Fitri112@uho.ac.id', 'scrypt:32768:8:1$WqrN0GWfNghTFYoi$9794f82ec720fd154713e30cc3723d0aee5fa68ac42dbad402dfbc6166b9956e483013b51ac07bd1c4479949cddf0ef1c214f056c603d651bc793f7c741c7b60', 'user'),
(118, 'Ani114', 'Nurul113@yahoo.com', 'scrypt:32768:8:1$90KRiOKSSY8n7lwz$c27fe8f2096a1e1b3450c632aa16ec8124b3164ecf5b8bda1b998442b608c40ddfe557d5e10cef85c123c19684bbddfcf674758872c3cafaff9ae9032950e8fe', 'user'),
(119, 'Puspita115', 'Ani114@gmail.com', 'scrypt:32768:8:1$3LZdhegrp0kGR7UM$f6be9c36c69f76b403bd036a01424477d80ed02ce5ddcd9ee563c8b670c0638f7fef1f04717e6e3a83a2035a9bc43bcee4f767e7b1aeee25f6fea4f8d11a93b5', 'user'),
(120, 'Maria116', 'Puspita115@uho.ac.id', 'scrypt:32768:8:1$ASgyuWemGmSWa8cR$a3b0367e63f00fcc5955aa63c01b0cb7c9d6f2bcca37e7a707b405c07eaf6dc74f0f70bffc3619356ee11477ea7c258a8cd63664538855444fe15987459ee7ca', 'user'),
(121, 'Ratih117', 'Maria116@yahoo.com', 'scrypt:32768:8:1$JJEjv5q9bh5N9xBg$e6b08256bff7b3b29d192ca2c20e0e4ab039228c41fa31a908cbbc6f2f31850c798ac4e6d60136463f8263f27ca99f27c8bb85b71b8e00f59893794cf4dc932d', 'user'),
(122, 'Kartika118', 'Ratih117@gmail.com', 'scrypt:32768:8:1$En4N0LrBnP9eYzU4$309bd7b13077d29502e60abb4256dc1b020c838e1fba6affeb673a8f99f6c1aec431afbd8a08963ef2f595823c16d400d3fa2dc9a5d51e91047e227c102217ad', 'user'),
(123, 'Wulandari119', 'Kartika118@uho.ac.id', 'scrypt:32768:8:1$FOYyEunuDPO0lMij$32b0f59db7c9fd6747b312442c805997bf5bee910031e571133d23c0efc4cc6de0bc9a90b118a067964c403a14ab1a4b47fb79c416862c0fe36fe31c12b24b25', 'user'),
(124, 'Lestari120', 'Wulandari119@yahoo.com', 'scrypt:32768:8:1$Hp8AxfbamyG6RU6c$1ab62ffe9316a23ab66e29abb2c7acc10eb6baabcc06c6d3cf7c846201d8f08fa98477dfa246768534ef9818ce54ed9ccaef4c3196adbc1991a23c23f12377b7', 'user'),
(125, 'Agus121', 'Lestari120@gmail.com', 'scrypt:32768:8:1$4nzg1ksFHyApTxmf$64fd5a70310c37367b409959cffca97790d3c412076b2195e47a8bf9685618048a624ac97191401e23cfdfd34c3fa23482fdd832a00464a3280d6967f75b0bb5', 'user'),
(126, 'Asep122', 'Agus121@uho.ac.id', 'scrypt:32768:8:1$czhGXD5uItN8OXgm$821691f02ea5383d5b191ce5f698f57bf749343d2453c56a637976ab40ba2883fd94147ab4b87f9f61102073ce78b1877bf438d47bbfafe8883b8936e5048310', 'user'),
(127, 'Wawan123', 'Asep122@yahoo.com', 'scrypt:32768:8:1$aMLih8BUVeJ2Yj8b$be75f0cfd9289b6ee8ae115d665890cf2ffc98b3f14d3c88012b1929f9e7b115797d5a91b9b86ed47d9da92907d88ebc91a346efb968b674020f36e82eb5730e', 'user'),
(128, 'Budi124', 'Wawan123@gmail.com', 'scrypt:32768:8:1$yeYjiQhzZJPdpotG$d63280e0edf0d72395eefcb6f7ca00aacc7367e70f1373e6018a627663b481a5625ac61297db6b91530554bf61f64e88c70a99fb3cca8f7b111ae79067fa96b3', 'user'),
(129, 'Bambang125', 'Budi124@uho.ac.id', 'scrypt:32768:8:1$ZRAkKT4i7waqLEGG$985a26f458eb4d0fc737ace2c605ecc478936c8a97fd56b29582b66cab437b605a4c6aa344be20be40d28beac64ea6e0aba644bc47e0ffe369c572fcfb4bbb9b', 'user'),
(130, 'Slamet126', 'Bambang125@yahoo.com', 'scrypt:32768:8:1$GOPqLhP9Wczswt0v$1ae442b15c17237fd0e9d847f368b04a00374e0eb06716d03293951d01c07749cbb951818b7012d8ca55aa1c57fc428e263705249c5ecad75b7fb4d62fa3c1a1', 'user'),
(131, 'Udin127', 'Slamet126@gmail.com', 'scrypt:32768:8:1$rDs9fGkKD7ogr1j5$b07000ce706fe4b91f62f62ca384fa231cb3c070256b106d3bfdaceff6a4da82fecf0d333a9b781b98321cf50d1904581651c06b4679469052c8432b3861d259', 'user'),
(132, 'Yadi128', 'Udin127@uho.ac.id', 'scrypt:32768:8:1$O3nVuoh6kqjeAKk8$1c620d8925a533b46c83efee732d2ebb1ad1fd778335e411c80a5e209305adccf5e6379578dac4ebb786a71e1eacfba21d7f71ff0b19c46a4b9dce1e72f1c59e', 'user'),
(133, 'Yono129', 'Yadi128@yahoo.com', 'scrypt:32768:8:1$wUGyzUYf1MgpzD3B$668cb7daddc0c6e7ad9ab5dc6e2414017a8cf136dd58844c0e02f63eeac9172240c6127cb37c880841293ecd9cc361612ccc2d3b5b1c9acf89e37fe5cbae3858', 'user'),
(134, 'Dadang130', 'Yono129@gmail.com', 'scrypt:32768:8:1$FXntvxHjbohtmmV7$64a0428d7eba0eec21e29b5e3ebdbd0ba06aff766bf49757a11eade784ca0454459480313c2815b7460269530461fd63191fbc366dbb6e40b8e369f83115bc03', 'user'),
(135, 'Supri131', 'Dadang130@uho.ac.id', 'scrypt:32768:8:1$oSGJ3qqGrTM5bpHD$0b6c2049d12a1e2fcd2a02fbf85ccd7720fc8319d8dae48f5282c59c453b6c50b15718ff1c4976a126ab464eb14c80667aabfd589878e80547c7ca411df67e7e', 'user'),
(136, 'Amin132', 'Supri131@yahoo.com', 'scrypt:32768:8:1$NqZvb8dvO3FeZcUj$d62492ba3d92fa1eb8af6ce587d8ec17e723a67b65d02d60eda874eaa0c6eee45a0675f5212d6b931e0dd53eb499a467152e4a583822cfe3ac9d06efa82bc34a', 'user'),
(137, 'Joko133', 'Amin132@gmail.com', 'scrypt:32768:8:1$si6iOoCgBIFZTnOB$12274d8313e6f5117fb5b524400bfcabd0ca265c502a26c9a1ad1d7916c0ba81df02e37b14c2a28acf7244bcf56e4ce18f87445de6a73530aacb7307edc56435', 'user'),
(138, 'Saiful134', 'Joko133@uho.ac.id', 'scrypt:32768:8:1$N35CCPafCBKqvghe$572d0122ba7007e02fb6f7d23d1b2f65123e50fd0f93f94529ab51880036d713394a97abc1892736779e246c9f80a03bb39b734e7bdf21830381e4ba8eaf907e', 'user'),
(139, 'Muhammad135', 'Saiful134@yahoo.com', 'scrypt:32768:8:1$4DrhrpCCSLYOIw0F$d3ad710d418c484ca8abee35a6492558cbc3cf0d6748d4b35fddf1e60c19f52ddbe3ba0a33a4a6c6edcf6ca903bda10e5357bc8f81561a69ea9988eb67db6064', 'user'),
(140, 'Putra136', 'Muhammad135@gmail.com', 'scrypt:32768:8:1$eJbEvKkxYYfydcOG$aebdd531644a58f0308b04c8951349aca87062a72740aa77b7413c753b23f760a3f7df14edc9dd91be0a218ad15fc99df02a6397f005f5c0e9eb5ee41f546046', 'user'),
(141, 'Dimas137', 'Putra136@uho.ac.id', 'scrypt:32768:8:1$bx6qnGVjMKMpgddv$2bd61336d3d2c06c382849fad351b9500a38070577ded7e4e73673b383a5dfa91ccf5ff1e9cc99eb8361727137ef2817f7808aa6dcba765108873d729490387f', 'user'),
(142, 'Wahyu138', 'Dimas137@yahoo.com', 'scrypt:32768:8:1$P6C6Qv4V20i5kTiD$46f769ae65afa99e31019883f0b6a236fa4149198878db59fa32f3789ee0c4db363a7a6fb029a5d4bbfdcf8860eaab36ca2c506fa0b760d48cc4fd00de582e6d', 'user'),
(143, 'Andi139', 'Wahyu138@gmail.com', 'scrypt:32768:8:1$QZU3fbFtttf2wJ5M$f1f9eb5bef7d1339e756c017340fbe335752636c9301056b8c3b449b47f0aa84cc33cd28b7829533ead50404e7ac524c564b2851c83e797fba69a58084fc5178', 'user'),
(144, 'Agung140', 'Andi139@uho.ac.id', 'scrypt:32768:8:1$cHwMJ3AmUDQNdjyf$35604b95cc2a9b205201ff2c8e77b582772fd04a07e06c456d99186238fe3c01d3a8f931c38c38a587ea50727708509428d7927f28dc29bb50f0730aa0ff6757', 'user'),
(145, 'Fandi141', 'Agung140@yahoo.com', 'scrypt:32768:8:1$tXnbMuoEeAuHjlu8$0a5cc7b364f92f1a80a0b8a50d16c957360063ceeacd6a0eedd616e3beb2bfba6a5b0f0720a6c07bb7f5106d48e5d25968dc96f9e9d3aafbe4370a7b7bdd4172', 'user'),
(146, 'Nurhayati142', 'Fandi141@gmail.com', 'scrypt:32768:8:1$Il7twtqVDjcfyEhB$32bed79da32f6ae4e8bf881db4b69b90f748e951d1bbc37675c9d1f0b3067b4ab72f3c8b9a0f3eb49ba4b50ed443a39e71a232fb10b4a66c53514265f9edecb4', 'user'),
(147, 'Sulastri143', 'Nurhayati142@uho.ac.id', 'scrypt:32768:8:1$Af3iFpDieB3ivmTH$491ea587c085737701d83e0bd7b3b4317f932d8e8d1ba53ecd545798ea5c9537683119c52bbf6a586c1dec65046a1bafa694df27999f85e8fadd9b3c14bba304', 'user'),
(148, 'Sumiati144', 'Sulastri143@yahoo.com', 'scrypt:32768:8:1$jcBKxvMjjpyRz7cE$86033f8c8eda4a6286568b3f25228789853806a1a64866d0aacd14ce2fa54d13477a6488c6be9bfe299b59b849ab55f9b4ba56845082a9960af0d81da4a9e488', 'user'),
(149, 'SriWahyuni145', 'Sumiati144@gmail.com', 'scrypt:32768:8:1$8DlEjjPzbmh6Stm5$df06f49c5a375486fcc40a4a562e83aeeae258001365a8d688e91ec0ab13a12538d89d6e6819b914611c8b66c45dbbfae3b6259d408560e44fbf3ff7e9ba8374', 'user'),
(150, 'Sumarni146', 'SriWahyuni145@uho.ac.id', 'scrypt:32768:8:1$F6pYWZb1zBY05bdM$53936413275c716cbb008856b69c93e5fd00e1dfa8566293af93165e978ef79bb8acca86f7432d745247b152c1985f6e0c8447124efde873e703bd758260d900', 'user'),
(151, 'Sunarti147', 'Sumarni146@yahoo.com', 'scrypt:32768:8:1$DaxQkSTK3saVjkPX$4da1f6e2e33582d9e2fa2ad199ad818bd5c3179b79291b6078376bf7f91574c72e4fbc0454b46dc15c119e4b56379c751b9339510a7d61372689d5b23659562e', 'user'),
(152, 'SitiAminah148', 'Sunarti147@gmail.com', 'scrypt:32768:8:1$KGt070tdLu8ORwiP$c22a763ac0bdab4f9579499bb217393036d69c162c4c4be091a678391c46d1ee4e15ab339f627e87400c6c956312c5359760e69f97a0efe66d2bb0965e1926a4', 'user'),
(153, 'Ernawati149', 'SitiAminah148@uho.ac.id', 'scrypt:32768:8:1$kDcb9o4chdyrg0l1$b0881ef1a838bec6d4d4a1c83c6f06fe41e8246d2ae7a0869e6e803f515b108e11476e2b22e3b791398cd995cf89c25eae32400bc60ce7750dca549c3c460009', 'user'),
(154, 'Rahayu150', 'Ernawati149@yahoo.com', 'scrypt:32768:8:1$XNbD4AtpTxSGMmEZ$98e931d4eae2e9bf445fd05a120c69520d446400d1ac1c0e15717ef8adaf4217171875b65846a72e09c3a8dba430d19071f44f0143b262e15994eb551dc84dd6', 'user'),
(155, 'Yunita151', 'Rahayu150@gmail.com', 'scrypt:32768:8:1$asLDEsLaxTRuFD6g$24980cdb6563da52111b5c50878d3c8242fa9b82312266e2d27cabad6a638665100dacf89a7efb0657352ea14fd6cbd7c51cb2aef9bdbc3c146871efc29c0828', 'user'),
(156, 'Rina152', 'Yunita151@uho.ac.id', 'scrypt:32768:8:1$sMba042sVGp9TzHc$d0003856e6e4e7809aeb2dd4b6dcc015592c6672f82c1e44d1fdab8cf50327f82df0f7f327701e73ee507903fa67238bd198cc08d409ce84e7b36fb190ac5171', 'user'),
(157, 'Widya153', 'Rina152@yahoo.com', 'scrypt:32768:8:1$Z6yMSjNipczccptg$d8615850592a0aaec8d2094cc9eaaf8eb9acfbc9d6f5366a482c7367c971a001e113823b1d23a4bebe738875231c1588e9241f05ab639a2404e29e4eb863ef52', 'user'),
(158, 'Intan154', 'Widya153@gmail.com', 'scrypt:32768:8:1$ljRrUjRB2SaomO4V$745dc2979e926b95ae1c87ca00bb8a38037fcc981b6d6429fde6087a971b657cc0b8ca7726b8a50d24019d7c3ab8a975bec7f5e1b524ff54729ca468d3fff25e', 'user'),
(159, 'Diah155', 'Intan154@uho.ac.id', 'scrypt:32768:8:1$0Y1MU2IdJG5vNsBu$ba3787ed656ffa8bd68a483e72a2976205088a0c93a6da2b2bc390b12de1692712427bcdb9534546b70a0bfeaa929808489a0d59d4907df9fba694726655233c', 'user'),
(160, 'Agustina156', 'Diah155@yahoo.com', 'scrypt:32768:8:1$yOVxszR4xLqiwd2K$501a3973210a7bcbd01ef7e177132033b931cb4267060772e8a5fddd98fb36eb3e1f1ed96060d8231f66cf9260904b385747ac6a2e9d9ab6b1e1eac9634e4fb6', 'user'),
(161, 'Rini157', 'Agustina156@gmail.com', 'scrypt:32768:8:1$oHXBnneiBn2Q8Zfo$843a56738aeededc303265df3bbbff85ca02007d64dfc8e361a0d6d6b004c817d458d2207fdabf9896a9915568d63ee7a112d8941c30b3df9aed732efc6b9991', 'user'),
(162, 'Yulia158', 'Rini157@uho.ac.id', 'scrypt:32768:8:1$cRlQc1KL7MQmWwbK$85b6d3bdd8fa69626f536a2ddc689a05564683fd89aa89ecf4730c1b949d17dff7510d81f7457f8d3ef0bc40d0576f0836d8fcc4f84a7aa8dc7480e17cb89d2e', 'user'),
(163, 'Puji159', 'Yulia158@yahoo.com', 'scrypt:32768:8:1$tflrjAo3dRvpX78y$592d419ca8d6b52756764f40e9d31bdfcf2a4b95242697968d9cd61c5e26b003816c2a8c3176257fd51bb67005f9b44d1219a41e42612cabc13e053ebdd6fd17', 'user'),
(164, 'Utami160', 'Puji159@gmail.com', 'scrypt:32768:8:1$icdUHKN2Pc7ArucD$adaa638ccbd9e1b1ab885da673da6f1e40175b3d2a3ef5ba8cf595b67e710b6c54a7a6e0a4afa4cbf878f2ed2a687baa8e88cae77f58cac31f876cec316b0df0', 'user'),
(165, 'Amalia161', 'Utami160@uho.ac.id', 'scrypt:32768:8:1$qrFQY42viaEVQGBv$cd636b03a60d6f672f3ed233cccc905f54548f6bd1d846b927efe6e60f59a0a4c959367eb969bdef21a2f9772151fd89422758e3a67628ad02a44f1787f2de28', 'user'),
(166, 'Dina162', 'Amalia161@yahoo.com', 'scrypt:32768:8:1$32idy2p62DWhiQ2t$f240cb7133596e27360d90a68f8166f07a888f42528af834e968492ae4bdb9f7505432ddfe364708cad3dec1b50956327fba9bf1050346ad25855bddf1ee67a5', 'user'),
(167, 'Dini163', 'Dina162@gmail.com', 'scrypt:32768:8:1$SCb1XcisL3V9QN9y$10a6fefcaa69728a63cb73a25a0233151975402ced7638b4cc28081505e7729b9b3fe2226d29dfed070e643ae86b4f627c5b746778ad98e59dd054ab1f9c140d', 'user'),
(168, 'Devi164', 'Dini163@uho.ac.id', 'scrypt:32768:8:1$GLnWJL7ruxsUkjNy$f1fad6126ca30daaed78c2a067491d24f7ac329dac6a1ca839cf1b338832defba7a8f484fbdb2471d1c1e369980377d90c3163837b2328723ff438c031b2968a', 'user'),
(169, 'Citra165', 'Devi164@yahoo.com', 'scrypt:32768:8:1$bkqUqxN4CmMd4jru$b82b068bbbc26039219ff6c980e797a84262132f6586da9db4a4a18381ed982a1a18a4bfe4ae138909218838755053c7a8942621b59032c9cbacb08430e88cda', 'user'),
(170, 'Eva166', 'Citra165@gmail.com', 'scrypt:32768:8:1$vS2QXeOEdDOzZPTa$df54ed78e242e579a59461d670fa355688cb31195cb4177cc916f9fa21a44f01183251a93defe3ecebe60dc9daf05060059c06ba7f1d4ca90ec158be19a79ab2', 'user'),
(171, 'Endah167', 'Eva166@uho.ac.id', 'scrypt:32768:8:1$kNtPGjsFPt0MLpVg$9bc806f161e613e0c645942010aab7a6a71bedff6736c4099ddf7813fed5b32f19755cb6d5510e53817f0ed901d371d46ee2bb1d07b5226762d2fe983eb09121', 'user'),
(172, 'Novi168', 'Endah167@yahoo.com', 'scrypt:32768:8:1$1nVmpqdmBTOncsyd$392da1a1bf46d5803d36f895bd0cafa6e747169a1c63b2a890069f089de474b85aed272c6f7297ce8c2d7d97820954ed43a853324bd48173c519df1fe678904b', 'user'),
(173, 'Irma169', 'Novi168@gmail.com', 'scrypt:32768:8:1$sWqzXiAXj20VpdCJ$ef51b85812ace7b0a79e35c2e831d4ff0e6cc5aecec8e771dc7be1f42d641973ed631f53c9db3999aee94357085d8d40aee0f4797470daecb8aa9ffa5ac7cc5b', 'user'),
(174, 'Astuti170', 'Irma169@uho.ac.id', 'scrypt:32768:8:1$OFfN362UDFfazFRY$adcdd47af6c05b172a8f38d9c49560523a1d3cddca5c936bbee1674211a950370da839f2b9fe7ad25d7d9b6014f0533c47d69b9180c98a19d0ad9614741e3819', 'user'),
(175, 'Aulia171', 'Astuti170@yahoo.com', 'scrypt:32768:8:1$ApikOIkiLasMhOnP$163348d01cbccd172ce2961ee0320c25072e0d2e08b1d45331e53280578eee0c28307bfedac6c32fb00e8892b910ff43b8f90afe3ec05a618397d3d0e76eb655', 'user'),
(176, 'Amelia172', 'Aulia171@gmail.com', 'scrypt:32768:8:1$jP3lCTlYh6eaqd9x$aefaa9dde84a61de14f867941f764c0b4d7ee35bdfd9d8147181b11e3584d938bfd9e73f34d9785567997bef7b76344a23373c4b948fd55657bfcda1cde1d03d', 'user'),
(177, 'Anggraini173', 'Amelia172@uho.ac.id', 'scrypt:32768:8:1$x24rYowAvzb0KSiE$624fb8112a60bee93a097e7b0e27f2f0bdea4963c8257fadbeedc04846d3dd8d064d017ee9c7402b328659b26f2f2fe2a30be66b8e7c783fdfca757b3f040b66', 'user'),
(178, 'Wulan174', 'Anggraini173@yahoo.com', 'scrypt:32768:8:1$Fdo6wBETwGLkOvWo$bf3a89044b108c97feeeae003b78c4ccd1042d6df4ff13326b05afcdfa861a722f51b3185cae17093b0b141ae5f972fbbc4d3eb7d51c45b47432f6e7c28544e6', 'user'),
(179, 'Indah175', 'Wulan174@gmail.com', 'scrypt:32768:8:1$ICGYjpN7CR9GphAa$66c013b1dfb86a236f951254b2a7e76c6e91cd60c7a63e2a7010f4d11ac48801b44da9d04639008e16d4a17428d7de1307add140f7c467337b6a145048a6eca3', 'user'),
(180, 'Yuni176', 'Indah175@uho.ac.id', 'scrypt:32768:8:1$WsRBS5UNXN3CJF1K$89438f0460eab01de9a773a0829277323b11e895727c137abf97dddedc9009a0571816efb96056c14052b8df6a43d69fe66e4607432364248e8621a4c251cde7', 'user'),
(181, 'Dinda177', 'Yuni176@yahoo.com', 'scrypt:32768:8:1$s22SQ41oTSyYBQWF$4c87551ebfacbef403c91d80880940f4273454ef05364e8e9ed9b77c8daacad03b2a8a88aa60b6bcd6a60dc5e43ab32cbdd69f778566bb18a647048bb5f6e1d0', 'user'),
(182, 'Annisa178', 'Dinda177@gmail.com', 'scrypt:32768:8:1$lVRQVwDb1apMVB7z$457fbf804a4b76dded059a629d650b9aa9639c2ce47f410e5c45962b08e0b43d7e648b3121b0c33471fcb06983d8b73165ddfc2bf490bde0735528cdedbdc7c5', 'user'),
(183, 'Dewi179', 'Annisa178@uho.ac.id', 'scrypt:32768:8:1$GdxvfRKxViG7vSXs$4596f28c25a7cc27f5566f343cafac882f8c4bad34b780f3d51f9365aab85726aba2d308f7a78749314718980445ce093b49fc24ded452d92dc4893705f4d6ff', 'user'),
(184, 'Desi180', 'Dewi179@yahoo.com', 'scrypt:32768:8:1$p1rkuLgaJy2SfstD$823c99bbbad1cb88c2d22c15b5a5b9b67bc21cc822379836c3299b69de37fbbebb51f8a11b3ec4d17a0fd55e2338bdd70cb59c0c8635e18cba8ca33ef898536a', 'user'),
(185, 'Putri181', 'Desi180@gmail.com', 'scrypt:32768:8:1$kIxy6q3UOEMjCwPn$951ec4fe25c5b4f04851f03054bfe1755af508206c94aa757eaa800d525aecc620d432efe557985e07c09c955cc6de72fa083f839d0c90b6e30d22125c1e1328', 'user'),
(186, 'Ratna182', 'Putri181@uho.ac.id', 'scrypt:32768:8:1$856gBbkBYvkbrA7o$d8b221e5cc8f3e95f7ca3aa2cc8759610084059bad7edad63e6cc64ceb6bcfa75f0af386b215d66988292ba1a3cee54ea71485a6e8d9e1050e5f8296fb1aa834', 'user'),
(187, 'Fitri183', 'Ratna182@yahoo.com', 'scrypt:32768:8:1$1CstjspL0Xr0hE1Y$26d287f85db605e4d2588004d5b2c1f8da6cb08d595ee16a4c44435a06a79143ee9fa94ed45c4e33e1ca2da7ac16b89557e3cc22c655670cc1a4bb983fa2c386', 'user'),
(188, 'Nurul184', 'Fitri183@gmail.com', 'scrypt:32768:8:1$XO2hFqyseegKEI4I$4837aaa074d2592028b1cce9a21c2003a082aca6b9529418b8783d5862da9dad03614e49fc2de9abcc58827c7372644d19c463ebd0d042ffd6ecb669f8b6d738', 'user'),
(189, 'Ani185', 'Nurul184@uho.ac.id', 'scrypt:32768:8:1$ROwXuoKZZ8DZ4Wfu$e1899c86529d0f3c53225357bb3ad26bf3ee6ebbbcca5b2f8448ebb6623efcf0aea2bf83634ca4a019ae61fa84f9f9bb469d9a7da95f45c5f775b77204e94fc8', 'user'),
(190, 'Puspita186', 'Ani185@yahoo.com', 'scrypt:32768:8:1$5IYOMBThMWjtrWrk$8d63ee162738573782905c688c205930f8a48b4d3a0b2dad8714bbdf35d8eadf855958e26551b6346e29b5bb10cd3555548e3dac74badc0fd15e75be186767d1', 'user'),
(191, 'Maria187', 'Puspita186@gmail.com', 'scrypt:32768:8:1$IosPZIIp5ouzRE9y$14f8a3f4b363d11bf9690b2034084f0d13f9dcfc6794ebc0eb82d5563548495b68106b5826f60803e399ca142c150f846b3fbfc44c87e3a1eed603e1f3af4d25', 'user'),
(192, 'Ratih188', 'Maria187@uho.ac.id', 'scrypt:32768:8:1$rtSW7sVVhHYqCQe8$119eaa21ffa26e387353d6e5ddddca87aa84fdb0ffc2ae2f71b6bc0165fca2d65398f8b05e148932a8dbf0d22222e50f3276be0e64b173b0a0f1f42a76d75efa', 'user'),
(193, 'Kartika189', 'Ratih188@yahoo.com', 'scrypt:32768:8:1$uRXgiPlA5zzFl6cJ$ead0255400fdded9a834c5a16cfe99bc3cf70d2b1a8fd8c654cc84e833a423223d90afae6e62ed163233866e448a4724858c61b6fb712b8c5f42cd187e6a7fce', 'user'),
(194, 'Wulandari190', 'Kartika189@gmail.com', 'scrypt:32768:8:1$SKEVeCINEAqIQeyS$9f032bb5b5f97068327d3c82953c1f038dde65e713ff16c702276484556e8e722f5e27f53f9b955cbe5db02662cc8004b3587288533f675df4a1883ac6858d1a', 'user'),
(195, 'Lestari191', 'Wulandari190@uho.ac.id', 'scrypt:32768:8:1$zTU4OQwdPgXGs3D7$0795c5d3cbdca158055191a94967a6168cfb3f9fa4135425168bd61190811edb0d879c13de4543d64b25e69f00dca1333243b01594a1dd86e1e40b2ae6cfe388', 'user'),
(196, 'Agus192', 'Lestari191@yahoo.com', 'scrypt:32768:8:1$fbCkyJLYQbaPz6I3$b9fc880df35d0b6cd85bc41a2d98a20763408253c2d7f133f3c878957f3bddfca7427e1359ba68ddb4c440da3c449942542972321267ae482f17264a121242ec', 'user'),
(197, 'Asep193', 'Agus192@gmail.com', 'scrypt:32768:8:1$nM0rnz2gxhD771JK$bc072949e544dd338c905354b6204c0a5da2240cebf2deb8e1a03b00880f5b4f4fdb31a2022517470b7a68cb6a49c73b359a05a259dafd94d718712c54218151', 'user'),
(198, 'Wawan194', 'Asep193@uho.ac.id', 'scrypt:32768:8:1$dAcz26z1SyfATimX$2e649acc3498c15ab36133ab26b8fd8965d36aea25255f5aa645f90a0bc53cc9a7445007389b711c99c4789379f5b363a408397b28018daf433aa94fa080891e', 'user'),
(199, 'Budi195', 'Wawan194@yahoo.com', 'scrypt:32768:8:1$2e5Z9s3r8LltXZMG$5c83e09afb1b2ec862f8630524359cbec6fd9cc60c310782b9d1d1164a7e5e5607e3b8f5b4dec42fb39752d4ae9a20a0a9e95c90fc3bcb64386be8addec5fc98', 'user'),
(200, 'Bambang196', 'Budi195@gmail.com', 'scrypt:32768:8:1$5BjkI6THSHj60q5V$9fb017fb588640361cd2bcb8af7f0f2b7031249d8b0a93f86019efed393e9e36cb2ee301d03682d97d64c3109c37ec2ff375926bb9bc1e121ceeb6c024e12e90', 'user'),
(201, 'Slamet197', 'Bambang196@uho.ac.id', 'scrypt:32768:8:1$XNDEYfWsZEKrMrkR$971e84283451fba55d5c2564d9687955a11957de9845c18fb99b8382fc0b62983f648daf8d95fdfa4f2dd42b9595df1cdb2f6daf1b3f38bd2f2f6a821f6f7d0a', 'user'),
(202, 'Udin198', 'Slamet197@yahoo.com', 'scrypt:32768:8:1$Pp85IbBFfiQFZDDL$8d39c817b88dae68e3819419d1f869fcbe8fe2ee6185178c377240bd84c84e1aa1d62f312b40139af16a24590595b85bc50f849836e5f9368a054c5b6ca6aa12', 'user'),
(203, 'Yadi199', 'Udin198@gmail.com', 'scrypt:32768:8:1$8VWBTunQevMCzZs4$6f3800d2273b720d75270a6a15f041523e735816efa3dac7a21148d3e6d93a28d840fb56118c544ba954241126dccc0512e840ec8ffa3f0643bce0111da27314', 'user'),
(204, 'Yono200', 'Yadi199@uho.ac.id', 'scrypt:32768:8:1$IDCkvhQm17pkepUa$7586aab75f6ab1bd58820a11726b12359edb81dff3ea89eb65e951b48373322212afdc81bf06b538188bbeb24e28182a384290ce0b80cbd67de62e89089f0128', 'user'),
(205, 'Dadang201', 'Yono200@yahoo.com', 'scrypt:32768:8:1$tJYruM1ti4ccBTgA$c652d9a3fa0bf9871382464fab06f1653ab0e9e77e933973fa386f58244702d7a9761491c645a7b778e19f94f37a23ab61708207cd276c9d4586e5455bb453f0', 'user'),
(206, 'Supri202', 'Dadang201@gmail.com', 'scrypt:32768:8:1$PX5QaSmYpDnQvxgq$eb98b3d20d396f57c39a88a843e7e76ea188e68e5350015073bb8e3f01b23be20ffc0a7f1aeb9061a5993e56786b41c669df6cf71474041a5aa020faa5a3cd73', 'user'),
(207, 'Amin203', 'Supri202@uho.ac.id', 'scrypt:32768:8:1$MXbdi67qezSJQDEc$35a8b44129b5864d377cc6520df0a1e192f25439543c806e37b11df6b11e1c73c58fa8149b2520dc1f53093b9cb8494349fee03e011f5ff66d9cab6f19dd87d3', 'user'),
(208, 'Joko204', 'Amin203@yahoo.com', 'scrypt:32768:8:1$W5HAZmG1f7CwLxWk$cb8409ef833d591b67b6b5e36c2062f1a21082d0a04a4150882d920c0a12d74c5ce20fcba144b28b70fc5d268f670aec97dfa3deefd90857022248ac17d61791', 'user'),
(209, 'Saiful205', 'Joko204@gmail.com', 'scrypt:32768:8:1$lTbBSxTLdwlGUODf$3fceb99fbee59a230e657089e6d25d14ae3916a8099ddf293d4b2120d7b9d8e98cea2528540d3d7742836b9943982e3a97d49c647968d7b1bafba7fbc10abd17', 'user'),
(210, 'Muhammad206', 'Saiful205@uho.ac.id', 'scrypt:32768:8:1$swnj6s3zXt1rTX41$f7b330922e369a539071ffb9b415139663cc766093e672db28b37aeaa45e0309df59ce1ba24f91f703b395e6119dd4b701069bfa21544e9e6de5ef9ad0fdf202', 'user'),
(211, 'Putra207', 'Muhammad206@yahoo.com', 'scrypt:32768:8:1$GbdmnxzIT0SorHSm$32b1e4299aba34c6fba5da372edc39fd5796def482abe66305ac855804557934fc59aace1513cf954f0756df227e8d665bde75cf67340f5d6b6edd0757949401', 'user'),
(212, 'Dimas208', 'Putra207@gmail.com', 'scrypt:32768:8:1$x1BAWpNfqRH3dI7y$45891b80c58eece7d2efcd595c1a2580fa77d180de86a87191ca1e77f7f509933215e87214a016a00d23113f5a6d66e359e8b9ba4a2a334a31bb6fb6c9d391a3', 'user'),
(213, 'Wahyu209', 'Dimas208@uho.ac.id', 'scrypt:32768:8:1$byw0DKzIkbdQ0D9o$09f71905820c4418a1a3ff2ed685776256ae18223c1b3a7ac9e131c6f32a5de730a1f5cef96c42b5a20ecccd3f36c1b5b493ec053552291efbe94ef3deab2e64', 'user'),
(214, 'Andi210', 'Wahyu209@yahoo.com', 'scrypt:32768:8:1$4T3wmJZXWe3a3AA6$f35e87c901aa15df83555d32bea0ab5cd59aedbb1d5820b97f399ee24f024df0a886de2e7642717966747f5c574ab52d786678373fdff03be9d16017e4545320', 'user'),
(215, 'Agung211', 'Andi210@gmail.com', 'scrypt:32768:8:1$GkJr06lhMVTIZf6O$5393a6b450f87a2bcfd04aa71f1c60d6ee7699623bc3e1d74051bf33f95e8dd2ef304d946e0c8874e481fa9c7f21358300df5cfa0e2936cdf61d4076f8cdf6d0', 'user'),
(216, 'Fandi212', 'Agung211@uho.ac.id', 'scrypt:32768:8:1$7642bCVFqXplMnHl$b2638d0a83ac6a51630fd342285ff5e03a0d6285f6b82fbc2c865ffaa4a658327e87481eca6fd3e974d19817b4cf73993fd5567709624ea32b688de3b38df6a7', 'user'),
(217, 'Nurhayati213', 'Fandi212@yahoo.com', 'scrypt:32768:8:1$vKFaxPz1HHnHiALz$390a9dd81b5dc71804659e3e811fb083b3a7e21fe3dae5f759d6b8b95842dd1d0c5f85c5d3c8eba1cabad12c22d301b0c756fc26a0fa08bd818cd97e7effb5aa', 'user'),
(218, 'Sulastri214', 'Nurhayati213@gmail.com', 'scrypt:32768:8:1$pVEscqNFEOiVsJnN$881250d42c9e347dd3c8458cff613432f1ae5a899d4d6b89c4758473fccb843d30785a93486c79f537e9e0f311af94bdc00ca79dd3407e186b64a41683fdd657', 'user'),
(219, 'Sumiati215', 'Sulastri214@uho.ac.id', 'scrypt:32768:8:1$I31LMkYg4ZNEl9Pi$3d690d2b73f3fd892010a32ffcbad2c54e2bcc399e2aee9cbdd2359081e76bbba0298884e00c1703f44b0e8674b40ee193db8861f6aecf90ed68e13b19be9825', 'user'),
(220, 'SriWahyuni216', 'Sumiati215@yahoo.com', 'scrypt:32768:8:1$nSvd1ds7594xHMGz$c6596e3744aca3c069a82989cbfd49b6a45c54be2c7e278625f0e66b6a1ed66796a0966c2bfc92f6c5e68f96e017d76c7f20fb842497ecedeaa38e802e491903', 'user'),
(221, 'Sumarni217', 'SriWahyuni216@gmail.com', 'scrypt:32768:8:1$Ldsu0fuxUwzWQGHA$cd074d71d0261a796a64f3278aaa7fb18b28cded0c660d48c79d5642ca44754f823b3a6deae6aef819e72412ce5ccdada6b000983a3d9c2bc164b7a033464be1', 'user'),
(222, 'Sunarti218', 'Sumarni217@uho.ac.id', 'scrypt:32768:8:1$lynww3DE8aFW5Ac1$865d6b30ba16b777b8f9a329f71c567d9e028e1ca0f395e9fb13c99cdb0175b1f37b50ef78c8b8f4f17c379a007e43e5480b959e97f087fe7519d7779e8e4d06', 'user'),
(223, 'SitiAminah219', 'Sunarti218@yahoo.com', 'scrypt:32768:8:1$pLSDTaWjuwtTdIHn$76c4f213580cdb9b0f699ca7e042b3b1fc628067c4d98ce0336176303e76f11f38ac96f8e5e706c998f6469346460f5f0315a5925babc9da7bd7f29d63bdb5c2', 'user'),
(224, 'Ernawati220', 'SitiAminah219@gmail.com', 'scrypt:32768:8:1$syR7EM45FUswcXHr$9e7fcb434d1dc7cc7482d0eb234a9aba4de2c2e3800fc86c60977c795c7295680205afd58295700533c574cfa5ae51dd71759d887d2b9065f3930cd8f136b04e', 'user'),
(225, 'Rahayu221', 'Ernawati220@uho.ac.id', 'scrypt:32768:8:1$rfPHXiZbinLv3GoV$94431a7d2fa52a498f2c51c6baa844515efe2acfeb6f521e610338514705c83a16e57a8a9fec194eb024930802d366c0595d848520b70a873e138155a9654c0d', 'user'),
(226, 'Yunita222', 'Rahayu221@yahoo.com', 'scrypt:32768:8:1$pozf4oAwYyh2z5go$0844f25cd3f76b66a28f85986531237973d37539973775f0c462c9cf458b4bf0e3beb1accf33a5e27c4471294addde1b456ecd0b465d98fc30b6f1aa47f69e78', 'user'),
(227, 'Rina223', 'Yunita222@gmail.com', 'scrypt:32768:8:1$XxPRfBdbc2HvPAlW$e62e1a373b888ed93fa23640d74fa27dc2c8b983b6b29f3acc986853105caeb3c1cf83c77e2977b56dd19eacbddecc9969353a03473b63ff08123714e33edfbc', 'user'),
(228, 'Widya224', 'Rina223@uho.ac.id', 'scrypt:32768:8:1$PiVcBpgUSwBM6W6P$eb780e631461bff6af8bdfb4539f27ad9477f1d1547fbbab4cc5bc0bf2efc15234732910444a2149d02ee1409c340dff6716ec6d5d40af27f6003b5d700bafe8', 'user'),
(229, 'Intan225', 'Widya224@yahoo.com', 'scrypt:32768:8:1$KuzITbaeIXGGIPdJ$f6b4df78a81a55e3ca38f60baa1165df2b7417ba6b0d0d44d701a6b37cd6d52d4faebbc5748e34e2085917aecc452d01d94fb073fcb125e8218d1e703dbb16b7', 'user'),
(230, 'Diah226', 'Intan225@gmail.com', 'scrypt:32768:8:1$54KHLUmuQeawIth4$17021fb5767ff7f2e0d22046714dc1295e39e54228fd0e00b28c471127661c262dc00edf387ff6fbcc6b6a1df827f40ee6b2e622d90539613236af3b36c14cf9', 'user'),
(231, 'Agustina227', 'Diah226@uho.ac.id', 'scrypt:32768:8:1$lixy8SY244O6GkaX$3e455faf863996564c799a5dca0ee7e297c12780f8707cf24316a6ef6f39b7e23a77b113dec5a6146ae12570966b4bd2f1e93a6b78e79f73919a330f0a479954', 'user'),
(232, 'Rini228', 'Agustina227@yahoo.com', 'scrypt:32768:8:1$wFM9t1t6XzN9yfw7$57087422450aa23b6334ff3ee6d9ba4d7a8d5cf4627f5d14599d8c2c7d9c48bb02c3957d011a10725eae22845abe50fdbc08625785588ccab9911d8514a6233d', 'user'),
(233, 'Yulia229', 'Rini228@gmail.com', 'scrypt:32768:8:1$oGLxPnMjSOPDladb$9ceeac170e83a1d4deca93f22ccd5657d8e2a5d498099d105c067d1d8f7e89fcd9f6437ea93cf7d0503779fed8d9a976122551133d0ce82d5c1952727dc3ec54', 'user'),
(234, 'Puji230', 'Yulia229@uho.ac.id', 'scrypt:32768:8:1$CG0804LjM3LSQ4zl$1b2f608476bd64543f7aa321006c8b55bbfdba821c4d65e56f3e17209d7b2d3d7d7d575cdf46234af1818ec7624c549bdffb50d49dd0adcd9c2d8caf241590bc', 'user'),
(235, 'Utami231', 'Puji230@yahoo.com', 'scrypt:32768:8:1$6a5Okfi7tcbIZu6Q$927a53c3db00065441c4859549dd49545fbf49227d7fd8238df544963e89853afd683daee7b5a3a44d9512ced5f1e976a9fe7a00da481ef34aae823898b955e8', 'user');
INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`) VALUES
(236, 'Amalia232', 'Utami231@gmail.com', 'scrypt:32768:8:1$SshXGnJQvqlsIURX$f917bdab3f67bd880341d394facffb35c5aeda1e41366d8259aef1cafce1d8a7222baed1cc2ccedaaaf5399edac077d5093bf68c5c647cfaad5c5254884b5ced', 'user'),
(237, 'Dina233', 'Amalia232@uho.ac.id', 'scrypt:32768:8:1$dJ62mrAWSXU2zljw$e4a076d77b1b4800b260ab3a033f1357dc9872fb1448cf2e78073a77ad3ceb228d0f4626852c6413144692c0f33a3f37967e076239b854693305b2d549ce441d', 'user'),
(238, 'Dini234', 'Dina233@yahoo.com', 'scrypt:32768:8:1$wLlm3qQmaCROaERL$321857cdeec73560c95c56c7a00931bbd1b480fc8e92936bb132f170142b2370689cd518d1e1347a26026e7cc666a2981addf5054373ddb0e7ab4e400ef981cb', 'user'),
(239, 'Devi235', 'Dini234@gmail.com', 'scrypt:32768:8:1$8x48ENixaHTDkLut$ed4b03a29aa7f5246248aab6e584bed967c1cd9bf9d15127752c3a0c50a9771712772256d814bd9e951bf73ef31f5a9d3546e6f4357522dfcb02179101232b4d', 'user'),
(240, 'Citra236', 'Devi235@uho.ac.id', 'scrypt:32768:8:1$6Z8J7uvKLyqI9pdB$3925a99f13629f713eec695c5bd3a34553abc4443678808cff8e5e508b8e44e63e7a50957186e4e37b565a14ee3b297e67972a2acae3b5a996df0d305babcc6c', 'user'),
(241, 'Eva237', 'Citra236@yahoo.com', 'scrypt:32768:8:1$O3nDftS8sU23bMtH$48524f8a9f5743f9dab80421c7729f6bd389ac47b049c94095e1f65affc3bbb4183b7f487304e7068b7445ad6a4066ac98b09bfe5512a35dc7a4de3c31758bee', 'user'),
(242, 'Endah238', 'Eva237@gmail.com', 'scrypt:32768:8:1$NDPWEpSDIACp1nwZ$72d48c94bad5a9ca6c36bc0dd561961dd3e9d2ce5894130a39abaf4367fe7341d6e0e6a0f9974dbfba41fe00df963137015cef69ed2318660e33c2640941922b', 'user'),
(243, 'Novi239', 'Endah238@uho.ac.id', 'scrypt:32768:8:1$ggEoAzKsB5O9u1Mf$146d229141ac326955dd8231e4862728915a37ad670eb530bda1649a754245fbb83ba65c8166d834578a22165203b6944a04f24ec1da97af6bb8ebddac674cfe', 'user'),
(244, 'Irma240', 'Novi239@yahoo.com', 'scrypt:32768:8:1$URWRU4nXh6zOIHBP$b73f5cb46fe95d6591a25e6aa8a3b69a542c944c74ecc130a9e326212e336b068c2e2915dc6534cac20c81b76a6054619912aea64dd46a29f33b1e702edb4363', 'user'),
(245, 'Astuti241', 'Irma240@gmail.com', 'scrypt:32768:8:1$kyw6pNOYlmtkhzzT$1e0c0dfe9dc9cf27eec293fa0a1925f2d09b15fba6c1ee73c7ea49b7291899329e378006e5e29db2582542b489db277bfc770b293a46b5741eaf3558bcbbff40', 'user'),
(246, 'Aulia242', 'Astuti241@uho.ac.id', 'scrypt:32768:8:1$O8PwVIoncPYCg9gE$1697cdd02c841474c32fd94cfc3395e2330190cb60caa80e7bdb97b932971ed5a07b996b6ce03eaca948509ee3cc816628e3bc3ab3e4c8e97f675030b1e7cddc', 'user'),
(247, 'Amelia243', 'Aulia242@yahoo.com', 'scrypt:32768:8:1$QTTqgxehDv5WF8FD$ca8d221a9253efd86035910426cecc38ea75d00ee22f0f32fd7d2859a612680f18b0ffc24a02d16219952cb09676c3d7202ad9a18b663e2c5370cdefc29515a7', 'user'),
(248, 'Anggraini244', 'Amelia243@gmail.com', 'scrypt:32768:8:1$Lmc1SDEV8sYxE862$932938d674c08c762a8e09d2381fe612e8b8ffd60bf16d4714eb2e01f6fa2cb87eda889d2c9974b227e1713fc1486137c021c3aa39abf20855f7b164d7456e24', 'user'),
(249, 'Wulan245', 'Anggraini244@uho.ac.id', 'scrypt:32768:8:1$INXjbqt54UMkA42g$95214839d060de56e554eddfe887ae82f0d71d51236cfdb706201937f76e30e340a87eaf951ee66378197cafb60fc83a25920c3d00a5d99347864f7dc852660f', 'user'),
(250, 'Indah246', 'Wulan245@yahoo.com', 'scrypt:32768:8:1$KXvvBAZY3hy5nEFs$9870ab5be7b1466e49fd8e7eabcba5dc5561550da80dc47bb41728e6a163f823bada99bc835d3ac054edde64ef89f636a9811d86e57f5255d154c2711258bcca', 'user'),
(251, 'Yuni247', 'Indah246@gmail.com', 'scrypt:32768:8:1$rhv1RotXITvAyPRQ$018c29fbc4dceda2bd349015018a3dc116aaacdea299c34b90c67ab87f471ca3066f49f743912b0b333d409e2d280c3d26552009129fe2ea7fcf4d311d80ecde', 'user'),
(252, 'Dinda248', 'Yuni247@uho.ac.id', 'scrypt:32768:8:1$SV8Qg7uUFx9oHIPH$650f885c94514f005b6fd09df715afa548a469b5ec8c2b27896ba2189f902f35b66ef3bdf96fcff4b4b57f2d6e76ddae044cbdcdb9a04e681eb248386ce26c8a', 'user'),
(253, 'Annisa249', 'Dinda248@yahoo.com', 'scrypt:32768:8:1$byhGfDtzMpkxjxbk$0c6460885b3077e6c3279e5083858b4f4ea120946d80bea8e44f563e2cfe6ab7398b0d1d2bc2a5dca3755ed56ccb1cedf21f18394e15bc7fdc9abe7fca10168a', 'user'),
(254, 'Dewi250', 'Annisa249@gmail.com', 'scrypt:32768:8:1$cxS4oUZJ5rBHMh3J$5fb8d687df2d78996e16bfa74e11de4afd49fad5518f2b1a9b795ab65d2b970e8e032dc5f09856f054aab24c0a31efe2385f14e5d1727245ca313029af157f58', 'user'),
(255, 'Desi251', 'Dewi250@uho.ac.id', 'scrypt:32768:8:1$hyQkSeNnpnzHqsSw$70b41f1256db2a491f141dbf85fa14768f592be98169d88df37606e8db55eeeffe77e005582057e4fe8e021b67f7142eacf263af4b8b399fceb529bd20d08253', 'user'),
(256, 'Putri252', 'Desi251@yahoo.com', 'scrypt:32768:8:1$nUAZMraO9sbtXSt6$abbd84591b7e7f8d009760bd161be1f1be7089a6754aa469b57e0b687b76f12d7bb6f2984d49fc0f579ce6802406706ced26944758ca565a219ec2c14eceb68a', 'user'),
(257, 'Ratna253', 'Putri252@gmail.com', 'scrypt:32768:8:1$C00hm6DOnGVjAfhl$b1bf9ce87106732fa674464ef5ed701baa6517dffa3a568950831e1c18bab2147f02cc062d02bad3d38063fec470901a78c9e14ace631707ee7a3598670753e4', 'user'),
(258, 'Fitri254', 'Ratna253@uho.ac.id', 'scrypt:32768:8:1$Ynqq3R3kVmStlKlF$cf25847847d77d3a81405ba4e5f52a30193544f84885c384acc92df2bd9efb5ac5f2335faf0b38674bd7b7129666f95305830bff67dd4c53acb51d5e66f96c26', 'user'),
(259, 'Nurul255', 'Fitri254@yahoo.com', 'scrypt:32768:8:1$0yhw3QVIDmCPOvRV$eb45137ed3bddbb251a630ae19a4ca39d3e7e5c275bfe9b3c7a58b6d2d230565988320228af3b0c70389b4b51458b346f3b09c9a20d44438b2a5ffb9062f13a1', 'user'),
(260, 'Ani256', 'Nurul255@gmail.com', 'scrypt:32768:8:1$hJQBhFaBY5n4Zw0z$8cc27c4020bc8140e217520a768aefe98418e489aa589c506cb43fd6543e701f8c2be82b17e12f4c4b1badc4014ac0b7db16eb03689552b7d5b8e68f2905d2c4', 'user'),
(261, 'Puspita257', 'Ani256@uho.ac.id', 'scrypt:32768:8:1$5GHSPDAoHVzBUGxT$2cfd52c75b53ebf3f154d8a98556a7d21ae3e65e765067e62626abc9514bf016dc37a690ad8ba1b3bf52ed3885e58f1f421bc7dacdce32eeeb7025f18e51e5b5', 'user'),
(262, 'Maria258', 'Puspita257@yahoo.com', 'scrypt:32768:8:1$bOSbsUFcfiE2h64X$4143a31a700b5b1bed7222a4c703063f9fdb75bce9b88b78cc43f3e7fef757df4a18d478dab8a40ec0485e0ba5f7fa95615b9baf5aeda36138a58371d26e3211', 'user'),
(263, 'Ratih259', 'Maria258@gmail.com', 'scrypt:32768:8:1$6aPfAmQ3Tc0W3jYe$89e6dd98e33b392cfaa359340410dca08ec44fa36b6b678949688cbd52078b9a427af9c59937a3fd0add7d2d63589efbeec08d5c2d311bc9550dcb02ea858863', 'user'),
(264, 'Kartika260', 'Ratih259@uho.ac.id', 'scrypt:32768:8:1$4dnnZiPjVfbBc8zy$b0afd1a0988d5d06d82771ff4817a3b90fb1c6660d1bff533375bec70318fbfcef42dd6cf79b97223db9180f7132c68bf7ed4ca14c92854f60118e3abf03e347', 'user'),
(265, 'Wulandari261', 'Kartika260@yahoo.com', 'scrypt:32768:8:1$8hGYHTzvTYHeqx9c$70ef88a389f0ff5cdb65d47e136dfff3027f8cba0f1768490d5676a111948edb49161bd4ac83e9ed6918e4964ea2d0bb90f0666dfdae2caeb23c8b8b5a3ff447', 'user'),
(266, 'Lestari262', 'Wulandari261@gmail.com', 'scrypt:32768:8:1$v73rzquKippOF7J5$92b8f8ff3f0f3d4196097b6e2610ee2179f61464fe114bd5b0a4a8f119fc0b230cb12b44098624e5e5bbab886db45188cbfe849b4a5c23490faee348591d26ba', 'user'),
(267, 'Agus263', 'Lestari262@uho.ac.id', 'scrypt:32768:8:1$cPrtrCECjryiHw45$e6e8654346cc6df0dad911235912130e55dfb96fa58bbb8ed94037b855b27b2cb39af59279ee1b7e2f9cc53b32f4f6c3e0839e77361e13cf942d7e1b06ae926e', 'user'),
(268, 'Asep264', 'Agus263@yahoo.com', 'scrypt:32768:8:1$IXVuzd7M7N6Ds8l0$bb7287692010e51b9972eef9df97796f7c4778018af1609909c61ef62a336cfde6e4036e93c0791abbad51056f15dd054640996e0335f66d1eea0c2b0ca1281e', 'user'),
(269, 'Wawan265', 'Asep264@gmail.com', 'scrypt:32768:8:1$3INUCgOPt8ZNswvb$d0729c62dc35f439b8a787a6e9d4dc5d046c444c7aeb8edfb438a26148a7d6028db2343c5448b15d12ae866b6f50b14047b8e66f82b08e32831d7c46ed316734', 'user'),
(270, 'Budi266', 'Wawan265@uho.ac.id', 'scrypt:32768:8:1$8lhTTQtU4jMOIpst$483a8812bfbf4b739cfde72275edec99027d09007e4481406c17bf94dd8cec643818c93d7c2df0bba418533024d651f187adb685fa43b75ec95c877f93d5dc04', 'user'),
(271, 'Bambang267', 'Budi266@yahoo.com', 'scrypt:32768:8:1$IiFztxAqjPlRmYAd$083d9949713166481681dde4a0c1fa58b6ff77eee8ade616bf26b895e57404a144dd700db1cd8f22956da5982975ae80a7b6ee087b59664241deb3bd8c1e07b1', 'user'),
(272, 'Slamet268', 'Bambang267@gmail.com', 'scrypt:32768:8:1$wSAsH10GaSXDRpQ4$380ca7d7077241c1fd88310a544fd729b96e2bce069c5ba35735fbc32b33a16e4ca965e7c2ef9991eda2309944fe0607312c2ff95a5d69b13e6583de0c9c7e87', 'user'),
(273, 'Udin269', 'Slamet268@uho.ac.id', 'scrypt:32768:8:1$uCsN9wR3ACpClqhS$f04f2c1618f423e4f56911a0794952649fe76caf78d39d8115018ba34f82608c57edd2189ca5b3b57e1d349e5c89dc142c6ff6644dc2545c266279227989691a', 'user'),
(274, 'Yadi270', 'Udin269@yahoo.com', 'scrypt:32768:8:1$ChxHcJwUT10oEVap$f9ab1c437ce5beefa1125e35e1a61123d4a1711ea8b63c89ced1dc55ef56cba172fff9718b6dfa1d3dfe59f3a78c93758165a9dc3f60472218a722790860ad42', 'user'),
(275, 'Yono271', 'Yadi270@gmail.com', 'scrypt:32768:8:1$iXpKLrqnFirpC56o$a10907c6d3c09c5679d327892c4512309913a4ebd3eef7763d1dd01ef261f1182b2f1c60708a330e02cba5244e2b86cb420046787818b056c45c8c456efbe573', 'user'),
(276, 'Dadang272', 'Yono271@uho.ac.id', 'scrypt:32768:8:1$X1IC0OoTEGQb3NPN$644ab46c32d918624b8dbb80409aff9d25deed996df34db1e62a6d5a70401c9d9f9a8735fc0c6ff12505e69fc4d8d75b07df07662df09c97e45ced30d7f13368', 'user'),
(277, 'Supri273', 'Dadang272@yahoo.com', 'scrypt:32768:8:1$9t0vzAIsT4fQFv4i$3980a22894dc32ec4e93182fd85dde6a270fa32d16699022939a77c349d56f267c4d0b793a11391adc3e07272eebf919d23ede982c3d79b4dccfb01287e13cdb', 'user'),
(278, 'Amin274', 'Supri273@gmail.com', 'scrypt:32768:8:1$z3MojOdNAAU4dSI6$eb8a888a78da9d9fe5070018a1fc134fa63b64116c301caa132e2479d40e18faed4f4cc456b8480019747877237c025a2e3b6965003bf40fbe944281064a2714', 'user'),
(279, 'Joko275', 'Amin274@uho.ac.id', 'scrypt:32768:8:1$PqxAPanTQiXealZD$f6fb1e6ad1cdab33ab4fd9b08b3568be8f819d2f0757ffb55795b923c186760b7814e2f1eb4ece4e0ad858fc7dd3f0aca5b272d121e442aa3f9387fb392f6f9f', 'user'),
(280, 'Saiful276', 'Joko275@yahoo.com', 'scrypt:32768:8:1$dqcuDwBhUcrZopiR$cbff25738fe7f634da8082c7f5b6065712b72f15cde04c253284f213927593cde2074a4d03956cb3869527ca4983bccb51a425031b7326c1315482de72f13f33', 'user'),
(281, 'Muhammad277', 'Saiful276@gmail.com', 'scrypt:32768:8:1$zkimCDKSf6BOk1Fp$ac643902253a0d91a3d5f446f045b23bd58876fb9f08ffd5a7c23105b61165afbdd7d12d8068d69b58ea89358077289d38e30b266dae4bb332ba40965e640a83', 'user'),
(282, 'Putra278', 'Muhammad277@uho.ac.id', 'scrypt:32768:8:1$F52ZKlptvXh7JPo0$2ebd4a174108e0f66417d30c09e40706986f3f08bd4d50460552fff7076f48300dedb3201f748f348088a3be87c2afdb49970d349bc1762306b37aa37f177e6a', 'user'),
(283, 'Dimas279', 'Putra278@yahoo.com', 'scrypt:32768:8:1$fsGmNQmtA21d0gaF$68a4f53e90675ff60dea3b80a0f47922882716cb7bbd68447fe180cdaffbab8abae53243402d601362f34316903f851917bd075a2f4ffd2b8a1501215c6b2f97', 'user'),
(284, 'Wahyu280', 'Dimas279@gmail.com', 'scrypt:32768:8:1$Oy7JJ2imNWPZFzG9$9c015020174b71f60e2ee3dc335cb514a6083d1d9559bfd75235f6db776bd59bf21c6dfa6bbc897827ba18c3d5d1f11874a9cc5c63a9a944ca93f18d04ccb15c', 'user'),
(285, 'Andi281', 'Wahyu280@uho.ac.id', 'scrypt:32768:8:1$1yypZoGH0X4wFATh$493b5561c2ac7610d0bbd628df0b6329bd32fe67b434aeecdc812600adee657e533f3ee963846b1cf8a2229999ae9f2935f71aa2bc1898528b2aa70cfdbc4ee2', 'user'),
(286, 'Agung282', 'Andi281@yahoo.com', 'scrypt:32768:8:1$aWdp3GubOtVkq60Z$342b30e17f19d96b53f5f6c2d99d2c2f2b4e8292d8db9a0c62e2f2013f72d46f52ab309db089ad7bb4e1e4e184288a0a91920bca21699270b50ade86cf849a51', 'user'),
(287, 'Fandi283', 'Agung282@gmail.com', 'scrypt:32768:8:1$g8idnoJi0SdBGyVN$0d783d2b9516fbf81c3ca58141263c6c69b7e28f1d30ff0643694d584343a687578e853e67dd4e816952fc52dcc099fbad43af399a64705679ed0ef54c9f59b7', 'user'),
(288, 'Nurhayati284', 'Fandi283@uho.ac.id', 'scrypt:32768:8:1$wCvY9tDOg9OBroSJ$f18caf5579685eb3fd6391b2ac6317886daad0a89d8635c7403db326c007b26f412dfbddf20584d195198b5eabc9e0527faf29ab77c3093bb27a4352371e10a9', 'user'),
(289, 'Sulastri285', 'Nurhayati284@yahoo.com', 'scrypt:32768:8:1$olqI2hkRe9HAwHHg$56f634dc889739b9000780d5459a07774fd6bede4db76ce26cf38379f013fd83819412672c60c0711c2c3f458eed046534351105fd710b91bc6ff2e22bef838f', 'user'),
(290, 'Sumiati286', 'Sulastri285@gmail.com', 'scrypt:32768:8:1$2D6lJ5B3GtpVDYzw$bb06ca9a3e0f4e4dc636579a10213489f59135ffb80f9450933579617771a3d5f02530625343c3f786c0208f8195fcdcd1ba30a575a2f2bbf846bd3faeb8975a', 'user'),
(291, 'SriWahyuni287', 'Sumiati286@uho.ac.id', 'scrypt:32768:8:1$NXCXxPJx8jjkkOiX$36736005016d9fcf67a7758771a5102903d45fa95cfcc478f38e13258a124a34291fc52a62e66a5308b02ecc21ddaae0d6a19813d3395e888d5d149fa26104ac', 'user'),
(292, 'Sumarni288', 'SriWahyuni287@yahoo.com', 'scrypt:32768:8:1$VipxN9qa1kUn280W$0a3c29d7e7795b13b7b195156b3c45f7c0547225dbd88b4bd48b7727daed55440190e629d3d00332dcf3b4c934958a50ad0e549998938ce5047d9117da93240a', 'user'),
(293, 'Sunarti289', 'Sumarni288@gmail.com', 'scrypt:32768:8:1$pwp9ogS50mCSjcCi$fd2caa82201d683a2caf59843f50c1dfce48d64b9ac27266b4e4d8ce8e326bd4de8f689a4ab0cdf3ffc51c322fe32150b6480bf1e63bfa71545a93128fa0a0e4', 'user'),
(294, 'SitiAminah290', 'Sunarti289@uho.ac.id', 'scrypt:32768:8:1$dKhHvvD4uRhEaQ1a$190982aa44e1834ae4c5c10e3f5fb2339e2ae3c878dac2c287e7468db81028c315584e8198054a82db8035a4bbef1292ddbbcb1ec89b794937ae6327af791e4b', 'user'),
(295, 'Ernawati291', 'SitiAminah290@yahoo.com', 'scrypt:32768:8:1$d8X5ZDbz5dnrmZEf$9e5fa31cf87be3ad0d5d971a365c4618c59322ceca46705bb6777b5a469fce68361c31a93533e011b613073d5bf9851ad8853e1ee2bf8408cc9875bad559d0a2', 'user'),
(296, 'Rahayu292', 'Ernawati291@gmail.com', 'scrypt:32768:8:1$FqzHiRHYDESzArZ6$07982ea6de05a619f4a7a3217e7eff55d87c2db8fff6c4fba3250f747a82d5a33c121a75ad40b1de541728931b8142bf6dea9583e31793382a3f6173d4d36db1', 'user'),
(297, 'Yunita293', 'Rahayu292@uho.ac.id', 'scrypt:32768:8:1$G2h8JhFKCWdvsjvi$9932557ddb9628e159f7356527ce94c390d3bcc33b601af43d8af88be6231638ca9679e7f3dc81f86ea5c453c519c4a3e9d62b3ebef75668f266ddf404b5c8ee', 'user'),
(298, 'Rina294', 'Yunita293@yahoo.com', 'scrypt:32768:8:1$SfbclEzp8Zfvxtye$00c9ae8adc9a0762fe89f8e370bc72872dda98b2a6ea58d4b7f1f7d995867c0138f2f11a9de1ff263d5c863a7bae14cad67bedd3063be497dab265ca1ec0d171', 'user'),
(299, 'Widya295', 'Rina294@gmail.com', 'scrypt:32768:8:1$enzgnuafUmXLcpjT$10a77d7ce6f4a61854ae893e9adc4d741124ab3c4cb313675e47873f916346bea7c4a1738d7730c198a7073c24fde85c7413d377412b4faaa0f191bfb325be9a', 'user'),
(300, 'Intan296', 'Widya295@uho.ac.id', 'scrypt:32768:8:1$7xOPwL4XgFPMbx68$a96ea9dbfea484577a358843c36834a116172bc5cf03a9f2a642d01ca67987c9d266ae17e3ca14e093ae46c456a01ff42ca58121c5022d88bddb37b77f361453', 'user'),
(301, 'Diah297', 'Intan296@yahoo.com', 'scrypt:32768:8:1$pm3GRtnqlIdTxQum$1ac2550e1d19ad85326978d552432390d589e1847764e5a059a93abea22312153370665cc1b92008a3014ca2761dc4046955b4d4f9082b3959310f3fe3048409', 'user'),
(302, 'Agustina298', 'Diah297@gmail.com', 'scrypt:32768:8:1$iCFxqwKb61l3rlNC$209edfa1f2f35332dab5d87486c4f6e0ed3017a80c9f5f2aaa08ee174accfafc6ca8c1c264c15fcd73753d165c3e4996e12fa9ddeb0eb75f6a52963d3656bec6', 'user'),
(303, 'Rini299', 'Agustina298@uho.ac.id', 'scrypt:32768:8:1$MdbiAoX07dGNPWXm$ec59678471f04958e789316932c093515e3707d4cb65aa6c2b5f5e992e9be72c4dd2a18984f271ac4e8e360d5bbe748e9b767b1e85d5d59fad7cb8f20f5a501b', 'user'),
(304, 'Yulia300', 'Rini299@yahoo.com', 'scrypt:32768:8:1$KzENlTk9AUiDQKbE$25c05b2e619f559caf5fbc7d5db9b71e3a6b999331a3688dbb3b7f4d821f1b9149a6942841c4000fe4ef877df0410e09792da53d821343c7da71ad0cafe0063e', 'user');

--
-- Indeks untuk tabel yang dibuang
--

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=598;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
