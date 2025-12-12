from app import main, config

def test_greet():
    assert main.greet("Alice") == "Hello, Alice!"

def test_debug():
    assert config.DEBUG is False

def test_version():
    assert config.VERSION == "2.0"
