-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';
INSERT INTO "user" (id,created_at,updated_at,email,last_name,first_name) VALUES
	 ('112c10c3-398f-440d-8235-7ef8c7791863','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','asahina-ko@nextinnovation.co.jp','朝比奈','恒介'),
	 ('25292fa9-9d3b-4ece-a40e-6a112759435b','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','yasuoka-mi@nextinnovation.co.jp','安岡','倫哉'),
	 ('292ed8ad-b4cf-4c62-901c-e29279ec1da5','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','yamagami-yo@nextinnovation.co.jp','山上','芳行'),
	 ('3431bd07-e97e-4212-b1b7-716737f54f07','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','hujikawa-ma@nextinnovation.co.jp','藤川','真沙子'),
	 ('388baf10-0280-43ee-9760-6e001860d991','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','ono-ha@nextinnovation.co.jp','小野','遙香'),
	 ('3a7810d9-16b1-4d75-8848-134dc9d2e3c9','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','hueki-ta@nextinnovation.co.jp','笛木','匡正'),
	 ('688bac75-bc91-4344-a6a4-a0a647f3c35a','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','yoshida-ka@nextinnovation.co.jp','吉田','一雄'),
	 ('6faf74a2-2e3a-477e-913f-d509afe91ba1','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','nogi-yu@nextinnovation.co.jp','乃木','湧太'),
	 ('70491804-ee4e-4f5f-8eb1-41b955a62744','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','asahina-yo@nextinnovation.co.jp','朝比奈','燿子'),
	 ('74593ffb-07c0-ee54-79c1-98bf5d9fff83','2023-07-03 01:28:00.997+09','2023-07-03 01:28:00.997+09','system@test.com','システム','ユーザー');
INSERT INTO "user" (id,created_at,updated_at,email,last_name,first_name) VALUES
	 ('77d4dfc7-9d4b-4c6f-ab7f-c6d25d823c04','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','tono-ak@nextinnovation.co.jp','遠野','秋洋'),
	 ('846506b6-cdc8-4ccf-bbfd-28772ac2b385','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','natui-ma@nextinnovation.co.jp','夏井','真琴'),
	 ('88e4780c-dc7e-4359-89e3-648292daebeb','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','ogawa-sa@nextinnovation.co.jp','小川','智史'),
	 ('9f0654c3-3f68-4ae0-b190-61fa320789f0','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','tateishi-ri@nextinnovation.co.jp','立石','リサ'),
	 ('a9766de1-83be-461c-984c-e9dbe147b1a6','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','hosoki-ri@nextinnovation.co.jp','細木','理一'),
	 ('c4d06dc6-eb47-484e-8d20-cd42e9a2258e','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','miyamae-to@nextinnovation.co.jp','宮前','朋華'),
	 ('dbbff5cd-64ef-4036-928c-57eb0a26a1f5','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','hyuga-ta@nextinnovation.co.jp','日向','徹'),
	 ('de610f8c-d5e9-4f1e-b4ab-db5cbcbdecbe','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','sakaguchi-te@nextinnovation.co.jp','坂口','哲也'),
	 ('df6395ca-f8d1-4e05-a1b9-8f843ed35ed9','2023-07-02 19:21:43.68+09','2023-07-02 19:21:43.68+09','kuga-yu@nextinnovation.co.jp','久賀','友紀');
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
SELECT 'down SQL query';
DELETE FROM "user" WHERE id IN (
'112c10c3-398f-440d-8235-7ef8c7791863',
'25292fa9-9d3b-4ece-a40e-6a112759435b',
'292ed8ad-b4cf-4c62-901c-e29279ec1da5',
'3431bd07-e97e-4212-b1b7-716737f54f07',
'388baf10-0280-43ee-9760-6e001860d991',
'3a7810d9-16b1-4d75-8848-134dc9d2e3c9',
'688bac75-bc91-4344-a6a4-a0a647f3c35a',
'6faf74a2-2e3a-477e-913f-d509afe91ba1',
'70491804-ee4e-4f5f-8eb1-41b955a62744',
'74593ffb-07c0-ee54-79c1-98bf5d9fff83',
'77d4dfc7-9d4b-4c6f-ab7f-c6d25d823c04',
'846506b6-cdc8-4ccf-bbfd-28772ac2b385',
'88e4780c-dc7e-4359-89e3-648292daebeb',
'9f0654c3-3f68-4ae0-b190-61fa320789f0',
'a9766de1-83be-461c-984c-e9dbe147b1a6',
'c4d06dc6-eb47-484e-8d20-cd42e9a2258e',
'dbbff5cd-64ef-4036-928c-57eb0a26a1f5',
'de610f8c-d5e9-4f1e-b4ab-db5cbcbdecbe',
'df6395ca-f8d1-4e05-a1b9-8f843ed35ed9',
);
-- +goose StatementEnd
