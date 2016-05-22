from system.core.controller import *
from time import strftime
import re
from datetime import datetime
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')
from flask.ext.bcrypt import Bcrypt

class users(Controller):
    def __init__(self, action):
        super(users, self).__init__(action)

        self.load_model('usersmodel')
        self.db = self._app.db


    def index(self):

        return self.load_view('index.html')
    def register(self):
        error=False
        if len(request.form['name']) < 2:
            flash('name should be longer than 2 letters')
            error=True
        if len(request.form['alias']) < 2:
            flash('name should be longer than 2 letters')
            error=True
        if not EMAIL_REGEX.match(request.form['email']):
            flash("email not valid!")
            error=True

        if len(request.form['pw']) < 2:
            flash("password should be longer than 2 letters!")
            error=True
        if len(request.form['birth']) < 1:
            flash("birth date should not be empty!")
            erro=True
        pw = request.form['pw']
        cpw = request.form['cpw']
        if cpw != pw:
            flash("pw doesn't match you idiot!")
            error=True
        if error == True:
            return redirect('/')
        info={
        'name':request.form['name'],
        'alias':request.form['alias'],
        'email':request.form['email'],
        'pw': request.form['pw'],
        'birth':request.form['birth']
        }
        self.models['usersmodel'].add(info)
        flash("REGISTRATION SUCCESFUL")
        return redirect ('/')

    def login(self):
        email=request.form['email']
        pw=request.form['pw']
        info={
        'email':email,
        'pw': pw
        }
        user=self.models['usersmodel'].login(info)


        if user==False:
            flash('invalid email or password')
            return redirect('/')
        elif user:
            session['userid'] = user[0]['id']
            session['name'] = user[0]['name']
            session['email']=user[0]['email']
            session['alias']=user[0]['alias']
            session['status']=True
            return redirect('/home')

    def logout(self):
        session['email']=[]
        session['username']=[]
        session['name']=[]
        session['userid']=[]
        session['status']=False
        return redirect ('/')

    def poke(self):
        info={
        'user_id':request.form['user_id'],
        'poked_id':session['userid']
        }
        self.models['usersmodel'].poke(info)

        return redirect ('/home')

    def home(self):
        id=session['userid']
        users=self.models['usersmodel'].users()
        pokes=self.models['usersmodel'].pokecount(id)


        return self.load_view('pokes.html', users=users, pokes=pokes)
