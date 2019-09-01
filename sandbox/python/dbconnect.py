import dataset

DB_HOST = 'host'
DB_USER = 'user'
DB_NAME = 'db_name'
DB_PASSWD = 'pass'

DATABASE = 'mysql://%s:%s@%s/%s' % (DB_USER, DB_PASSWD, DB_HOST, DB_NAME)


def main():
    db = dataset.connect(DATABASE)
    results = db.query('SQL SELECT')
    all_ids = [r.get('id') for r in results]


if __name__ == '__main__':
    main()
