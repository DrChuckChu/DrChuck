import pymysql


class chuckchuDao:
    def __init__(self):
        self.conn = None
    
    def open(self):
        self.conn = pymysql.connect(host='project-db-cgi.smhrd.com', port=3307,  user='DrChuck', password='drchu123', db='DrChuck', charset='utf8')

    def close(self):
        self.conn.close()

    def insert_live(self, dl_id, dl_valuse, dl_result):
        self.open()
        # access
        cursor = self.conn.cursor()
        # sql문
        sql = f"""
            INSERT INTO dr_live(dl_id, dl_valuse, dl_result)
            VALUES('{dl_id}', '{dl_valuse}', '{dl_result}');
            """
        # sql문 실행
        cursor.execute(sql)
        cursor.fetchall()
        self.conn.commit()
    
    def insert_live_none(self, dl_id):
        self.open()
        cursor = self.conn.cursor()
        sql = f"""
            INSERT INTO dr_live(dl_id, dl_result)
            VALUES('{dl_id}', 'Emp');
            """
        cursor.execute(sql)
        cursor.fetchall()
        self.conn.commit()

    def update_upload(self, dp_id, dp_stat, dp_img, dp_values, dp_result):
        self.open()
        cursor = self.conn.cursor()
        sql = f"""
            UPDATE dr_pose
            SET dp_re_img = '/images/resultpose/{dp_img}', dp_values = '{dp_values}', dp_result = '{dp_result}'
            WHERE dp_id = '{dp_id}' AND dp_stat = '{dp_stat}' AND dp_img = '/images/pose/{dp_img}';
            """
        cursor.execute(sql)
        cursor.fetchall()
        self.conn.commit()

