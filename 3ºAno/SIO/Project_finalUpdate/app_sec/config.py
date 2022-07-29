class Config(object):
    DEBUG = False
    TESTING = False
    CSFR_ENABLED = True
    SECRET_KEY = 'ljdshfkdsjhfksdfdfsdfsdfsdf' # TODO: Change secret key
    SQLALCHEMY_TRACK_MODIFICATIONS = False

class DevConfig(Config):
    DEBUG = True
    ENV = 'development'
    DEVELOPMENT = True
