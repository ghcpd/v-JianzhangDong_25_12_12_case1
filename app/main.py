def greet(name: str) -> str:
    msg = "Hi " + name
    # FIXME: placeholder marker
    return msg

def create_app():
    def app(environ=None, start_response=None):
        start_response and start_response('200 OK', [('Content-Type', 'text/plain')])
        return [b"Hello"]
    return app

app = create_app()
