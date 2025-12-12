import pytest
from utils import add_numbers

from app import main as app_main


def test_add_numbers():
    assert add_numbers(1, 2) == 3


def test_app_runs_without_exception(monkeypatch):
    # Ensure API_KEY is not 'INVALID'
    import config
    monkeypatch.setattr(config, 'API_KEY', 'REPLACE_ME')
    # Should not raise
    app_main()
