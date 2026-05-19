import sqlite3
from flask import g
import os

DB_PATH = os.path.join(os.path.dirname(__file__), "logs.db")
SCHEMA_PATH = os.path.join(os.path.dirname(__file__), "schema.sql")


def get_db():
    if "db" not in g:
        g.db = sqlite3.connect(
            DB_PATH,
            detect_types=sqlite3.PARSE_DECLTYPES
        )
        g.db.row_factory = sqlite3.Row
    return g.db


def close_db(e=None):
    db = g.pop("db", None)
    if db is not None:
        db.close()


def init_db():
    db = sqlite3.connect(DB_PATH)
    with open(SCHEMA_PATH, "r", encoding="utf-8") as f:
        db.executescript(f.read())
    db.close()
    print("[OK] Database initialized using schema.sql")


def init_db_command(app):
    @app.cli.command("init-db")
    def initdb_cmd():
        init_db()
        print("Database created!")
