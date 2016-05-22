from system.core.model import Model
import re
from datetime import datetime
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')
from flask.ext.bcrypt import Bcrypt

class usersmodel(Model):
    def __init__(self):
        super(usersmodel, self).__init__()


    def add(self, info):
        pw = info['pw']
        # hashed_pw = self.bcrypt.generate_password_hash(pw)
        df=datetime.strptime(info['birth'],'%m/%d/%Y')
        query = "INSERT into users (name, alias, email, pw, birth, poked) values(:name, :alias, :email, :pw, :birth, 0)"
        data = {'name': info['name'], 'alias': info['alias'], 'email': info['email'],'pw':info['pw'], 'birth':df.strftime('%Y-%m-%d %H:%M:%S')}
        return self.db.query_db(query, data)


    def login(self, info):
        pw = info['pw']
        email = info['email']
        query = "SELECT * FROM users WHERE email = :email LIMIT 1"
        data = {'email': email}
        user=self.db.query_db(query, data)

        if user:
            # if self.bcrypt.check_password_hash(user[0]['pw'], pw):
            if pw == user[0]['pw']:
               return user
        return False

    def poke(self, info):
        query="select * from users where id=:id limit 1"
        data={ 'id':info['user_id'] }
        user=self.db.query_db(query, data)
        poked=int(user[0]['poked']) + 1
        insert="UPDATE users SET poked=:poked where id=:user_id"
        insertdata={'poked':poked,'user_id':info['user_id']}
        self.db.query_db(insert, insertdata)
        pokequery="INSERT into pokes (user_id, poked_id) values (:user_id, :poked_id)"
        pokedata={  'user_id':info['user_id'],
                    'poked_id':info['poked_id']
                    }
        self.db.query_db(pokequery, pokedata)
        return

    def users(self):
        query="select * from users"

        return self.db.query_db(query)

    def pokecount(self, id):
        query="SELECT count(pokes.user_id) as total, users.name as hittername, pokes.poked_id as hitter from users left join pokes on users.id=pokes.poked_id where pokes.user_id=:id group by users.name order by total desc"
        data={
            'id':id
        }
        return self.db.query_db(query, data)
