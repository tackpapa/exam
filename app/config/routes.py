"""
    Routes Configuration File

    Put Routing rules here
"""
from system.core.router import routes


routes['default_controller'] = 'users'
routes['POST']['/login'] = 'users#login'
routes['POST']['/register'] = 'users#register'
routes['GET']['/logout'] = 'users#logout'
routes['POST']['/poke'] = 'users#poke'
routes['GET']['/home']= 'users#home'
